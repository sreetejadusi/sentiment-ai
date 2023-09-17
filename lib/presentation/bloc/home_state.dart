import 'package:equatable/equatable.dart';
import 'package:sentimentai/failure.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitialized extends HomeState {}

class HomeFailure extends HomeState {
  final Failure failure;
  HomeFailure(this.failure);
}

class HomePositive extends HomeState {}

class HomeNegative extends HomeState {}

class HomeNeutral extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeLoading extends HomeState {}
