import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/MyTheme.dart';

import 'cubit/FilteredMovieViewModel.dart';

class FilteredMovieItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var cubit = FilteredMovieViewModel.get(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Browse Category ",
              style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.whiteColor),
            ),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 25),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 150.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://image.tmdb.org/t/p/w500${cubit.filteredMovieModel!.results![index].posterPath}",
                              placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${cubit.filteredMovieModel!.results![index].title}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '${cubit.filteredMovieModel!.results![index].releaseDate}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                            color: MyTheme.greyColor,
                                            fontSize: 15.h,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 25,
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        Text(
                                          '${cubit.filteredMovieModel!.results![index].voteAverage}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  color: MyTheme.whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 15.h,
                  child: Divider(
                      color: MyTheme.greyColor, height: 5, thickness: 1),
                );
              },
              itemCount: cubit.filteredMovieModel!.results!.length),
        ));
  }
}
