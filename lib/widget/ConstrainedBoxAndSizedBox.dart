import 'package:flutter/material.dart';

class ConstrainedBoxAndSizedBox extends StatelessWidget {
  const ConstrainedBoxAndSizedBox({Key key}) : super(key: key);
  static const String routeName = "/ConstrainedBoxAndSizedBox";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));
    return Scaffold(
      appBar: AppBar(
        title: Text("约束大小"),
        actions: <Widget>[
          UnconstrainedBox(
              child: SizedBox(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(
              strokeWidth: 3.0,
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: ConstrainedBox(
//          constraints: BoxConstraints(
//            minWidth: double.infinity,
//            minHeight: 56.0,
//            maxHeight: 100.0,
//          ),
//          constraints: BoxConstraints.tightFor(width: 100.0, height: 56.0),
          constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
//          child: Container(
//            height: 100.0,
//            width: 100.0,
//            child: redBox,
//          ),
          child: UnconstrainedBox(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 100.0, minHeight: 20.0),
              child: redBox,
            ),
          ),
        ),
      ),
    );
  }
}
