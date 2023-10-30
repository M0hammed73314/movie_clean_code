import 'package:flutter/material.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
            children: [
          Image.asset(image),
          InkWell(onTap: () {}, child: Image.asset(icon))
        ]),
        SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Image.asset("assets/images/ratingstar.png"),
                  ),
                  SizedBox(
                    width: 1,
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
                height: 2,
              ),
              Text(
                date,
                style: TextStyle(fontSize: 8, color: MyTheme.greyColor),
              )
            ],
          ),
        ),

      ],
    );
  }
}

