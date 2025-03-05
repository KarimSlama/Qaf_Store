import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {

  const factory OnboardingState.initial() = _Initial;

  const factory OnboardingState.pageUpdated(int currentPageIndex) = _PageUpdated;

  const factory OnboardingState.nextPage(int? nextPageIndex) = _NextPage;

  const factory OnboardingState.skipToLastPage() = _SkipToLastPage;
}