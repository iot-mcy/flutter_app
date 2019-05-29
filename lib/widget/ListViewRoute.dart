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
    final List<String> entries = <String>['A', 'B', 'C'];
    final List<int> colorCodes = <int>[600, 500, 100];

    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),

//      body: ListView(
//        shrinkWrap: true,
//        padding: const EdgeInsets.all(16.0),
//        children: <Widget>[
//          Container(
//            height: 50,
//            color: Colors.amber[600],
//            child: const Center(child: Text('Entry A')),
//          ),
//          Container(
//            height: 50,
//            color: Colors.amber[500],
//            child: const Center(child: Text('Entry B')),
//          ),
//          Container(
//            height: 50,
//            color: Colors.amber[100],
//            child: const Center(child: Text('Entry C')),
//          ),
//        ],
//      ),

//      body: ListView.builder(
//          padding: EdgeInsets.all(8.0),
//          itemCount: entries.length,
//          itemBuilder: (BuildContext context, int index) {
//            return Container(
//              height: 56.0,
//              color: Colors.amber[colorCodes[index]],
//              child: Center(
//                child: Text(entries[index]),
//              ),
//            );
//          }),

      body: ListView.separated(
          itemCount: entries.length,
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? dividerBlue : dividerGreen;
          },
          itemBuilder: (BuildContext context, int index) {
            return ListTile(title: Text(entries[index]+"$index"));
          }),
    );
  }

  void _retrieveData() {
//    Future.delayed(Duration(seconds: 2)).then((e) {
//      _words.insertAll(_words.length-1, )
//    });
  }
}
