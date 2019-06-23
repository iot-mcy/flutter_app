//import 'dart:io';

//import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routes.dart';
import 'package:flutter_app/views/home/home.dart';
import 'package:flutter_app/views/person/person.dart';
import 'package:flutter_app/views/video/video.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 作者 mcy
/// 时间 2019/6/20 14:23
///
class AppPage extends StatelessWidget {
  AppPage() {
//    if (Platform.isAndroid) {
//      SystemUiOverlayStyle systemUiOverlayStyle =
//          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//    }
    Router router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.grey[100],
        accentColor: Colors.grey[600],
        primaryColor: Colors.red,
      ),
      onGenerateRoute: Application.router.generator,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  DateTime _lastDateTime;

  void _onItemTapped(int index) {
    if (mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  var pages = <Widget>[
    Home(),
    Video(),
    Person(),
  ];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        child: Scaffold(
//          appBar: AppBar(
//            elevation: 0.0,
//            title: builderSearchInput(context),
//          ),
          body: IndexedStack(
            children: pages,
            index: _currentIndex,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("首页")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.ondemand_video), title: Text("视频")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), title: Text("我的")),
            ],
            backgroundColor: Colors.grey[200],
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.black45,
            onTap: _onItemTapped,
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
          ),
        ),
        onWillPop: _onWillPop);
  }

  //返回提示，是否退出应用
  Future<bool> _onWillPop() async {
    if (_lastDateTime == null ||
        DateTime.now().difference(_lastDateTime) > Duration(seconds: 2)) {
      _lastDateTime = DateTime.now();
      Fluttertoast.showToast(msg: "再点一次，退出应用");
      return false;
    } else {
      return true;
    }
  }
}
