import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/screens/address/widgets/single_address.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(Routes.addNewScreen),
        backgroundColor: QafColors.primary,
        child: Icon(Iconsax.add, color: QafColors.white),
      ),
      appBar: QafAppBar(
        showBackArrow: true,
        title: Text(QafStrings.addresses,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(isSelectedAddress: false),
              SingleAddress(isSelectedAddress: true),
              SingleAddress(isSelectedAddress: false),
              SingleAddress(isSelectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
