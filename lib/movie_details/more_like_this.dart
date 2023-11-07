import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../MyTheme.dart';

class MoreLikeThis extends StatelessWidget {
  String image;
  String icon;
  String rating;
  String filmName;
  String date;

  MoreLikeThis(
      {required this.image,
        required this.icon,
        required this.rating,
        required this.filmName,
        required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      width: 97.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 96.87.w,
            height: 127.74.h,
            child: Stack(children: [
              Image.asset(
                image,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              InkWell(onTap: () {}, child: Image.asset(icon))
            ]),
          ),
          SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/ratingstar.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      rating,
                      style: TextStyle(
                          fontSize: 10,
                          color: MyTheme.whiteColor,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(filmName,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: MyTheme.whiteColor)),
                SizedBox(
                  height: 3,
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 8,
                      color: MyTheme.greyColor,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

