import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Home/NewRelease.dart';
import 'package:movies/Home/Popular.dart';
import 'package:movies/Home/Recommended.dart';
import 'package:movies/Home/cubit/popular/popular_view_model.dart';
import 'package:movies/Home/cubit/popular/state.dart';
import 'package:movies/Home/cubit/recommended/recommended_view_model.dart';
import 'package:movies/Home/cubit/recommended/state.dart';
import 'package:movies/Home/cubit/release/release_view_model.dart';
import 'package:movies/Home/cubit/release/state.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/api/api_manager.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ReleaseViewModel viewModel = ReleaseViewModel();
  PopularViewModel viewModel2 = PopularViewModel();
  RecommendedViewModel viewModel3 = RecommendedViewModel();

  @override
  void initState() {
    // TODO: implement initState

    viewModel.getReleases();
    viewModel2.getPopular();
    viewModel3.getRecommended();
  }

  @override
  Widget build(BuildContext context) {
    ApiManager.getPopular();
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<PopularViewModel, PopularState>(
            bloc: viewModel2,
            builder: (context, state) {
              if (state is PopularLoadingState) {
                return Center(
                  child: CircularProgressIndicator(color: MyTheme.whiteColor),
                );
              } else if (state is PopularErrorState) {
                return Column(
                  children: [
                    Text(state.errorMessage ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              } else if (state is PopularSuccesState) {
                return CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 390.h,
                      enlargeCenterPage: true,
                      disableCenter: true,
                      enableInfiniteScroll: true,
                    ),
                    itemCount: state.result.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return Popular(
                          title: state.result[itemIndex].title,
                          id: state.result[itemIndex].id,
                          Adult: state.result[itemIndex].adult,
                          BackDrop: state.result[itemIndex].backdropPath,
                          Generisid: state.result[itemIndex].genreIds,
                          orignalLanguage:
                              state.result[itemIndex].originalLanguage,
                          orignalTitle: state.result[itemIndex].originalTitle,
                          overView: state.result[itemIndex].overview,
                          Poster: state.result[itemIndex].posterPath,
                          video: state.result[itemIndex].video,
                          VoteAverage: state.result[itemIndex].voteAverage,
                          voteCount: state.result[itemIndex].voteCount);
                    });
              }
              return Container();
            },
          )
          // FutureBuilder(
          //   future: ApiManager.getPopular(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(color: MyTheme.whiteColor),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Column(
          //         children: [
          //           Text("someThing went wrong"),
          //           ElevatedButton(onPressed: () {}, child: Text("Try again"))
          //         ],
          //       );
          //     }
          //     if (snapshot.data?.success == false) {
          //       return Column(
          //         children: [
          //           Text(snapshot.data?.status_message ?? ""),
          //           ElevatedButton(onPressed: () {}, child: Text("Try again"))
          //         ],
          //       );
          //     }
          //     var movieList = snapshot.data?.results ?? [];
          //     return Container(
          //       height: MediaQuery.of(context).size.height * .42,
          //       child: Stack(
          //         children: [
          //           Image.network(
          //             "https://image.tmdb.org/t/p/w500${movieList[0].backdropPath}",
          //             width: double.infinity,
          //             height: MediaQuery.of(context).size.height * .32,
          //             fit: BoxFit.cover,
          //           ),
          //           Row(
          //             children: [
          //               Align(
          //                 alignment: Alignment.bottomLeft,
          //                 child: InkWell(
          //                   onTap: (){
          //                     Navigator.of(context).pushNamed(MovieDetails.routeName);
          //                   },
          //                   child: Container(
          //                     child: Stack(children: [
          //                       Container(
          //                         child: InkWell(
          //                           onTap: (){
          //                             Navigator.of(context).pushNamed(MovieDetails.routeName);
          //                           },
          //                           child: Image.network(
          //                               "https://image.tmdb.org/t/p/w500${movieList[0].posterPath}"),
          //                         ),
          //                         height: 199.h,
          //                         width: 129.w,
          //                       ),
          //                       InkWell(
          //                           onTap: () {},
          //                           child:
          //                               Image.asset("assets/images/bookmark.png"))
          //                     ]),
          //                   ),
          //                 ),
          //               ),
          //               InkWell(
          //                   onTap: () {},
          //                   child: Padding(
          //                       padding: EdgeInsets.only(left: 42),
          //                       child: Image.asset(
          //                           "assets/images/play-button-2.png"))),
          //             ],
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(
          //                 top: MediaQuery.of(context).size.height * .34,
          //                 left: MediaQuery.of(context).size.height * .19),
          //             child: Text(
          //               "${movieList[0].title}",
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .titleMedium
          //                   ?.copyWith(
          //                       color: MyTheme.whiteColor,
          //                       fontWeight: FontWeight.w400),
          //             ),
          //           ),
          //           Padding(
          //             padding: EdgeInsets.only(
          //                 top: MediaQuery.of(context).size.height * .37,
          //                 left: MediaQuery.of(context).size.height * .19),
          //             child: Text(
          //               "2019  PG-13  2h 7m",
          //               style: Theme.of(context)
          //                   .textTheme
          //                   .titleMedium
          //                   ?.copyWith(
          //                       color: MyTheme.greyColor,
          //                       fontSize: 10.sp,
          //                       fontWeight: FontWeight.w400),
          //             ),
          //           )
          //         ],
          //       ),
          //     );
          //   },
          // )
          ,
          BlocBuilder<ReleaseViewModel, HomeState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is HomeLoadingState) {
                return Center(
                  child: CircularProgressIndicator(color: MyTheme.whiteColor),
                );
              } else if (state is HomeErrorState) {
                return Column(
                  children: [
                    Text(state.errorMessage ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              } else if (state is ReleaseSuccesState) {
                return Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .18,
                    width: double.infinity,
                    color: MyTheme.containerFilmColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "New Releases ",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: MyTheme.whiteColor),
                          ),
                        ),
                        Expanded(
                          child: ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .03,
                                );
                              },
                              itemBuilder: (context, index) {
                                return NewRelease(
                                    image: state.result[index].posterPath ?? "",
                                    icon: "assets/images/bookmark.png");
                              },
                              itemCount: state.result.length,
                              scrollDirection: Axis.horizontal),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),

          // FutureBuilder(
          //   future: ApiManager.getRelease(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(color: MyTheme.whiteColor),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Column(
          //         children: [
          //           Text("someThing went wrong"),
          //           ElevatedButton(onPressed: () {}, child: Text("Try again"))
          //         ],
          //       );
          //     }
          //     if (snapshot.data?.success == false) {
          //       return Column(
          //         children: [
          //           Text(snapshot.data?.status_message ?? ""),
          //           ElevatedButton(onPressed: () {}, child: Text("Try again"))
          //         ],
          //       );
          //     }
          //     var releaseList = snapshot.data?.results ?? [];
          //       ,
          //
          //         },
          //       ),
          // ,
          BlocBuilder<RecommendedViewModel, RecommededState>(
            bloc: viewModel3,
            builder: (context, state) {
              if (state is RecommededLoadingState) {
                return Center(
                  child: CircularProgressIndicator(color: MyTheme.whiteColor),
                );
              } else if (state is RecommededErrorState) {
                return Column(
                  children: [
                    Text(state.errorMessage ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              } else if (state is RecommededSuccesState) {
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
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                    height: 127.74.h,
                                    width: 96.87.w,
                                    child: Recommended(
                                        image: state.result[index].posterPath ??
                                            "",
                                        icon: "assets/images/bookmark.png",
                                        rating:
                                            "${state.result[index].voteAverage}",
                                        filmName:
                                            "${state.result[index].title}",
                                        date:
                                            "${state.result[index].releaseDate}"));
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * .02,
                                );
                              },
                              itemCount: state.result.length),
                        )
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          )
          // FutureBuilder(
          //   future: ApiManager.getRecommended(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(color: MyTheme.whiteColor),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Column(
          //         children: [
          //           Text("someThing went wrong"),
          //           ElevatedButton(onPressed: () {}, child: Text("Try again"))
          //         ],
          //       );
          //     }
          //     if (snapshot.data?.success == false) {
          //       return Column(
          //         children: [
          //           Text(snapshot.data?.status_message ?? ""),
          //           ElevatedButton(onPressed: () {}, child: Text("Try again"))
          //         ],
          //       );
          //     }
          //     var recommendedList = snapshot.data?.results ?? [];
          //     return Padding(
          //       padding: EdgeInsets.only(top: 10),
          //       child: Container(
          //         height: MediaQuery.of(context).size.height * .3,
          //         width: double.infinity,
          //         color: MyTheme.containerFilmColor,
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.stretch,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 "Recomended",
          //                 style: Theme.of(context)
          //                     .textTheme
          //                     .titleLarge
          //                     ?.copyWith(color: MyTheme.whiteColor),
          //               ),
          //             ),
          //             Expanded(
          //               child: ListView.separated(
          //                   scrollDirection: Axis.horizontal,
          //                   itemBuilder: (context, index) {
          //                     return Container(
          //                         height: 127.74.h,
          //                         width: 96.87.w,
          //                         child: Recommended(
          //                             image:
          //                                 recommendedList[index].posterPath ??
          //                                     "",
          //                             icon: "assets/images/bookmark.png",
          //                             rating:
          //                                 "${recommendedList[index].voteAverage}",
          //                             filmName:
          //                                 "${recommendedList[index].title}",
          //                             date:
          //                                 "${recommendedList[index].releaseDate}"));
          //                   },
          //                   separatorBuilder: (context, index) {
          //                     return SizedBox(
          //                       width: MediaQuery.of(context).size.width * .02,
          //                     );
          //                   },
          //                   itemCount: recommendedList.length),
          //             )
          //           ],
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
/*
 Container(
                  height: MediaQuery.of(context).size.height * .42,
        child: Stack(
        children: [
        Image.network(
        "https://image.tmdb.org/t/p/w500${state.result[0].backdropPath}",
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .32,
        fit: BoxFit.cover,
        ),
        Row(
        children: [
        Align(
        alignment: Alignment.bottomLeft,
        child: InkWell(
        onTap: (){
        Navigator.of(context).pushNamed(MovieDetails.routeName);
        },
        child: Container(
        child: Stack(children: [
        Container(
        child: InkWell(
        onTap: (){
        Navigator.of(context).pushNamed(MovieDetails.routeName);
        },
        child: Image.network(
        "https://image.tmdb.org/t/p/w500${state.result[0].posterPath}"),
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
        ),
        InkWell(
        onTap: () {},
        child: Padding(
        padding: EdgeInsets.only(left: 42),
        child: Image.asset(
        "assets/images/play-button-2.png"))),
        ],
        ),
        Padding(
        padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .34,
        left: MediaQuery.of(context).size.height * .19),
        child: Text(
        "${state.result[0].title}",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(
        color: MyTheme.whiteColor,
        fontWeight: FontWeight.w400),
        ),
        ),
        Padding(
        padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .37,
        left: MediaQuery.of(context).size.height * .19),
        child: Text(
        "2019  PG-13  2h 7m",
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(
        color: MyTheme.greyColor,
        fontSize: 10.sp,
        fontWeight: FontWeight.w400),
        ),
        )
        ],
        ),);
*/
