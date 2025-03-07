import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/common/widgets/texts/section_heading.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/widgets/alert_dialog.dart';
import 'package:qaf_store/features/screens/profile/widgets/profile_menu.dart';
import 'package:qaf_store/features/screens/sign_up/data/model/user_model.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_sizes.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/routings/routes.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

class ProfileDetails extends StatelessWidget {
  final UserModel user;

  const ProfileDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              title: QafStrings.name,
              value: user.fullName,
              onTap: () => context.pushNamed(Routes.changeNameScreen)),
          ProfileMenu(
              title: QafStrings.userName, value: user.userName, onTap: () {}),
          Divider(),
          SectionHeading(
              text: QafStrings.personalInformation, isActionButton: false),
          ProfileMenu(title: QafStrings.email, value: user.email, onTap: () {}),
          ProfileMenu(
              title: QafStrings.userID,
              value: user.id ?? '',
              icon: Iconsax.copy,
              onTap: () {}),
          ProfileMenu(
              title: QafStrings.phoneNumber, value: user.phone, onTap: () {}),
          ProfileMenu(title: QafStrings.gender, value: 'Male', onTap: () {}),
          ProfileMenu(
              title: QafStrings.dateOfBirth,
              value: '1 Mar, 2002',
              onTap: () {}),
          SizedBox(height: QafSizes.spaceBtwItems / 1.4),
          Center(
            child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CloseAccountAlertDialog(
                        onPressed: () => context
                            .read<UserCubit>()
                            .deleteUserAccount(context),
                      );
                    },
                  );
                },
                child: Text(
                  QafStrings.closeAccount,
                  style: TextStyle(color: Colors.red),
                )),
          )
        ],
      ),
    );
  }
}
