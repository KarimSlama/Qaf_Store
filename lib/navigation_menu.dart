import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/home_cubit.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_cubit.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..fetchAllCategories()
        ..fetchAllBanners()
        ..fetchAllProduct(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return NavigationBar(
              elevation: 0,
              height: 80.h,
              selectedIndex: context.read<NavigationCubit>().currentIndex,
              onDestinationSelected: (index) =>
                  context.read<NavigationCubit>().changeNavigationScreen(index),
              backgroundColor: dark ? QafColors.black : QafColors.white,
              indicatorColor: dark
                  ? QafColors.white.withValues(alpha: .1)
                  : QafColors.black.withValues(alpha: .1),
              destinations: [
                NavigationDestination(
                    icon: Icon(Iconsax.home), label: QafStrings.home),
                NavigationDestination(
                    icon: Icon(Iconsax.shop), label: QafStrings.store),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: QafStrings.wishlist),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: QafStrings.profile),
              ],
            );
          },
        ),
        body: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return context
                .read<NavigationCubit>()
                .screens[context.read<NavigationCubit>().currentIndex];
          },
        ),
      ),
    );
  }
}
