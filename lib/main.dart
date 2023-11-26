import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/filtered_movies/filtered_movies_view.dart';
import 'package:movies/shared/remote/dio_helper.dart';

import 'movie_details/movie_details.dart';
import 'observer/myObserver.dart';

void main() {
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          MovieDetails.routeName: (context) => MovieDetails(),
          FilteredMoviesView.routeName: (context) => FilteredMoviesView()
        },
        theme: MyTheme.LightTheme,
      ),
    );
  }
}
