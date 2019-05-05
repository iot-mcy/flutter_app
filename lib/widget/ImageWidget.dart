import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key key}) : super(key: key);
  static const String routeName = "/ImageWidget";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ImageWidget"),
      ),
      body: new Column(
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/image02.png"),
            width: 56.0,
          ),
          Image.asset("assets/images/image02.png", width: 100.0),
          Image.network(
              "https://cdn.jsdelivr.net/gh/flutterchina/website@1.0/images/flutter-mark-square-100.png"),
          Icon(
            Icons.android,
            color: Colors.green,
            size: 56.0,
          ),
        ],
      ),
    );
  }
}
