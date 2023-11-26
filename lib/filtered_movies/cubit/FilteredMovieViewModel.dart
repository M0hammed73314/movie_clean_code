import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/filtered_movies/cubit/state.dart';
import 'package:movies/model/FilteredMovieModel.dart';

import '../../shared/remote/dio_helper.dart';

class FilteredMovieViewModel extends Cubit<FilteredMovieState> {
  FilteredMovieViewModel() : super(FilteredMovieLoadingState());
  FilteredMovieModel? filteredMovieModel;

  static FilteredMovieViewModel get(context) => BlocProvider.of(context);

  void getFilteredMovie(num? genresId) async {
    DioHelper.getData(url: "discover/movie", query: {
      'api_key': 'c4c3d1e82f8dee40ffdf440f479d9373',
      'with_genres': genresId.toString(),
    }).then((value) {
      filteredMovieModel = FilteredMovieModel.fromJson(value?.data);
      emit(FilteredMovieSuccessState());
      print(value.toString());
    }).catchError((e) {
      emit(FilteredMovieErrorState(errorMessage: e.toString()));
    });
  }
}
