import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key key}) : super(key: key);
  static const String routeName = "/ContainerWidget";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("容器Container"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 56.0, left: 120.0),
            constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.red, Colors.orange],
                    center: Alignment.centerLeft,
                    radius: 1.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 8.0)
                ],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(8.0)),
            transform: Matrix4.rotationZ(0.4),
            alignment: Alignment.center,
            child: Text(
              "5.20",
              style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            color: Colors.orange,
            child: Text("Hello world"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            color: Colors.orange,
            child: Text("Hello world"),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("Hello world!"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.orange),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Hello world!"),
            ),
          ),
        ],
      ),
    );
  }
}
