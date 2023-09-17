import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sentimentai/domain/enums/analysis_enum.dart';
import 'package:sentimentai/domain/usecases/analyse_sentiment.dart';
import 'package:sentimentai/presentation/bloc/home_event.dart';
import 'package:sentimentai/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AnalyseSentiment _usecase;
  HomeBloc(this._usecase) : super(HomeEmpty()) {
    on<OnHomeInitialized>((event, emit) {
      emit(HomeEmpty());
    });

    on<OnTextChanged>(
      (event, emit) async {
        emit(HomeLoading());
        print(event.text);
        if (event.text.isEmpty) {
          emit(HomeEmpty());
        } else {
          final result = await _usecase.execute(event.text);
          result.fold(
            (l) => HomeFailure(l),
            (r) => emit(
              r.analysis == AnalysisEnum.Positive
                  ? HomePositive()
                  : r.analysis == AnalysisEnum.Negative
                      ? HomeNegative()
                      : HomeNeutral(),
            ),
          );
        }
      },
      transformer: debounce(Duration(milliseconds: 100)),
    );
  }
  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
