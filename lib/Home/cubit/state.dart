abstract class HomeState {}

class PopularLoadingState extends HomeState {}

class PopularErrorState extends HomeState {
  String? errorMessage;

  PopularErrorState({required this.errorMessage});
}

class PopularSuccesState extends HomeState {}

class RecommededLoadingState extends HomeState {}

class RecommededErrorState extends HomeState {
  String? errorMessage;

  RecommededErrorState({required this.errorMessage});
}

class RecommededSuccesState extends HomeState {}

class ReleaseLoadingState extends HomeState {}

class ReleaseErrorState extends HomeState {
  String? errorMessage;

  ReleaseErrorState({required this.errorMessage});
}

class ReleaseSuccesState extends HomeState {}
