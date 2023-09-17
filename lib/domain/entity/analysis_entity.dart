import 'package:equatable/equatable.dart';
import 'package:sentimentai/domain/enums/analysis_enum.dart';

class AnalysisEntity extends Equatable {
  final AnalysisEnum analysis;
  const AnalysisEntity({
    required this.analysis,
  });
  @override
  List<Object?> get props => [analysis];
}
