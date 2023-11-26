import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Home/cubit/state.dart';

import '../../model/NewReleasesModel.dart';
import '../../model/PopularModel.dart';
import '../../model/RecommendedModel.dart';
import '../../shared/remote/dio_helper.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(PopularLoadingState());
  PopularModel? popular;
  RecommendedModel? recommended;
  NewReleasesModel? newRelease;

  static HomeViewModel get(context) => BlocProvider.of(context);

  void getPopular() async {
    DioHelper.getData(
        url: "movie/popular",
        query: {'api_key': 'c4c3d1e82f8dee40ffdf440f479d9373'}).then((value) {
      popular = PopularModel.fromJson(value?.data);
      emit(PopularSuccesState());
    }).catchError((e) {
      emit(PopularErrorState(errorMessage: e.toString()));
    });
  }

  void getNewRelease() async {
    DioHelper.getData(
        url: "movie/upcoming",
        query: {'api_key': 'c4c3d1e82f8dee40ffdf440f479d9373'}).then((value) {
      newRelease = NewReleasesModel.fromJson(value?.data);
      emit(ReleaseSuccesState());
    }).catchError((e) {
      emit(ReleaseErrorState(errorMessage: e.toString()));
    });
  }

  void getRecommended() async {
    DioHelper.getData(
        url: "movie/top_rated",
        query: {'api_key': 'c4c3d1e82f8dee40ffdf440f479d9373'}).then((value) {
      recommended = RecommendedModel.fromJson(value?.data);
      emit(RecommededSuccesState());
    }).catchError((e) {
      emit(RecommededErrorState(errorMessage: e.toString()));
    });
  }
}
