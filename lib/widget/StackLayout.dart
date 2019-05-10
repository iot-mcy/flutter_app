import 'package:flutter/material.dart';

///层叠布局
class StackLayout extends StatelessWidget {
  const StackLayout({Key key}) : super(key: key);
  static const String routeName = "/StackLayut";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("StackLayut"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
//          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              left: 32.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.blue,
                      Colors.yellow,
                    ]),
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
                child: Text("I am Jack"),
              ),
            ),
            Container(
              child: Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            Positioned(
              top: 32.0,
              child: Text("Your friend"),
            ),
          ],
        ),
      ),
    );
  }
}
