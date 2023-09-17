import 'package:dartz/dartz.dart';
import 'package:sentimentai/data/datasource/dictionary_datasource.dart';
import 'package:sentimentai/data/datasource/model_datasource.dart';
import 'package:sentimentai/data/models/analysis_model.dart';
import 'package:sentimentai/domain/entity/analysis_entity.dart';
import 'package:sentimentai/domain/enums/analysis_enum.dart';
import 'package:sentimentai/domain/repositories/sentiment_repository.dart';
import 'package:sentimentai/failure.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class SentimentRepositoryImpl implements SentimentRepository {
  final ModelDataSource modelDataSource;
  final DictionaryDataSource dictionaryDataSource;

  const SentimentRepositoryImpl({
    required this.modelDataSource,
    required this.dictionaryDataSource,
  });
  @override
  Future<Either<Failure, AnalysisEntity>> analyseText(String text) async {
    try {
      final model = await modelDataSource.loadModel();
      final dictionary = await dictionaryDataSource.getDictionary();
      final data =
          text.replaceAll(RegExp(r'[^\w\s]', caseSensitive: false), '');
      var splitted = data.replaceAll('\n', '').replaceAll('\t', '').split(' ');
      List<List<double>> sequences = [
        splitted
            .map((e) =>
                double.parse((dictionary[e] ?? dictionary['OOV']).toString()))
            .toList()
      ];
      sequences[0] =
          sequences[0] + List.generate(120 - splitted.length, (index) => 0.0);
      var output = List.filled(1 * 1, -1).reshape([1, 1]);
      model.run(sequences, output);
      return Right(AnalysisModel(
              analysis: output[0][0] > 0
                  ? (output[0][0] > 0.5
                      ? AnalysisEnum.Positive
                      : output[0][0] < 0.5
                          ? AnalysisEnum.Negative
                          : AnalysisEnum.Neutral)
                  : AnalysisEnum.Neutral)
          .toEntity());
    } on ModelFailure {
      return Left(ModelFailure());
    } on DictionaryFailure {
      return Left(DictionaryFailure());
    } on Exception {
      return Left(AnalysisFailure());
    }
  }
}
