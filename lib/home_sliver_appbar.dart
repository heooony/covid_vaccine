import 'package:covid_vaccine/size_config.dart';
import 'package:covid_vaccine/sliver_space.dart';
import 'package:flutter/material.dart';

class HomeSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SliverAppBar(
      elevation: 0,
      floating: true,
      pinned: true,
      snap: false,
      toolbarHeight: SizeConfig.screenHeight * 0.1,
      expandedHeight: SizeConfig.screenHeight * 0.27,
      flexibleSpace: SliverSpace(),
      backgroundColor: Colors.white,
    );
  }
}
