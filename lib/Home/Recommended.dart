import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/MyTheme.dart';

import '../model/navigate.dart';
import '../movie_details/movie_details.dart';
import 'cubit/home_view_model.dart';

class Recommended extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit = HomeViewModel.get(context);
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        width: double.infinity,
        color: MyTheme.containerFilmColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recomended",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyTheme.whiteColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 127.74.h,
                        width: 96.87.w,
                        child: Container(
                          color: Color(0xff343534),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Stack(children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              MovieDetails.routeName,
                                              arguments: NavigateModel(cubit
                                                  .recommended
                                                  ?.results?[index]
                                                  .id));
                                        },
                                        child: Image.network(
                                            "https://image.tmdb.org/t/p/w500${cubit.recommended?.results?[index].posterPath}")),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                            "assets/images/bookmark.png"))
                                  ]),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Image.asset(
                                          "assets/images/ratingstar.png"),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      '${cubit.recommended?.results?[index].voteAverage ?? ""}',
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          color: MyTheme.whiteColor,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                      cubit.recommended?.results?[index]
                                              .title ??
                                          "",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: MyTheme.whiteColor)),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    cubit.recommended?.results?[index]
                                            .releaseDate ??
                                        "",
                                    style: TextStyle(
                                        fontSize: 8.sp,
                                        color: MyTheme.greyColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                  itemCount: cubit.recommended?.results?.length),
            )
          ],
        ),
      ),
    );
  }
}
