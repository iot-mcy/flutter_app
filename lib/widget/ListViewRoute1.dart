import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_refresh.dart' as listComp;
import 'package:flutter_app/custom_view/CustomListItemTwo.dart';

import 'ListViewRoute.dart';

class ListViewRoute1 extends StatefulWidget {
  const ListViewRoute1({Key key}) : super(key: key);
  static const String routeName = "/ListViewRoute1";

  @override
  _ListViewRoute1 createState() {
    // TODO: implement createState
    return new _ListViewRoute1();
  }
}

class _ListViewRoute1 extends State<ListViewRoute1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewRoute1"),
      ),
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: listComp.ListRefresh(getIndexListData, getItemWidget, null)),
    );
  }
}

Future<Map> getIndexListData([Map<String, dynamic> params]) async {
  var pageIndex = (params is Map) ? params['pageIndex'] : 0;
  var pageTotal = 10;

  List resultList = new List();
  for (int index = pageIndex == 0 ? 0 : 7;
      index < (pageIndex == 0 ? 7 : 10);
      index++) {
    ItemData itemData = new ItemData("", 'subtitle $index', 'author $index',
        'publishDate $index', 'readDuration $index');
    resultList.add(itemData);
  }

  pageIndex += 1;

  Map<String, dynamic> result = {
    "list": resultList,
    'total': pageTotal,
    'pageIndex': pageIndex
  };
  return result;
}

Widget getItemWidget(index, item) {
  return CustomListItemTwo(
    thumbnail: Container(
      decoration: BoxDecoration(color: Colors.green),
    ),
    title: item.title,
    subtitle: item.subtitle,
    author: item.author,
    publishDate: item.publishDate,
    readDuration: item.readDuration,
  );
}
