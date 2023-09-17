import 'package:dartz/dartz.dart';
import 'package:sentimentai/domain/entity/analysis_entity.dart';
import 'package:sentimentai/domain/repositories/sentiment_repository.dart';
import 'package:sentimentai/failure.dart';

class AnalyseSentiment {
  final SentimentRepository repository;
  const AnalyseSentiment(this.repository);

  Future<Either<Failure, AnalysisEntity>> execute(String text) {
    return repository.analyseText(text);
  }
}
