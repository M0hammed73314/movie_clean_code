abstract class BrowseState {}

class BrowseLoadingState extends BrowseState {}

class BrowseErrorState extends BrowseState {
  String? errorMessage;

  BrowseErrorState({required this.errorMessage});
}

class BrowseSuccesState extends BrowseState {}
