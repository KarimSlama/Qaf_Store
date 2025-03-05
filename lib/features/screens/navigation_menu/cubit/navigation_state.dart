import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_state.freezed.dart';

@freezed
class NavigationState<T> with _$NavigationState<T> {
  const factory NavigationState.initial() = _Initial;
  const factory NavigationState.loading() = Loading;
  const factory NavigationState.changed(int index) = Changed;
}