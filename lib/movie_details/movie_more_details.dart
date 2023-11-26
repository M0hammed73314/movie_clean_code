import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../MyTheme.dart';
import 'cubit_movie_details/movie_details_view_model.dart';

class MovieMoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = MovieDetailsViewModel.get(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Container(
                width: 412.w,
                height: 217.h,
                child: Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${cubit.myMovieDetails?.backdropPath}",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Center(
                        child: Image.asset('assets/images/play-button-2.png')),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${cubit.myMovieDetails?.originalTitle}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: MyTheme.whiteColor),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${cubit.myMovieDetails?.releaseDate}',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: MyTheme.greyColor),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 199.h,
                        width: 129.w,
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Image.network(
                                "https://image.tmdb.org/t/p/w500${cubit.myMovieDetails?.posterPath}",
                                fit: BoxFit.cover,
                                width: double.infinity),
                            Image.asset('assets/images/bookmark.png')
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      top: 3, bottom: 3, right: 5),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 14, vertical: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border:
                                          Border.all(color: Colors.white54)),
                                  child: Text(
                                      cubit.myMovieDetails!.genres![0].name!,
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                )
                                // CategoryTab("${cubit.myMovieDetails?.genres?[2].name}"),
                              ],
                            ),
                            Container(
                              width: 231.w,
                              height: 134.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    '${cubit.myMovieDetails?.overview}',
                                    style: TextStyle(
                                      color: MyTheme.whiteColor,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 25.h,
                                    width: 50.w,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: MyTheme.yellowColor,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '${cubit.myMovieDetails?.voteAverage}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: MyTheme.whiteColor,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
