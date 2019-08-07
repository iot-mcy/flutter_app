import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/pagination.dart';
import 'package:flutter_app/custom_view/CustomListItemTwo.dart';
import 'package:flutter_app/widget/ListViewRoute.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// 作者 mcy
/// 时间 2019/8/7 16:33
/// 推荐
class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RecommendPageState();
  }
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted)
      setState(() {
        //todo
      });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader (),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
          itemExtent: 100.0,
          itemCount: items.length,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  // don't forget to dispose refreshController
  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }
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
  var readDuration = 1;
  return CustomListItemTwo(
    thumbnail: Container(
      decoration: BoxDecoration(color: Colors.green),
    ),
    title: title,
    subtitle: subtitle,
    author: author,
    createdTime: publishDate,
    commentCount: readDuration,
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
