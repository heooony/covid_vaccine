import 'package:covid_vaccine/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_sliver_appbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          HomeSliverAppBar(),
          SliverFillRemaining(
            child: Scaffold(
              body: SingleChildScrollView(
                child: MyApp(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
