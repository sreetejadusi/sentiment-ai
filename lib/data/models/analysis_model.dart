import 'package:equatable/equatable.dart';
import 'package:sentimentai/domain/entity/analysis_entity.dart';
import 'package:sentimentai/domain/enums/analysis_enum.dart';

class AnalysisModel extends Equatable {
  final AnalysisEnum analysis;
  const AnalysisModel({
    required this.analysis,
  });

  AnalysisEntity toEntity() {
    return AnalysisEntity(analysis: analysis);
  }

  @override
  List<Object?> get props => [analysis];
}
