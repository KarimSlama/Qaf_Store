import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/personalization/profile/widgets/profile_menu.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QafAppBar(
        title: Text(QafStrings.profile,
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsDirectional.all(QafSizes.defaultSpace),
          child: Column(
            spacing: QafSizes.spaceBtwItems / 2,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  spacing: QafSizes.spaceBtwItems / 2,
                  children: [
                    CircularImage(
                        image: Assets.images.content.user.path,
                        width: 80.w,
                        height: 80.h),
                    TextButton(
                        onPressed: () {},
                        child: Text(QafStrings.changeProfilePicture)),
                  ],
                ),
              ),
              Divider(),
              SectionHeading(
                  text: QafStrings.profileInformation, isActionButton: false),
              ProfileMenu(
                  title: QafStrings.name, value: 'karim slama', onTap: () {}),
              ProfileMenu(
                  title: QafStrings.userName,
                  value: 'karim_slama_0',
                  onTap: () {}),
              Divider(),
              SectionHeading(
                  text: QafStrings.personalInformation, isActionButton: false),
              ProfileMenu(
                  title: QafStrings.email,
                  value: 'karimslama@gmail.com',
                  onTap: () {}),
              ProfileMenu(
                  title: QafStrings.userID,
                  value: '45967',
                  icon: Iconsax.copy,
                  onTap: () {}),
              ProfileMenu(
                  title: QafStrings.phoneNumber,
                  value: '01095856941',
                  onTap: () {}),
              ProfileMenu(
                  title: QafStrings.gender, value: 'Male', onTap: () {}),
              ProfileMenu(
                  title: QafStrings.dateOfBirth,
                  value: '1 Mar, 2002',
                  onTap: () {}),
              SizedBox(height: QafSizes.spaceBtwItems / 1.4),
              Center(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      QafStrings.closeAccount,
                      style: TextStyle(color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
