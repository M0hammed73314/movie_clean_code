import 'package:flutter/material.dart';

class NewRelease extends StatelessWidget {
  String image;
  String icon;

  NewRelease({required this.image, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Stack(children: [
        Image.asset(image),
        InkWell(onTap: () {}, child: Image.asset(icon))
      ]),
    );
  }
}
//"assets/images/filmposter.png"
//"assets/images/bookmark.png"
