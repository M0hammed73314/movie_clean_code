import 'package:flutter/material.dart';
import 'package:movies/model/navigate.dart';
import 'package:movies/movie_details/movie_details.dart';

class NewRelease extends StatelessWidget {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;

  NewRelease(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Stack(children: [
        InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(MovieDetails.routeName,
                  arguments: NavigateModel(id));
            },
            child:
                Image.network("https://image.tmdb.org/t/p/w500${posterPath}")),
        InkWell(onTap: () {}, child: Image.asset("assets/images/bookmark.png"))
      ]),
    );
  }
}
//"assets/images/filmposter.png"
//"assets/images/bookmark.png"
