import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/loaders/qaf_shimmer.dart';
import 'package:qaf_store/common/widgets/popups/loaders.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_cubit.dart';
import 'package:qaf_store/features/screens/profile/controller/cubit/user_state.dart';
import 'package:qaf_store/features/screens/profile/widgets/profile_details.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';
import 'package:qaf_store/utils/routings/routes.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => QafShimmerEffect(width: 200, height: 200),
          success: (user) => ProfileDetails(user: user),
          error: (error) => Center(child: Text(error)),
          deleteLoading: () => const SizedBox.shrink(),
          deleteGoogleSuccess: () {
            Future.microtask(() {
              if (!context.mounted) return;
              context.pushNamed(Routes.loginScreen);
            });
            return const SizedBox.shrink();
          },
          deletePasswordSuccess: () {
            Future.microtask(() {
              if (!context.mounted) return;
              context.pushNamed(Routes.reAuthScreen);
            });
            return const SizedBox.shrink();
          },
          deleteError: (error) {
            Future.microtask(() {
              if (!context.mounted) return;
              Loaders.errorSnackBar(
                context: context,
                title: QafStrings.ohSnap,
                message: error.toString(),
              );
            });
            return const SizedBox.shrink();
          },
          orElse: () => const Center(child: Text('No data found')),
        );
      },
    );
  }
}
