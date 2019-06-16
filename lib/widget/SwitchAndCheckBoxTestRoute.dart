import 'package:flutter/material.dart';

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  const SwitchAndCheckBoxTestRoute({Key key}) : super(key: key);
  static const String routeName = "/SwitchAndCheckBoxTestRoute";

  @override
  _SwitchAndCheckBoxTestRoute createState() {
    // TODO: implement createState
    return new _SwitchAndCheckBoxTestRoute();
  }
}

class _SwitchAndCheckBoxTestRoute extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = false;
  bool _checkboxSelected = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("SwitchAndCheckBoxTestRoute"),
      ),
      body: Column(
        children: <Widget>[
          Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              }),
          Checkbox(
              value: _checkboxSelected,
              onChanged: (value) {
                setState(() {
                  _checkboxSelected = value;
                });
              })
        ],
      ),
    );
  }
}
