import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// 作者 mcy
/// 时间 2019/8/16 9:28
/// 加载SVG图片
class FlutterSvgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter_svg"),
      ),
      body: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/ic_account.svg",
            height: 56.0,
            width: 56.0,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
