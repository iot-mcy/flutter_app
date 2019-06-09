import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  const Test2({Key key}) : super(key: key);
  static const String routeName = "/widget/Test2";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Sample();
  }
}

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Test2'),
      ),
      body: new Center(
        child: new MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text('Hello'),
          padding: new EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }
}
