import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';

import 'menu_drawer.dart';
import 'top_menu.dart';

void main() {
  runApp(MyApp());
}

final List<String> imgList = [
  'assets/imgs/carousel/1.png',
  'assets/imgs/carousel/2.png',
  'assets/imgs/carousel/3.png',
  'assets/imgs/carousel/4.png',
  'assets/imgs/carousel/5.png',
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Redhotsixbull's homepage",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '지극히 개인적인 사이트'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final containerOneFadeController = FadeInController();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    containerOneFadeController.fadeIn();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double heightV = MediaQuery.of(context).size.height;
    double widthV = MediaQuery.of(context).size.width;
    double containerSize = heightV;
    return Scaffold(
      key: _scaffoldKey,
      drawer: MenuDrawer().menuDrawer,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Container(
              height: containerSize,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        'assets/imgs/test.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  FadeIn(
                    controller: containerOneFadeController,
                    child: Center(
                        child: Text(
                      "Redhotsixbull 의 홈페이지입니다.",
                      style: TextStyle(fontSize: 20),
                    )),
                    duration: Duration(milliseconds: 3000),
                    curve: Curves.easeIn,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: containerSize,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      color: Colors.black,
                      width: widthV / 2,
                      child: Center(
                        child: Image.asset(
                          'assets/imgs/couple.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FadeIn(
                      child: Container(
                        color: Colors.black,
                        width: widthV / 2,
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                                text: "I'm Flutter Devleoper Redhotsixbull.",
                                children: [
                                  TextSpan(text: '\n'),
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                      text:
                                          "Interesting in application and web.",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white)),
                                  TextSpan(text: '\n'),
                                  TextSpan(text: '\n'),
                                  TextSpan(text: '\n'),
                                  TextSpan(
                                      text:
                                          "#React #Spring #Java #Kotlin #Dart #Flutter",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.blue)),
                                ]),
                          ),
                        ),
                      ),
                      duration: Duration(milliseconds: 3000),
                      curve: Curves.easeIn,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.grey,
              height: containerSize,
              width: double.infinity,
              child: ComplicatedImageDemo(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Flutter로 만든 웹사이트입니다.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Create by redhotsixbull",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: TopMenu(
        scrollController: scrollController,
        scaffoldKey: _scaffoldKey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
    );
  }
}

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
          ],
        ),
      )),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  ],
                )),
          ),
        ))
    .toList();
