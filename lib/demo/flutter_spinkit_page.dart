import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// 作者 mcy
/// 时间 2019/8/16 9:57
/// 各种加载中的Widget
class FlutterSpinKitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter_spinkit"),
      ),
      body: Column(
        children: <Widget>[
          SpinKitRotatingPlain(
            color: Colors.redAccent,
          ),
          SpinKitCircle(
            color: Colors.redAccent,
          ),
          SpinKitFadingCircle(
            color: Colors.redAccent,
          ),
          SpinKitPouringHourglass(
            color: Colors.redAccent,
          ),
          ///还有很多样式，
        ],
      ),
    );
  }
}
