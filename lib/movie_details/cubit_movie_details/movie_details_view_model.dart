import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movie_details/cubit_movie_details/state.dart';

import '../../model/MyMovieDetails.dart';
import '../../model/SimilarModel.dart';
import '../../shared/remote/dio_helper.dart';

class MovieDetailsViewModel extends Cubit<MovieDetailsState> {
  static MovieDetailsViewModel get(context) => BlocProvider.of(context);

  MovieDetailsViewModel() : super(MovieDetailsLoadingState());
  MyMovieDetails? myMovieDetails;

  void getDetailsData(num? id) {
    emit(MovieDetailsLoadingState());
    DioHelper.getData(url: "movie/$id", query: {
      'page': 1,
      'api_key': '261a2d97cdf43345c8e7e990bceda0eb',
    }).then((value) {
      print(value.toString());

      myMovieDetails = MyMovieDetails.fromJson(value?.data);
      emit(MovieDetailsSuccesState());
    }).catchError((error) {
      emit(MovieDetailsErrorState(errorMessage: error.toString()));
    });
  }

  SimilarModel? similarModel;

  void getSimilarData(num? id) {
    emit(SimilarStateLoadingState());
    DioHelper.getData(
            url: "movie/$id/similar",
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      similarModel = SimilarModel.fromJson(value!.data);
      emit(SimilarStateSuccesState());
    }).catchError((error) {
      emit(SimilarStateErrorState(errorMessage: error.toString()));
    });
  }
}
