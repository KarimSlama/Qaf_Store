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
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => QafShimmerEffect(width: 120.w, height: 30.h),
            success: (user) {
              return ListTile(
                leading: CircularImage(
                  image: Assets.images.content.user.path,
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
            error: (error) => Text('the error is $error'),
            orElse: () => Text('no name'));
      },
    );
  }
}
