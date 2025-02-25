import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:qaf_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:qaf_store/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderWidget(
              child: Column(
                children: [
                  QafAppBar(
                    title: Text(
                      QafStrings.account,
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: QafColors.white,
                          ),
                    ),
                  ),
                  SizedBox(height: QafSizes.spaceBtwSections),
                  const UserProfileTile(),
                  SizedBox(height: QafSizes.spaceBtwSections)
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
              child: Column(
                spacing: QafSizes.spaceBtwItems,
                children: [
                  SectionHeading(
                      text: QafStrings.accountSettings, isActionButton: false),
                  SettingMenuTile(
                      icon: Iconsax.safe_home,
                      title: QafStrings.myAddress,
                      subTitle: QafStrings.setShoppingDeliverAddress),
                  SettingMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: QafStrings.myCart,
                      subTitle: QafStrings.addRemoveProductsAndMoveToCheckout),
                  SettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: QafStrings.myOrders,
                      subTitle: QafStrings.inProgressAndCompletedOrders),
                  SettingMenuTile(
                      icon: Iconsax.bank,
                      title: QafStrings.bankAccount,
                      subTitle:
                          QafStrings.withdrawBalanceToRegisterdBankAccount),
                  SettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: QafStrings.myCoupons,
                      subTitle: QafStrings.listOfAllTheDiscountedCoupons),
                  SettingMenuTile(
                      icon: Iconsax.notification,
                      title: QafStrings.notifications,
                      subTitle: QafStrings.setAnyKindOfNotificationMessage),
                  SettingMenuTile(
                      icon: Iconsax.security_card,
                      title: QafStrings.accountPrivacy,
                      subTitle: QafStrings.manageDataUsageAndConnectedAccounts),
                  SizedBox(height: QafSizes.spaceBtwSections),
                  SectionHeading(
                      text: QafStrings.appSettings, isActionButton: false),
                  SettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: QafStrings.loadData,
                    subTitle: QafStrings.uploadDataToYourCloudFirebase,
                  ),
                  SettingMenuTile(
                    icon: Iconsax.location,
                    title: QafStrings.geolocation,
                    subTitle: QafStrings.setRecommendationBasedOnLocation,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.security_user,
                    title: QafStrings.safeMode,
                    subTitle: QafStrings.searchResultIsSafeForAllAges,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.image,
                    title: QafStrings.HDImageQuality,
                    subTitle: QafStrings.setImageQualityToBeSeen,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
