import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/MyTheme.dart';

import '../model/navigate.dart';
import '../movie_details/movie_details.dart';

class Recommended extends StatelessWidget {
  String image;
  String icon;
  String rating;
  String filmName;
  String date;
  int id;

  Recommended(
      {required this.image,
      required this.icon,
      required this.rating,
      required this.filmName,
      required this.date,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff343534),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(children: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(MovieDetails.routeName,
                        arguments: NavigateModel(id));
                  },
                  child:
                      Image.network("https://image.tmdb.org/t/p/w500${image}")),
              InkWell(onTap: () {}, child: Image.asset(icon))
            ]),
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Image.asset("assets/images/ratingstar.png"),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                rating,
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
            child: Text(filmName,
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
              date,
              style: TextStyle(fontSize: 8.sp, color: MyTheme.greyColor),
            ),
          )
        ],
      ),
    );
  }
}
//"assets/images/filmposter.png"
//"assets/images/bookmark.png"
