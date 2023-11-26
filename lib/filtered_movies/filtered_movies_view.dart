import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/filtered_movies/cubit/FilteredMovieViewModel.dart';
import 'package:movies/filtered_movies/cubit/state.dart';
import 'package:movies/filtered_movies/filtered_movie_item.dart';

import '../model/navigate.dart';

class FilteredMoviesView extends StatefulWidget {
  static const String routeName = 'filtered_movies';

  @override
  State<FilteredMoviesView> createState() => _FilteredMoviesViewState();
}

class _FilteredMoviesViewState extends State<FilteredMoviesView> {
  @override
  Widget build(BuildContext context) {
    var myid = ModalRoute.of(context)?.settings.arguments as NavigateModel;
    return BlocProvider(
      create: (context) => FilteredMovieViewModel()..getFilteredMovie(myid.id),
      child: BlocConsumer<FilteredMovieViewModel, FilteredMovieState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = FilteredMovieViewModel.get(context);
          return ConditionalBuilder(
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
            condition: cubit.filteredMovieModel != null,
            builder: (context) {
              return FilteredMovieItem();
            },
          );
        },
      ),
    );
  }
}

