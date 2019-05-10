import 'package:flutter/material.dart';

class TransformWidget extends StatelessWidget {
  const TransformWidget({Key key}) : super(key: key);
  static const String routeName = "/TransformWidget";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Transform"),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 200, height: 100),
          child: Container(
            color: Colors.black,
            child: Transform(
              alignment: Alignment.topRight,
              transform: Matrix4.skewY(18.0),
              child: Container(
                color: Colors.red,
                child: Text("Hello world"),
              ),
            ),
          ),
        ));
  }
}
