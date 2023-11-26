import 'package:flutter/material.dart';
import 'package:movies/model/navigate.dart';
import 'package:movies/movie_details/movie_details.dart';

import '../MyTheme.dart';
import 'cubit/home_view_model.dart';

class NewRelease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeViewModel.get(context);
    return Padding(
      padding: EdgeInsets.only(top: 7),
      child: Container(
        height: MediaQuery.of(context).size.height * .18,
        width: double.infinity,
        color: MyTheme.containerFilmColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "New Releases ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: MyTheme.whiteColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MovieDetails.routeName,
                                  arguments: NavigateModel(
                                      cubit.newRelease?.results?[index].id));
                            },
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w500${cubit.newRelease?.results?[index].posterPath}")),
                        InkWell(
                            onTap: () {},
                            child: Image.asset("assets/images/bookmark.png"))
                      ]),
                    );
                  },
                  itemCount: cubit.newRelease?.results?.length,
                  scrollDirection: Axis.horizontal),
            )
          ],
        ),
      ),
    );
  }
}
