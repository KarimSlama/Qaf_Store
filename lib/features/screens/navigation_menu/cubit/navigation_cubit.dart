import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/brands/controller/cubit/brand_cubit.dart';
import 'package:qaf_store/features/screens/settings/settings_screen.dart';
import 'package:qaf_store/features/screens/home/home_screens.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_state.dart';
import 'package:qaf_store/features/screens/store/store_screen.dart';
import 'package:qaf_store/features/screens/wishlist/controller/cubit/favorite_cubit.dart';
import 'package:qaf_store/features/screens/wishlist/wishlist_screen.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  int currentIndex = 0;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => getIt<FavoriteCubit>(),
      child: const HomeScreens(),
    ),
    BlocProvider(
      create: (context) => getIt<BrandCubit>()..getAllBrands(),
      child: const StoreScreen(),
    ),
    const WishlistScreen(),
    const SettingsScreen(),
  ];

  List<Widget> get screens => _screens;

  void changeNavigationScreen(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(NavigationState.changed(currentIndex));
    }
  }
}
