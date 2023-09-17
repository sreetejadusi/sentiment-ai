import 'package:dartz/dartz.dart';
import 'package:sentimentai/domain/entity/analysis_entity.dart';
import 'package:sentimentai/failure.dart';

abstract class SentimentRepository {
  Future<Either<Failure, AnalysisEntity>> analyseText(String text);
}
