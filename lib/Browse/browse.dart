import 'package:flutter/material.dart';
import 'package:movies/Browse/categorylist.dart';
import 'package:movies/MyTheme.dart';

class Browse extends StatelessWidget {
  List<CategoryList> categoryList = [
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action"),
    CategoryList(image: "assets/images/category.png", category: "Action")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Browse Category ",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyTheme.whiteColor),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return categoryList[index];
                },
                itemCount: categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 25),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
