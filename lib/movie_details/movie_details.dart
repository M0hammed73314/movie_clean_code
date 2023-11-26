import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/model/navigate.dart';
import 'package:movies/movie_details/more_like_this.dart';
import 'package:movies/movie_details/movie_more_details.dart';

import 'cubit_movie_details/movie_details_view_model.dart';
import 'cubit_movie_details/state.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movie_details';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as NavigateModel;
    return BlocProvider(
      create: (context) => MovieDetailsViewModel()
        ..getDetailsData(args.id)
        ..getSimilarData(args.id),
      child: BlocConsumer<MovieDetailsViewModel, MovieDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MovieDetailsViewModel.get(context);
          return ConditionalBuilder(
            condition: cubit.myMovieDetails != null,
            builder: (context) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text(
                  '${cubit.myMovieDetails?.title}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [MovieMoreDetails(), MoreLikeThis()],
                ),
              ),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
          );
        },
      ),
    );
  }
}
