import 'package:flutter/material.dart';
import 'package:flutter_app/components/search_input.dart';
import 'category/attention/attention_page.dart';

import 'category/hotspot/hotspot_page.dart';
import 'category/other/other_page.dart';
import 'category/recommend/recommend_page.dart';
import 'category/science_technology/science_technology.dart';

/// 作者 mcy
/// 时间 2019/6/20 16:17
/// 首页
class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _homeState();
  }
}

class _homeState extends State with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: widgetList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  var widgetList = <Widget>[
    AttentionPage(),
    RecommendPage(),
    HotspotPage(),
    ScienceTechnology(),
    OtherPage("娱乐"),
    OtherPage("游戏"),
    OtherPage("体育"),
    OtherPage("汽车"),
  ];
  var tabTitleList = <Widget>[
    Text("关注"),
    Text("推荐"),
    Text("热点"),
    Text("科技"),
    Text("娱乐"),
    Text("游戏"),
    Text("体育"),
    Text("汽车"),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: tabTitleList.length,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: builderSearchInput(context),
//          bottom: TabBar(
//            labelStyle: TextStyle(fontSize: 18.0),
//            isScrollable: true,
//            tabs: tabTitleList,
//            controller: _tabController,
//          ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 40,
                child: TabBar(
                  labelStyle: TextStyle(fontSize: 18.0),
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.black54,
                  isScrollable: true,
                  tabs: tabTitleList,
                  controller: _tabController,
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: widgetList,
                controller: _tabController,
              ))
            ],
          )),
    );
  }
}

Widget builderSearchInput(BuildContext context) {
  return new SearchInput(
    voidCallback: onVoidCallback,
  );
}

void onVoidCallback() {
  print("调转到搜索界面");
}
