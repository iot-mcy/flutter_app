import 'package:flutter/material.dart';

class PaddingTestRoute extends StatelessWidget {
  const PaddingTestRoute({Key key}) : super(key: key);
  static const String routeName = "/PaddingTestRoute";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Hello world"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Hello"),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Text("world"),
          ),
        ],
      ),
    );
  }
}
