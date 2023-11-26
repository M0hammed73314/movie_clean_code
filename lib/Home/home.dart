import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/Home/NewRelease.dart';
import 'package:movies/Home/Popular.dart';
import 'package:movies/Home/Recommended.dart';
import 'package:movies/Home/cubit/home_view_model.dart';
import 'package:movies/Home/cubit/state.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeViewModel()
        ..getPopular()
        ..getNewRelease()
        ..getRecommended(),
      child: BlocConsumer<HomeViewModel, HomeState>(
        builder: (context, state) {
          var cubit = HomeViewModel.get(context);

          return ConditionalBuilder(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: [
                  Popular(),
                  NewRelease(),
                  Recommended(),
                ],
              ),
            ),
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
            condition: cubit.popular != null &&
                cubit.newRelease != null &&
                cubit.recommended != null,
          );
        },
        listener: (BuildContext context, HomeState state) {},
      ),
    );
  }
}
