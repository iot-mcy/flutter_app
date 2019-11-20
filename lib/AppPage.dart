//import 'dart:io';

//import 'package:flutter/services.dart';
import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routes.dart';
import 'package:flutter_app/views/home/home.dart';
import 'package:flutter_app/views/person/person.dart';
import 'package:flutter_app/views/video/video.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'gallery_app.dart';

/// 作者 mcy
/// 时间 2019/6/20 14:23
///
///
const int ThemeColor = 0xFFC91B3A;

class AppPage extends StatelessWidget {
  AppPage() {
    if (Platform.isAndroid) {
      ///是Android系统的设置状态栏未透明的
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    Router router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
//        primarySwatch: Colors.red,
          primaryColor: Color(ThemeColor),
          backgroundColor: Colors.grey[100],
          accentColor: Colors.grey[600],
//        textTheme: TextTheme(
//          body1: TextStyle(color: Color(0xFF888888),fontSize: 16.0)
//        ),
          iconTheme: IconThemeData(color: Color(ThemeColor))),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      //国际化
      supportedLocales: [
        const Locale('zh', 'CH'), // Chinese
        const Locale('en', 'US'), // English
        // ... other locales the app supports
      ],
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
        if (index == 3) {
          //当点到“我的”tab时需要改变状态的颜色
          SystemUiOverlayStyle systemUiOverlayStyle =
              SystemUiOverlayStyle(statusBarColor: Colors.white);
          SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
        } else {
          SystemUiOverlayStyle systemUiOverlayStyle =
              SystemUiOverlayStyle(statusBarColor: Colors.transparent);
          SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
        }
      });
    }
  }

  var pages = <Widget>[
    Home(),
    Video(),
    GalleryApp(),
    Person(),
  ];

  @override
  void initState() {
    //todo
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

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
                  icon: Icon(Icons.apps), title: Text("Widget")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box), title: Text("我的")),
            ],
            backgroundColor: Colors.grey[100],
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
