import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/MyTheme.dart';

class MovieList extends StatelessWidget {
  String image;
  String filmName;
  String date;
  String actor;

  MovieList(
      {required this.image,
      required this.filmName,
      required this.date,
      required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Stack(children: [
          Image.asset(image),
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/images/checkmark.png"))
        ]),
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                filmName,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: MyTheme.whiteColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                date,
                style: TextStyle(
                    fontSize: 13,
                    color: MyTheme.greyColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                actor,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: MyTheme.greyColor),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
