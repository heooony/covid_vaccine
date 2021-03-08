import 'package:covid_vaccine/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent.withOpacity(0.23),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0))),
          child: Padding(
            padding:
                EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0, top: 0),
            child: Row(
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: '코로나 19 예방접종센터\n',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: SizeConfig.fontSize * 1.3)),
                    TextSpan(
                        text: '5',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: SizeConfig.fontSize * 1.7)),
                    TextSpan(
                        text: '건 검색되었습니다.',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: SizeConfig.fontSize))
                  ]),
                ),
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 0,
        //   child: Padding(
        //     padding: EdgeInsets.only(left: 20.0, bottom: size.height * 0.3),
        //     child: GestureDetector(
        //       child: Image.asset(
        //         'images/icons/menu.png',
        //         scale: size.width * 0.05,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
            bottom: 20.0 * 1.5,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(20.0)),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 20.0,
                    color: Colors.black.withOpacity(0.2))
              ]),
              child: TextField(
                style: TextStyle(
                  fontSize: 15.0,
                ),
                decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none)),
              ),
            )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Icon(
              Icons.menu,
              color: Colors.white.withOpacity(0.6),
            ))
      ],
    );
  }
}
