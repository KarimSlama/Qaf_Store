import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/screens/cart/controller/cubit/cart_cubit.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/product_cubit.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_cubit.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_state.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/constants/qaf_strings.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = QafHelperFunctions.isDark(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductCubit>()
            ..fetchCategories()
            ..fetchAllBanners()
            ..fetchAllProducts(),
          lazy: false,
        ),
        BlocProvider.value(
          value: getIt<CartCubit>(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar:
            BlocSelector<NavigationCubit, NavigationState, int>(
          selector: (state) => state is Changed ? state.index : 0,
          builder: (context, currentIndex) {
            return NavigationBar(
              elevation: 0,
              height: 80.h,
              selectedIndex: currentIndex,
              onDestinationSelected: (index) =>
                  context.read<NavigationCubit>().changeNavigationScreen(index),
              backgroundColor: dark ? QafColors.black : QafColors.white,
              indicatorColor: dark
                  ? QafColors.white.withValues(alpha: .1)
                  : QafColors.black.withValues(alpha: .1),
              destinations: const [
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
        body: BlocSelector<NavigationCubit, NavigationState, Widget>(
          selector: (state) {
            final cubit = context.read<NavigationCubit>();
            return cubit.screens[cubit.currentIndex];
          },
          builder: (context, screen) {
            return screen;
          },
        ),
      ),
    );
  }
}
