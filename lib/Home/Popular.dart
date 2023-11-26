import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../MyTheme.dart';
import '../model/navigate.dart';
import '../movie_details/movie_details.dart';
import 'cubit/home_view_model.dart';

class Popular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeViewModel.get(context);
    return CarouselSlider.builder(
        options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: false,
          height: 390.h,
          enlargeCenterPage: true,
          disableCenter: true,
          enableInfiniteScroll: true,
        ),
        itemCount: cubit.popular?.results?.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return SafeArea(
            child: Container(
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(MovieDetails.routeName,
                          arguments: NavigateModel(
                              cubit.popular?.results?[itemIndex].id));
                    },
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${cubit.popular?.results?[itemIndex].backdropPath}",
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
                                      arguments: NavigateModel(cubit
                                          .popular?.results?[itemIndex].id));
                                },
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${cubit.popular?.results?[itemIndex].posterPath}"),
                              ),
                              height: 199.h,
                              width: 129.w,
                            ),
                            InkWell(
                                onTap: () {},
                                child:
                                    Image.asset("assets/images/bookmark.png"))
                          ]),
                        ),
                      ),
                      InkWell(
                          onTap: () {},
                          child: Padding(
                              padding: EdgeInsets.only(left: 35, bottom: 30),
                              child: Image.asset(
                                  "assets/images/play-button-2.png"))),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .27,
                        left: MediaQuery.of(context).size.width * .35),
                    child: Text(
                      "${cubit.popular?.results?[itemIndex].title}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: MyTheme.whiteColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .31,
                        left: MediaQuery.of(context).size.width * .35),
                    child: Text(
                      maxLines: 1,
                      '${cubit.popular?.results?[itemIndex].releaseDate}',
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
        });
  }
}

