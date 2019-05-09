import 'package:flutter/material.dart';

class WrapLayout extends StatelessWidget {
  const WrapLayout({Key key}) : super(key: key);
  static const String routeName = "/WrapLayout";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("WrapLayout"),
      ),
      body: Wrap(
        spacing: 16.0,
        runSpacing: 2.0,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Chip(
            label: Text("Hamilton"),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("A"),
            ),
          ),
          Chip(
            label: Text("Lafayette"),
            avatar: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text("M"),
            ),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('H')),
            label: new Text('Mulligan'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('J')),
            label: new Text('Laurens'),
          ),
        ],
      ),
    );
  }
}
