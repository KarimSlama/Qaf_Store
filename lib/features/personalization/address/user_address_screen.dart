import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/features/personalization/address/add_new_address_screen.dart';
import 'package:qaf_store/features/personalization/address/widgets/single_address.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
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
