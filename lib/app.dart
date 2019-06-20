import 'dart:developer';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Test2.dart';
import 'package:flutter_app/Test3.dart';
import 'package:flutter_app/Test4.dart';
import 'package:flutter_app/Test5.dart';
import 'package:flutter_app/demos.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routes.dart';
import 'package:flutter_app/test1.dart';
import 'package:flutter_app/widget/Button.dart';
import 'package:flutter_app/widget/ConstrainedBoxAndSizedBox.dart';
import 'package:flutter_app/widget/ContainerWidget.dart';
import 'package:flutter_app/widget/FlexLayoutTestRoute.dart';
import 'package:flutter_app/widget/ImageWidget.dart';
import 'package:flutter_app/widget/ListViewRoute.dart';
import 'package:flutter_app/widget/ListViewRoute1.dart';
import 'package:flutter_app/widget/StackLayout.dart';
import 'package:flutter_app/widget/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/widget/TextFieldWidget.dart';
import 'package:flutter_app/widget/TextWidget.dart';
import 'package:flutter_app/widget/TransformWidget.dart';
import 'package:flutter_app/widget/WrapLayout.dart';

import 'PaddingTestRoute.dart';
import 'RowLayout.dart';
import 'ScaffoldRoute.dart';
import 'model/story.dart';

/// 作者 mcy
/// 时间 2019/6/20 14:34
///
class GalleryApp extends StatelessWidget {
  GalleryApp() {
    Router router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

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
      onGenerateRoute: Application.router.generator,
      routes: _buildRoutes(),
//      routes: {
//        Test1.routeName: (context) => Test1(),
//      },
      home: new _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("主页"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: new FlatButton(
                          child: new Text("Test1"),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            String message = "Flutter";
                            int code = 78;

                            String route = "/category/" +
                                Test1.routeName +
                                "?message=$message&color=$code";

                            //第三方路由
//                            Application.router.navigateTo(context, route);

                            //命名路由
//                            Navigator.pushNamed(context, Test1.routeName);
                            //命名路由传自定义参数
                            Navigator.pushNamed(context, Test1.routeName,
                                arguments: StoryModel(1, "flutter"));

                            //构建路由，可以传自定义参数
//                            Navigator.push(context, new MaterialPageRoute(
//                                builder: (context) {
//                              return new Test1();
//                            }));

//                            _onNavigator(context, Test1.routeName);
                          }))
                ],
              ),
              new FlatButton(
                  child: new Text("Test2"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    String message = "Flutter";
                    Application.router.navigateTo(
                        context, Test2.routeName + "?message=$message");
                  }),
              new FlatButton(
                  child: new Text("Test3"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, Test3.routeName);
                  }),
              new FlatButton(
                  child: new Text("Test4"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, Test4.routeName);
                  }),
              new FlatButton(
                  child: new Text("Test5"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
//                Navigator.pushNamed(context, Test2.routeName);
                    _onNavigator(context, ParentWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("TextWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, TextWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("ButtonWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ButtonWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("ImageWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ImageWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("SwitchAndCheckBoxTestRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, SwitchAndCheckBoxTestRoute.routeName);
                  }),
              new FlatButton(
                  child: new Text("TextFieldWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, TextFieldWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("RowLayout"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, RowLayout.routeName);
                  }),
              new FlatButton(
                  child: new Text("FlexLayoutTestRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, FlexLayoutTestRoute.routeName);
                  }),
              new FlatButton(
                  child: new Text("WrapLayout"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, WrapLayout.routeName);
                  }),
              new FlatButton(
                  child: new Text("StackLayout"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, StackLayout.routeName);
                  }),
              new FlatButton(
                  child: new Text("PaddingTestRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, PaddingTestRoute.routeName);
                  }),
              new FlatButton(
                  child: new Text("ConstrainedBoxAndSizedBox"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ConstrainedBoxAndSizedBox.routeName);
                  }),
              new FlatButton(
                  child: new Text("TransformWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, TransformWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("ContainerWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ContainerWidget.routeName);
                  }),
              new FlatButton(
                  child: new Text("ScaffoldRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ScaffoldRoute.routeName);
                  }),
              new FlatButton(
                  child: new Text("ListViewRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ListViewRoute.routeName);
                  }),
              new FlatButton(
                  child: new Text("ListViewRoute1"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, ListViewRoute1.routeName);
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
//  Application.router.navigateTo(context, '/category$routeName');
}
