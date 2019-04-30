import 'package:flutter/material.dart';
import 'package:flutter_app/Test2.dart';
import 'package:flutter_app/demos.dart';
import 'package:flutter_app/test1.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({Key key}) : super(key: key);

  Map<String, WidgetBuilder> _buildRoutes() {
    return Map<String, WidgetBuilder>.fromIterable(
      kAllGalleryDemos,
      key: (dynamic demo) => '${demo.routeName}',
      value: (dynamic demo) => demo.builderRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "主页",
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: _buildRoutes(),
//      routes: {
//        Test1.routeName: (context) => Test1(),
//        Test2.routeName: (context) => Test2(),
//      },
      home: new Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("主页"),
      ),
      body: Column(
        children: <Widget>[
          new MaterialButton(
              child: new Text("Test1"),
              onPressed: () {
                Navigator.pushNamed(context, Test1.routeName);
              }),
          new MaterialButton(
              child: new Text("Test2"),
              onPressed: () {
                Navigator.pushNamed(context, Test2.routeName);
              })
        ],
      ),
    );
  }
}
