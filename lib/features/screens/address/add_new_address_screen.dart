import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/screens/address/controller/cubit/addresses_cubit.dart';
import 'package:qaf_store/features/screens/address/widgets/address_bloc_listener.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressCubit = context.read<AddressesCubit>();
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.addNewAddress),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Form(
            key: addressCubit.addressFormKey,
            child: Column(
              spacing: QafSizes.spaceBtwInputFields,
              children: [
                TextFormField(
                  controller: addressCubit.nameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.user),
                      labelText: QafStrings.name),
                ),
                TextFormField(
                  controller: addressCubit.phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.mobile),
                      labelText: QafStrings.phone),
                ),
                Row(
                  spacing: QafSizes.spaceBtwInputFields,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.streetController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: QafStrings.street),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.postalCodeController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: QafStrings.postalCode),
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: QafSizes.spaceBtwInputFields,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.cityController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.buliding),
                            labelText: QafStrings.city),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: addressCubit.stateController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: QafStrings.state),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: addressCubit.countryController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global),
                      labelText: QafStrings.country),
                ),
                SizedBox(height: QafSizes.defaultSpace),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => addressCubit.addNewAddress(),
                        child: Text(QafStrings.submit))),
                AddressBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
