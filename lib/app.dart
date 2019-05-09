import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Test2.dart';
import 'package:flutter_app/Test3.dart';
import 'package:flutter_app/Test4.dart';
import 'package:flutter_app/Test5.dart';
import 'package:flutter_app/demos.dart';
import 'package:flutter_app/test1.dart';
import 'package:flutter_app/widget/Button.dart';
import 'package:flutter_app/widget/ImageWidget.dart';
import 'package:flutter_app/widget/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/widget/TextFieldWidget.dart';
import 'package:flutter_app/widget/TextWidget.dart';

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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new FlatButton(
                  child: new Text("Test1"),
                  onPressed: () {
//                Navigator.pushNamed(context, Test1.routeName);
                    _onNavigator(context, Test1.routeName);
                  }),
              new  FlatButton(
                  child: new Text("Test2"),
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, Test2.routeName);
                  }),
              new  FlatButton(
                  child: new Text("Test3"),
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, Test3.routeName);
                  }),
              new  FlatButton(
                  child: new Text("Test4"),
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, Test4.routeName);
                  }),
              new  FlatButton(
                  child: new Text("Test5"),
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, ParentWidget.routeName);
                  }),
              new  FlatButton(
                  child: new Text("TextWidget"),
                  onPressed: () {
                    _onNavigator(context, TextWidget.routeName);
                  }),
              new  FlatButton(
                  child: new Text("ButtonWidget"),
                  onPressed: () {
                    _onNavigator(context, ButtonWidget.routeName);
                  }),
              new  FlatButton(
                  child: new Text("ImageWidget"),
                  onPressed: () {
                    _onNavigator(context, ImageWidget.routeName);
                  }),
              new  FlatButton(
                  child: new Text("SwitchAndCheckBoxTestRoute"),
                  onPressed: () {
                    _onNavigator(context, SwitchAndCheckBoxTestRoute.routeName);
                  }),
              new  FlatButton(
                  child: new Text("TextFieldWidget"),
                  onPressed: () {
                    _onNavigator(context, TextFieldWidget.routeName);
                  }),
            ],
          ),
        ));
  }
}

void _onNavigator(BuildContext context, String routeName) {
  Timeline.instantSync('Start Transition', arguments: <String, String>{
    'from': '/',
    'to': routeName,
  });
  Navigator.pushNamed(context, routeName);
}
