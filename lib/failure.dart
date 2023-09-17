import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ModelFailure extends Failure {
  final String failure = 'Model Failure';
}

class DictionaryFailure extends Failure {
  final String failure = 'Dictionary Failure';
}

class AnalysisFailure extends Failure {
  final String failure = 'Analysis Failure';
}

class MiscFailure extends Failure {
  final String failure;
  MiscFailure(this.failure);
}
