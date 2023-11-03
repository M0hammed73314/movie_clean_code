import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../model/MoviesList.dart';

class FilteredMovieItem extends StatelessWidget {
  Results movie;

  FilteredMovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
            children: [
              Expanded(
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  placeholder: (context, url) => Center(child: CircularProgressIndicator(
                    color: Colors.white,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        movie.title ?? '',
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        movie.releaseDate ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              movie.voteAverage.toString() ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
