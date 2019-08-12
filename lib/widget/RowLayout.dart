import 'package:flutter/material.dart';

class RowLayout extends StatelessWidget {
  const RowLayout({Key key}) : super(key: key);
  static const String routeName = "/RowLayout";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("RowLayout"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Hello world"),
              Text("I am Jack"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hello world",
              ),
              Text("I am Jack"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Text("Hello world"),
              Text("I am Jack"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Text(
                "Hello world",
                style: TextStyle(fontSize: 30.0),
              ),
              Text("I am Jack"),
            ],
          )
        ],
      ),
    );
  }
}
