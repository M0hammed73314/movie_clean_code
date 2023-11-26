abstract class FilteredMovieState {}

class FilteredMovieLoadingState extends FilteredMovieState {}

class FilteredMovieSuccessState extends FilteredMovieState {}

class FilteredMovieErrorState extends FilteredMovieState {
  String errorMessage;

  FilteredMovieErrorState({required this.errorMessage});
}
