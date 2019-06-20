import 'package:flutter/material.dart';

class Person extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Theme.of(context).backgroundColor,
        child: Text("我的"),
      ),
    );
  }
}
