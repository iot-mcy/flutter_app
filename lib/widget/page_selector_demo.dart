import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/9/5 11:29
///
class PageSelectorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PageSelectorPageState();
  }
}

class _PageSelectorPageState extends State<PageSelectorPage> {
  @override
  Widget build(BuildContext context) {
    TabController tabController = DefaultTabController.of(context);
    List<Widget> listWidget = <Widget>[
      Card(
        child: Center(
          child: Icon(
            Icons.event,
            semanticLabel: 'Event',
            size: 88.0,
          ),
        ),
      ),
      Card(
        child: Center(
          child: Icon(
            Icons.home,
            semanticLabel: 'Home',
            size: 88.0,
          ),
        ),
      ),
      Card(
        child: Center(
          child: Icon(
            Icons.android,
            semanticLabel: 'android',
            size: 88.0,
          ),
        ),
      ),
      Card(
        child: Center(
          child: Icon(
            Icons.alarm,
            semanticLabel: 'alarm',
            size: 88.0,
          ),
        ),
      ),
      Card(
        child: Center(
          child: Icon(
            Icons.face,
            semanticLabel: 'face',
            size: 88.0,
          ),
        ),
      ),
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("PageView with indicator"),
        ),
        body: DefaultTabController(
          length: listWidget.length,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TabBarView(children: listWidget),
              ),
              TabPageSelector(
                controller: tabController,
              ),
            ],
          ),
        ));
  }
}
