import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../MyTheme.dart';
import 'cubit_movie_details/movie_details_view_model.dart';

class MoreLikeThis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = MovieDetailsViewModel.get(context);
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: Container(
        height: 246.h,
        width: 462.w,
        color: MyTheme.containerFilmColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "More Like This",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: MyTheme.whiteColor),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 184.h,
                        width: 97.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 96.87.w,
                              height: 127.74.h,
                              child: Stack(children: [
                                CachedNetworkImage(
                                  imageUrl:
                                      "https://image.tmdb.org/t/p/w500${cubit.similarModel?.results?[index].posterPath}",
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                    color: MyTheme.whiteColor,
                                  )),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                        'assets/images/bookmark.png'))
                              ]),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/ratingstar.png"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "${cubit.similarModel?.results?[index].voteAverage}",
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: MyTheme.whiteColor,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "${cubit.similarModel?.results?[index].title}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: MyTheme.whiteColor)),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Text(
                                    "${cubit.similarModel?.results?[index].releaseDate}",
                                    style: TextStyle(
                                        fontSize: 8,
                                        color: MyTheme.greyColor,
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: cubit.similarModel?.results?.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}

