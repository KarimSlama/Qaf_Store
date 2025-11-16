import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/common/widgets/appbar/appbar.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/helper/extensions.dart';

import '../../../common/widgets/loaders/qaf_shimmer.dart';
import '../../../common/widgets/popups/loaders.dart';
import '../../../utils/routings/routes.dart';
import 'controller/cubit/user_cubit.dart';
import 'controller/cubit/user_state.dart';
import 'widgets/profile_details.dart';

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
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const QafShimmerEffect(width: 200, height: 200),
            success: (user) {
              return ProfileDetails(user: user);
            },
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
            uploadImageLoading: () =>
                Center(child: CircularProgressIndicator()),
            uploadImageError: (error) {
              Future.microtask(() {
                if (!context.mounted) return;
                Loaders.errorSnackBar(
                  context: context,
                  title: QafStrings.ohSnap,
                  message: error.toString(),
                );
                context.pushNamed(Routes.settingsScreen);
              });
              return const SizedBox.shrink();
            },
            orElse: () => const Center(child: Text('No data found')),
          );
        },
      ),
    );
  }
}
