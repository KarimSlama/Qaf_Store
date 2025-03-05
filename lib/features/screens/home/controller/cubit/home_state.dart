import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int carouselCurrentIndex;

  const HomeState({required this.carouselCurrentIndex});

  factory HomeState.initial() {
    return const HomeState(carouselCurrentIndex: 0);
  }

  HomeState copyWith({int? carouselCurrentIndex}) {
    return HomeState(
      carouselCurrentIndex: carouselCurrentIndex ?? this.carouselCurrentIndex,
    );
  }

  @override
  List<Object?> get props => [carouselCurrentIndex];
}
