import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:qaf_store/features/store/screens/home/home_screens.dart';
import 'package:qaf_store/features/store/screens/store/store_screen.dart';
import 'package:qaf_store/utils/constants/qaf_colors.dart';
import 'package:qaf_store/utils/helper/qaf_helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = QafHelperFunctions.isDark(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            elevation: 0,
            height: 80.h,
            selectedIndex: controller.currentIndex.value,
            onDestinationSelected: (index) =>
                controller.currentIndex.value = index,
            backgroundColor: dark ? QafColors.black : QafColors.white,
            indicatorColor: dark
                ? QafColors.white.withValues(alpha: .1)
                : QafColors.black.withValues(alpha: .1),
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: 'Favorite'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.currentIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> currentIndex = 0.obs;

  final screens = [
    HomeScreens(),
    StoreScreen(),
    Container(color: Colors.green),
    Container(color: Colors.amber),
  ];
}
