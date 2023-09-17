import 'package:get_it/get_it.dart';
import 'package:sentimentai/data/constants.dart';
import 'package:sentimentai/data/datasource/dictionary_datasource.dart';
import 'package:sentimentai/data/datasource/model_datasource.dart';
import 'package:sentimentai/data/repositories/sentiment_repository_impl.dart';
import 'package:sentimentai/domain/repositories/sentiment_repository.dart';
import 'package:sentimentai/domain/usecases/analyse_sentiment.dart';
import 'package:sentimentai/presentation/bloc/home_bloc.dart';

final instance = GetIt.instance;
Future<void> init() async {
  //bloc
  instance.registerFactory(() => HomeBloc(instance()));
  // usecases
  instance.registerLazySingleton(() => AnalyseSentiment(instance()));
  // repositories
  instance.registerLazySingleton<SentimentRepository>(() =>
      SentimentRepositoryImpl(
          modelDataSource: instance(), dictionaryDataSource: instance()));
  // datasource
  instance.registerLazySingleton<ModelDataSource>(() => ModelDataSourceImpl());
  instance.registerLazySingleton<DictionaryDataSource>(
      () => DictionaryDataSourceImpl());
  // miscallaneous
  instance.registerLazySingleton(() => Constants);
}
