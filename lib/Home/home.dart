import 'package:flutter/material.dart';
import 'package:movies/Home/NewRelease.dart';
import 'package:movies/Home/Recommended.dart';
import 'package:movies/MyTheme.dart';

class Home extends StatelessWidget {
  List<NewRelease> newRelease = [
    NewRelease(
        image: "assets/images/movie1.png", icon: "assets/images/bookmark.png"),
    NewRelease(
        image: "assets/images/2.png", icon: "assets/images/checkmark.png"),
    NewRelease(
        image: "assets/images/Annabelle.png",
        icon: "assets/images/bookmark.png"),
    NewRelease(
        image: "assets/images/4.png", icon: "assets/images/bookmark.png"),
  ];
  List<Recommended> recommended = [
    Recommended(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
    Recommended(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
    Recommended(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
    Recommended(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .42,
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/initialvideo.png",
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
                          Image.asset("assets/images/filmposter.png"),
                          InkWell(
                              onTap: () {},
                              child: Image.asset("assets/images/bookmark.png"))
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
                    "Dora and the lost city of gold",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyTheme.whiteColor, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .37,
                      left: MediaQuery.of(context).size.height * .19),
                  child: Text(
                    "2019  PG-13  2h 7m",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: MyTheme.greyColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 7),
            child: Container(
              height: MediaQuery.of(context).size.height * .19,
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
                          return newRelease[index];
                        },
                        itemCount: newRelease.length,
                        scrollDirection: Axis.horizontal),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Container(
              height: MediaQuery.of(context).size.height * .28,
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
                          return recommended[index];
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * .03,
                          );
                        },
                        itemCount: recommended.length),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
