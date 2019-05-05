import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key key}) : super(key: key);
  static const String routeName = "/TextWidget";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("文本及样式"),
      ),
      body: new Column(
        children: <Widget>[
          new Text(
            "Hello world",
            textAlign: TextAlign.center,
          ),
          new Text(
            "Hello workd! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          new Text(
            "Hello world",
            textScaleFactor: 1.5,
          ),
          new Text(
            "Hello world",
            style: new TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: new Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          )
        ],
      ),
    );
  }
}
