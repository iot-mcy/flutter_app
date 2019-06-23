import 'package:flutter/material.dart';
import 'package:flutter_app/components/list_refresh.dart' as listComp;
import 'package:flutter_app/components/pagination.dart';
import 'package:flutter_app/custom_view/CustomListItemTwo.dart';
import 'package:flutter_app/widget/ListViewRoute.dart';

class Recommend extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecommendState();
  }
}

class _RecommendState extends State<Recommend>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: listComp.ListRefresh(
          getIndexListData, getItemWidget, headerView, false),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

Future<Map> getIndexListData([Map<String, dynamic> params]) async {
  //todo 在这里做网络请求
  var pageIndex = (params is Map) ? params['pageIndex'] : 0;
  var pageTotal = 10;

  List resultList = new List();
  for (int index = pageIndex == 0 ? 0 : 7;
      index < (pageIndex == 0 ? 7 : 10);
      index++) {
    ItemData itemData = new ItemData('title$index', 'subtitle $index',
        'author $index', 'publishDate $index', 'readDuration $index');
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
  var title = item.title;
  var subtitle = item.subtitle;
  var author = item.author;
  var publishDate = item.publishDate;
  var readDuration = item.readDuration;
  return CustomListItemTwo(
    thumbnail: Container(
      decoration: BoxDecoration(color: Colors.green),
    ),
    title: title,
    subtitle: subtitle,
    author: author,
    publishDate: publishDate,
    readDuration: readDuration,
  );
}

Widget headerView() {
  return Column(
    children: <Widget>[
      Stack(
        children: <Widget>[
          Pagination(),
        ],
      )
    ],
  );
}

Widget headerView1() {
  return Container(
    height: 100.0,
    color: Colors.blue,
    alignment: Alignment.center,
    child: Text("HeaderView"),
  );
}
