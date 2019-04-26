import 'package:flutter/material.dart';

class Test2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Sample(),
    );
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
            //todo
          },
          child: new Text('Hello'),
          padding: new EdgeInsets.only(left: 10, right: 10),
        ),
      ),
    );
  }
}
