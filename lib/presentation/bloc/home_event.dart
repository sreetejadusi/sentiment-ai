import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnHomeInitialized extends HomeEvent {}

class OnTextChanged extends HomeEvent {
  final String text;
  OnTextChanged(this.text);
}
