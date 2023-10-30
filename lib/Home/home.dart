import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/Home/NewRelease.dart';
import 'package:movies/Home/Recommended.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/api/api_manager.dart';

class Home extends StatelessWidget {
  List<NewRelease> newRelease = [
    NewRelease(
        image: "assets/images/2.png", icon: "assets/images/checkmark.png"),
    NewRelease(
        image: "assets/images/2.png", icon: "assets/images/checkmark.png"),
    NewRelease(
        image: "assets/images/2.png", icon: "assets/images/checkmark.png"),
    NewRelease(
        image: "assets/images/2.png", icon: "assets/images/checkmark.png")
  ];
  List<Recommended> recommended = [
    Recommended(
        image: "assets/images/2.png",
        icon: "assets/images/checkmark.png",
        rating: "2.2",
        filmName: "ascsac",
        date: "17")
  ];

  @override
  Widget build(BuildContext context) {
    ApiManager.getPopular();
    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
            future: ApiManager.getPopular(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: MyTheme.whiteColor),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("someThing went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              if (snapshot.data?.success == false) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              var movieList = snapshot.data?.results ?? [];
              return Container(
                height: MediaQuery.of(context).size.height * .42,
                child: Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${movieList[0].backdropPath}",
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .32,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            child: Stack(children: [
                              Container(
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w500${movieList[0].posterPath}"),
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
                        "${movieList[0].title}",
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
                ),
              );
            },
          ),
          FutureBuilder(
            future: ApiManager.getRelease(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: MyTheme.whiteColor),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("someThing went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              if (snapshot.data?.success == false) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              var releaseList = snapshot.data?.results ?? [];
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
                                width: MediaQuery.of(context).size.width * .03,
                              );
                            },
                            itemBuilder: (context, index) {
                              return NewRelease(
                                  image: releaseList[index].posterPath ?? "",
                                  icon: "assets/images/bookmark.png");
                            },
                            itemCount: releaseList.length,
                            scrollDirection: Axis.horizontal),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          FutureBuilder(
            future: ApiManager.getRecommended(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: MyTheme.whiteColor),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    Text("someThing went wrong"),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              if (snapshot.data?.success == false) {
                return Column(
                  children: [
                    Text(snapshot.data?.status_message ?? ""),
                    ElevatedButton(onPressed: () {}, child: Text("Try again"))
                  ],
                );
              }
              var recommendedList = snapshot.data?.results ?? [];
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
                                      image:
                                          recommendedList[index].posterPath ??
                                              "",
                                      icon: "assets/images/bookmark.png",
                                      rating:
                                          "${recommendedList[index].voteAverage}",
                                      filmName:
                                          "${recommendedList[index].title}",
                                      date:
                                          "${recommendedList[index].releaseDate}"));
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              );
                            },
                            itemCount: recommendedList.length),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
