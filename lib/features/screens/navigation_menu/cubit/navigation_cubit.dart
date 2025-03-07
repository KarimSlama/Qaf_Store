import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/screens/home/controller/cubit/home_cubit.dart';
import 'package:qaf_store/features/screens/settings/settings_screen.dart';
import 'package:qaf_store/features/screens/home/home_screens.dart';
import 'package:qaf_store/features/screens/navigation_menu/cubit/navigation_state.dart';
import 'package:qaf_store/features/screens/store/store_screen.dart';
import 'package:qaf_store/features/screens/wishlist/wishlist_screen.dart';
import 'package:qaf_store/utils/dependency_inejction/getit.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial());

  int currentIndex = 0;

  final screens = [
    BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: HomeScreens(),
    ),
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
