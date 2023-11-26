import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Browse/cubit/state.dart';

import '../../model/GenresModel.dart';
import '../../shared/remote/dio_helper.dart';

class BrowseViewModel extends Cubit<BrowseState> {
  BrowseViewModel() : super(BrowseLoadingState());
  GenresModel? genresModel;

  static BrowseViewModel get(context) => BlocProvider.of(context);

  void getGeneris() async {
    DioHelper.getData(
        url: "genre/movie/list",
        query: {'api_key': 'c4c3d1e82f8dee40ffdf440f479d9373'}).then((value) {
      genresModel = GenresModel.fromJson(value?.data);
      emit(BrowseSuccesState());
    }).catchError((e) {
      emit(BrowseErrorState(errorMessage: e.toString()));
    });
  }
}
