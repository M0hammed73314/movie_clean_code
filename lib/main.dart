import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/HomeScreen.dart';
import 'package:movies/MyTheme.dart';
import 'package:movies/filtered_movies/filtered_movies_view.dart';
import 'bloc/category/genres.dart';

void main() {
  runApp(
    BlocProvider(create: (context)=>  GenreCubit(),
    child: MyApp()),
  );
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
          FilteredMoviesView.routeName: (context) => FilteredMoviesView()
        },
        theme: MyTheme.LightTheme,
      ),
    );
  }
}
