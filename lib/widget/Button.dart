import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key key}) : super(key: key);
  static const String routeName = "/ButtonWidget";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Button"),
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            child: new Text("Button1"),
            onPressed: () => {},
          ),
          new FlatButton(onPressed: () => {}, child: new Text("Button2")),
          new OutlineButton(
            onPressed: () => {},
            child: new Text("Button3"),
          ),
          new IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => {},
          ),
          new RaisedButton.icon(
              onPressed: () => {},
              icon: new Icon(Icons.add),
              label: new Text("Button4")),
          new FlatButton(
            onPressed: () {},
            child: new Text(
              "Button5",
            ),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.red, Colors.green, Colors.blue],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Text('Gradient Button'),
            ),
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.purple,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: Icon(Icons.android),
              color: Colors.white,
              onPressed: () {
                print("filled background");
              },
            ),
          ),
        ],
      ),
    );
  }
}
