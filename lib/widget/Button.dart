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
          new IconButton(icon: Icon(Icons.thumb_up), onPressed: () => {}),
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
          )
        ],
      ),
    );
  }
}
