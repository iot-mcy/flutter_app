import 'package:flutter/material.dart';

class Test4 extends StatelessWidget {
  const Test4({Key key}) : super(key: key);
  static const String routeName = "/Test4";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    // TODO: implement createState
    return new _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test4"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("You have pushed the button this many times:"),
            new Text(
              "$_counter",
              style: Theme.of(context).textTheme.display1,
            ),
            new FlatButton(
                onPressed: () {
//                  Navigator.pushNamed(context, "new_page");
                  Navigator.push(context,
                      new MaterialPageRoute(builder: (context) {
                    return new NewRoute();
                  }));
                },
                child: new Text("open new route")),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        child: new Icon((Icons.add)),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("New route"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("This is new route"),
          new Image.asset("assets/images/image02.png"),
          new FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: new Text("POP")),
        ],
      )),
    );
  }
}
