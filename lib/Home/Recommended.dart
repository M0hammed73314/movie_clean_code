import 'package:flutter/material.dart';
import 'package:movies/MyTheme.dart';

class Recommended extends StatelessWidget {
  String image;
  String icon;
  String rating;
  String filmName;
  String date;

  Recommended(
      {required this.image,
      required this.icon,
      required this.rating,
      required this.filmName,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Image.asset(image),
          InkWell(onTap: () {}, child: Image.asset(icon))
        ]),
        SizedBox(
          height: 4,
        ),
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
    );
  }
}
//"assets/images/filmposter.png"
//"assets/images/bookmark.png"
