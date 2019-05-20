import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  const ListViewRoute({Key key}) : super(key: key);
  static const String routeName = "/ListViewRoute";

  @override
  _ListViewRoute createState() {
    // TODO: implement createState
    return new _ListViewRoute();
  }
}

class _ListViewRoute extends State<ListViewRoute> {

  Widget dividerBlue = Divider(color: Colors.blue);
  Widget dividerGreen = Divider(color: Colors.green);

  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView.separated(
          itemCount: 100,
//          itemExtent: 48.0,
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? dividerBlue : dividerGreen;
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text("$index"));
          }),
    );
  }

  void _retrieveData() {
//    Future.delayed(Duration(seconds: 2)).then((e) {
//      _words.insertAll(_words.length-1, )
//    });
  }
}


