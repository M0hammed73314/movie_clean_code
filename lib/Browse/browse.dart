import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Browse/cubit/BrowseViewModel.dart';
import 'package:movies/Browse/cubit/state.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/filtered_movies/filtered_movies_view.dart';
import 'package:movies/model/navigate.dart';

class Browse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseViewModel()..getGeneris(),
      child: BlocConsumer<BrowseViewModel, BrowseState>(
        builder: (context, state) {
          var cubit = BrowseViewModel.get(context);
          return ConditionalBuilder(
            builder: (context) {
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
                          child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, FilteredMoviesView.routeName,
                                    arguments: NavigateModel(
                                        cubit.genresModel!.genres![index].id));
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/images/category.png",
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        .15,
                                  ),
                                  Text(
                                    cubit.genresModel!.genres![index].name!,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: MyTheme.whiteColor,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ));
                        },
                        itemCount: cubit.genresModel!.genres!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 25),
                      ))),
                ),
              );
            },
            condition: cubit.genresModel != null,
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
