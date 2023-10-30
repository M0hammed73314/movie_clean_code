import 'package:flutter/material.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/movie/category_tab.dart';
import 'package:movies/movie/more_like_this.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movie_details';
  List<MoreLikeThis> moreLikeThis = [
    MoreLikeThis(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
    MoreLikeThis(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
    MoreLikeThis(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
    MoreLikeThis(
        image: "assets/images/2.png",
        icon: "assets/images/bookmark.png",
        date: "2018  R  1h 59m",
        filmName: "Deadbool 2",
        rating: "7.7"),
  ];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routeName);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Dora and the lost city of gold',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                  width: mediaQuery.width,
                  height: mediaQuery.height * .22,
                  child: Image.asset(
                    'assets/images/initialvideo.png',
                    fit: BoxFit.cover,
                  )),
              Image.asset('assets/images/play-button-2.png'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Dora and the lost city of gold',
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 7),
                Text(
                  '2019  PG-13  2h 7m',
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Image.asset('assets/images/filmposter.png'),
                        Image.asset('assets/images/bookmark.png')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CategoryTab('Action'),
                              CategoryTab('Action'),
                              CategoryTab('Action'),
                            ],
                          ),
                          Row(
                            children: [
                              CategoryTab('Action'),
                            ],
                          ),
                          Container(
                            width: mediaQuery.width * 0.50,
                            child: Text(
                              'Having spent most of her life exploring the jungle, '
                                  'nothing could prepare Dora for her most dangerous '
                                  'adventure yet — high school. ',
                              style: theme.textTheme.titleMedium,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: MyTheme.yellowColor,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '7.7',
                                  style: theme.textTheme.titleMedium,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 12),
            child: Container(
              height: MediaQuery.of(context).size.height * .29,
              width: double.infinity,
              color: MyTheme.containerFilmColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "More Like This",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),

                    Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(color: MyTheme.darkGreyColor,child: moreLikeThis[index]);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width * .027,
                            );
                          },
                          itemCount: moreLikeThis.length),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
