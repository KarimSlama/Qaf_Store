import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/personalization/settings/settings_screen.dart';
import 'package:qaf_store/features/store/screens/home/home_screens.dart';
import 'package:qaf_store/features/store/screens/navigation_menu/cubit/navigation_state.dart';
import 'package:qaf_store/features/store/screens/store/store_screen.dart';
import 'package:qaf_store/features/store/screens/wishlist/wishlist_screen.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  int currentIndex = 0;

  final screens = [
    HomeScreens(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];

  void changeNavigationScreen(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      print('current index $currentIndex');
      emit(NavigationState.changed(currentIndex));
    }
  }
}
