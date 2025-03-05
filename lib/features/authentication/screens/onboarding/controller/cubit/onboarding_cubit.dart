import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qaf_store/features/authentication/screens/onboarding/controller/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  final pageController = PageController();
  int currentPageIndex = 0;

  void updatePageIndicator(index) {
    currentPageIndex = index;
    emit(OnboardingState.pageUpdated(index));
  }

  void dotNavigationClick(index) {
    currentPageIndex = index;
    pageController.jumpTo(index);
    emit(OnboardingState.pageUpdated(index));
  }

  void nextPage(context) {
    if (currentPageIndex == 2) {
      emit(OnboardingState.nextPage(2));
    } else {
      int nextPageIndex = currentPageIndex + 1;
      pageController.jumpToPage(nextPageIndex);
      emit(OnboardingState.nextPage(nextPageIndex));
    }
  }

  void skipPage() {
    currentPageIndex = 2;
    pageController.jumpToPage(2);
    emit(OnboardingState.skipToLastPage());
  }
}
