import 'dart:async';
import 'dart:convert';
import 'package:covid_vaccine/data.dart';
import 'package:covid_vaccine/home_screen.dart';
import 'package:covid_vaccine/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

Future<Post> fetchPost() async {
  final key =
      'FzJCgkl8CrLJvNvEF3B25yNbzCg3KlHD4cmR2AaWdClcIsaNxIVFaM%2F3qnRbq8VDCsrTwwvuG1AAQpWR6OdFnA%3D%3D';
  final response = await http.get(
      'https://api.odcloud.kr/api/15077586/v1/centers?serviceKey=$key&page=1&perPage=10');
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> post;
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
    post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return FutureBuilder<Post>(
      future: post,
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        return Container(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight,
          child: ListView.builder(
            itemCount: snapshot.data.totalCount,
            itemBuilder: (context, index) {
              return Card(
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return Container(
                          height: SizeConfig.screenHeight * 0.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(
                                    getProportionateScreenHeight(20.0)),
                                width: getProportionateScreenWidth(300.0),
                                height: getProportionateScreenHeight(300.0),
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        double.parse(
                                            snapshot.data.data[index].lat),
                                        double.parse(
                                            snapshot.data.data[index].lng)),
                                    zoom: 14.4746,
                                  ),
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text:
                                        "시도 : ${snapshot.data.data[index].sido}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "시군구 : ${snapshot.data.data[index].sigungu}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "센터 명 : ${snapshot.data.data[index].centerName}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "시설 명 : ${snapshot.data.data[index].facilityName}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "주소 : ${snapshot.data.data[index].address}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "센터 유형 : ${snapshot.data.data[index].centerType}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text:
                                        "운영 기관 : ${snapshot.data.data[index].org}\n\n",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(15.0),
                        horizontal: getProportionateScreenWidth(20.0)),
                    leading: Container(
                        width: getProportionateScreenWidth(60.0),
                        child: Text(snapshot.data.data[index].sido)),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.data.data[index].address),
                        Text(snapshot.data.data[index].facilityName),
                      ],
                    ),
                    trailing: Icon(Icons.map),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
