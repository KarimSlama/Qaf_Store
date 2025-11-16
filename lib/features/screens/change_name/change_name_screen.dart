import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/validation/validator.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameFormKey = GlobalKey<FormState>();
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text('Change Name'),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(QafSizes.defaultSpace),
        child: Form(
          key: nameFormKey,
          child: Column(
            spacing: QafSizes.spaceBtwSections,
            children: [
              Text(
                'Use real name for easy verification. This name will appear on several pages',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              TextFormField(
                controller: firstNameController,
                validator: (value) =>
                    Validator.validateEmptyText('First Name', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: QafStrings.firstName,
                ),
              ),
              TextFormField(
                controller: lastNameController,
                validator: (value) =>
                    Validator.validateEmptyText('Last Name', value),
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: QafStrings.lastName,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameFormKey.currentState!.validate()) {
                      userCubit.updateName(firstNameController.text.trim(), lastNameController.text.trim());
                    }
                  },
                  child: Text(QafStrings.submit),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
