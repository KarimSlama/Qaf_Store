import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/common/widgets/images/circular_image.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/gen/assets.gen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';

class UserProfileTile extends StatelessWidget {
  final VoidCallback onPressed;
  const UserProfileTile({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) {
        if (previous is Success && current is Success) {
          return previous.data != current.data;
        }
        return previous != current;
      },
      builder: (context, state) {
        final cubit = context.read<UserCubit>();
        return state.maybeWhen(
          loading: () => QafShimmerEffect(width: 120.w, height: 30.h),
          success: (user) {
            if (user.fullName.isEmpty && user.email.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<UserCubit>().fetchUserDetails();
              });
              return QafShimmerEffect(width: 120.w, height: 30.h);
            }

            return ListTile(
              leading: CircularImage(
                isNetworkImage: true,
                image: user.profilePicture ?? Assets.images.content.userImg.path,
                width: 50.w,
                height: 50.h,
                padding: 0,
              ),
              title: Text(
                user.fullName,
                style: Theme.of(context).textTheme.headlineSmall!.apply(
                      color: QafColors.white,
                    ),
              ),
              subtitle: Text(
                user.email,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: QafColors.white,
                    ),
              ),
              trailing: IconButton(
                  onPressed: onPressed,
                  icon: Icon(Iconsax.edit4, color: QafColors.white)),
            );
          },
          uploadImageLoading: () {
            final currentUser = cubit.currentUser;
            if (currentUser != null) {
              return ListTile(
                leading: CircularImage(
                  isNetworkImage: true,
                  image: currentUser.profilePicture ??
                      Assets.images.content.userImg.path,
                  width: 50.w,
                  height: 50.h,
                  padding: 0,
                ),
                title: Text(
                  currentUser.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: QafColors.white,
                      ),
                ),
                subtitle: Text(
                  currentUser.email,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: QafColors.white,
                      ),
                ),
                trailing: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Iconsax.edit4, color: QafColors.white)),
              );
            }
            return QafShimmerEffect(width: 120.w, height: 30.h);
          },
          error: (error) => QafShimmerEffect(width: 120.w, height: 30.h),
          orElse: () {
            final currentUser = cubit.currentUser;
            if (currentUser != null) {
              return ListTile(
                leading: CircularImage(
                  isNetworkImage: true,
                  image: currentUser.profilePicture ??
                      Assets.images.content.userImg.path,
                  width: 50.w,
                  height: 50.h,
                  padding: 0,
                ),
                title: Text(
                  currentUser.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: QafColors.white,
                      ),
                ),
                subtitle: Text(
                  currentUser.email,
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: QafColors.white,
                      ),
                ),
                trailing: IconButton(
                    onPressed: onPressed,
                    icon: Icon(Iconsax.edit4, color: QafColors.white)),
              );
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.read<UserCubit>().fetchUserDetails();
            });
            return QafShimmerEffect(width: 120.w, height: 30.h);
          },
        );
      },
    );
  }
}
