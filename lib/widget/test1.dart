import 'package:flutter/material.dart';
import 'package:flutter_app/model/story.dart';

class Test1 extends StatelessWidget {
  const Test1({Key key}) : super(key: key);
  static const String routeName = "/Test1";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final StoryModel model = ModalRoute.of(context).settings.arguments;
    return new SampleAppPage();
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  _SampleAppPageState createState() {
    return new _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = "I like flutter";

  void _updateText() {
    setState(() {
      textToShow = "flutter is Awesome";
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Test1"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        }),
      ),
      body: new Center(
        child: new Text(textToShow),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _updateText,
        tooltip: 'Uptate Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}

//class Test1 extends StatelessWidget {
//  const Test1({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return new MaterialApp(
//      title: 'Test1',
//      theme: new ThemeData(primarySwatch: Colors.blue),
////      home: Scaffold(
////          body: Row(
////        children: <Widget>[
////          const FlutterLogo(),
////          const Expanded(
////            child: Text(
////                'Flutter\'s hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.'),
////          ),
////          const Icon(Icons.sentiment_very_satisfied),
////        ],
////      )),
//    );
//  }
//}
