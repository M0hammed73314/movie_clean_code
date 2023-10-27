import 'package:flutter/material.dart';
import 'package:movies/MyTheme.dart';

import 'movielist.dart';

class WatchList extends StatelessWidget {
  List<MovieList> movieList = [
    MovieList(
        image: "assets/images/favmovie.png",
        filmName: "Alita Battle Angel",
        date: "2019",
        actor: "Rosa Salazar, Christoph Waltz"),
    MovieList(
        image: "assets/images/favmovie.png",
        filmName: "Alita Battle Angel",
        date: "2019",
        actor: "Rosa Salazar, Christoph Waltz"),
    MovieList(
        image: "assets/images/favmovie.png",
        filmName: "Alita Battle Angel",
        date: "2019",
        actor: "Rosa Salazar, Christoph Waltz"),
    MovieList(
        image: "assets/images/favmovie.png",
        filmName: "Alita Battle Angel",
        date: "2019",
        actor: "Rosa Salazar, Christoph Waltz"),
    MovieList(
        image: "assets/images/favmovie.png",
        filmName: "Alita Battle Angel",
        date: "2019",
        actor: "Rosa Salazar, Christoph Waltz"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Watchlist",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyTheme.whiteColor)),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.all(5),
                height: MediaQuery.of(context).size.height * .65,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return movieList[index];
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                        child: Divider(
                            color: MyTheme.greyColor, height: 3, thickness: 1),
                      );
                    },
                    itemCount: movieList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
