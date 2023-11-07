import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../MyTheme.dart';
import '../model/navigate.dart';
import '../movie_details/movie_details.dart';

class Popular extends StatelessWidget {
  String? title;
  String? BackDrop;
  String? Poster;
  int? id;
  String? orignalTitle;
  String? overView;

  num? VoteAverage;
  bool? Adult;
  List<int>? Generisid;
  String? orignalLanguage;
  bool? video;
  int? voteCount;

  Popular(
      {required this.title,
      required this.id,
      required this.Adult,
      required this.BackDrop,
      required this.Generisid,
      required this.orignalLanguage,
      required this.orignalTitle,
      required this.overView,
      required this.Poster,
      required this.video,
      required this.VoteAverage,
      required this.voteCount});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(MovieDetails.routeName,
                    arguments: NavigateModel(id));
              },
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${BackDrop}",
                width: double.infinity,
                height: 217.h,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: 129.w,
                    height: 199.h,
                    child: Stack(children: [
                      Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                MovieDetails.routeName,
                                arguments: NavigateModel(id));
                          },
                          child: Image.network(
                              "https://image.tmdb.org/t/p/w500${Poster}"),
                        ),
                        height: 199.h,
                        width: 129.w,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Image.asset("assets/images/bookmark.png"))
                    ]),
                  ),
                ),
                InkWell(
                    onTap: () {},
                    child: Padding(
                        padding: EdgeInsets.only(left: 35, bottom: 30),
                        child: Image.asset("assets/images/play-button-2.png"))),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .27,
                  left: MediaQuery.of(context).size.width * .35),
              child: Text(
                "${title}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: MyTheme.whiteColor, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * .31,
                  left: MediaQuery.of(context).size.width * .35),
              child: Text(
                maxLines: 1,
                "2019  PG-13  2h 7m",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: MyTheme.greyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
