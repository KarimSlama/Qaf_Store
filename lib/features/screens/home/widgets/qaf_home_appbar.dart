import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';

class QafHomeAppbar extends StatelessWidget {
  const QafHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return QafAppBar(
          title: Column(
            spacing: 7.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QafStrings.homeAppbarTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: QafColors.grey),
              ),
              state.maybeWhen(
                loading: () => QafShimmerEffect(width: 80.w, height: 25.h),
                success: (data) => Text(
                  data.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: QafColors.white),
                ),
                error: (error) => Text(error),
                orElse: () => Text('no name'),
              ),
            ],
          ),
          actions: [
            CartCounterIcon(iconColor: QafColors.white),
          ],
        );
      },
    );
  }
}
