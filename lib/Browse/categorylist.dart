import 'package:flutter/material.dart';
import 'package:movies/MyTheme.dart';

class CategoryList extends StatelessWidget {
  String image;
  String category;

  CategoryList({required this.image, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          image,
          fit: BoxFit.fill,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .15,
        ),
        Text(
          category,
          style: TextStyle(
              fontSize: 15,
              color: MyTheme.whiteColor,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
