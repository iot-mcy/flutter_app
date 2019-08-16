import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 作者 mcy
/// 时间 2019/8/16 14:08
///
class FancyBottomNavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _FancyBottomNavigationPageState();
  }
}

class _FancyBottomNavigationPageState extends State<FancyBottomNavigationPage> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("fancy_bottom_navigation"),
        ),
        body: Center(
          child: Text('currentPage：$currentPage'),
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.shopping_cart, title: "Basket")
          ],
          initialSelection: 1,
          onTabChangedListener: (position) {
            setState(() {
              currentPage = position;
            });
          },
        ));
  }
}
