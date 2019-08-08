import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_empty_widget.dart';
import 'package:flutter_app/components/custom_first_refresh_widget.dart';
import 'package:flutter_app/components/custom_refresh_header_footer.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'hotspot_page_item.dart';
import 'hotspot_page_item_data.dart';

/// 作者 mcy
/// 时间 2019/8/7 11:39
/// 热点新闻
class HotspotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HotspotPageState();
  }
}

class _HotspotPageState extends State<HotspotPage> {
  // 总数
  int _count = 0;
  EasyRefreshController _controller = EasyRefreshController();
  List items = new List();
  int max_behot_time = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.custom(
        controller: _controller,
        enableControlFinishRefresh: true,
        enableControlFinishLoad: true,
        header: CustomClassicalHeaderFooter.getHeader(),
        footer: CustomClassicalHeaderFooter.getFooter(),
//        header: MaterialHeader(),
//        footer: MaterialFooter(),
        firstRefresh: true,
        firstRefreshWidget: CustomFirstRefreshWidget.firstRefreshWidget(),
        emptyWidget: items.length == 0 ? CustomEmptyWidget.emptyWidget() : null,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HotspotPageItem(items[index]);
              },
              childCount: items.length,
            ),
          ),
        ],
        onRefresh: () async {
          getData(true, 0);
//          await Future.delayed(Duration(seconds: 2), () {
//            setState(() {
//              _controller.finishRefresh(success: true);
//              _controller.finishLoad(noMore: false);
//              _count = 20;
//            });
//          });
        },
        onLoad: () async {
          getData(false, max_behot_time);
//          await Future.delayed(Duration(seconds: 2), () {
//            setState(() {
//              if (_count > 38) {
//                _controller.finishLoad(success: true, noMore: true);
//                return;
//              }
//              _controller.finishLoad(success: true, noMore: false);
//              _count += 20;
//            });
//          });
        },
      ),
    );
  }

  getData(bool isRefresh, int time) async {
    final _param = {'max_behot_time': time};
    var response = await NetUtils.get(
        "https://www.toutiao.com/api/pc/feed/?category=news_hot", _param);
    print(response);
    max_behot_time = response['next']['max_behot_time'];
    var responseList = [];
    responseList = response['data'];
    List list = new List();
    for (int index = 0; index < responseList.length; index++) {
      var entity = responseList[index];
      list.add(new HotspotPageItemData.fromJson(entity));
    }

    setState(() {
      _controller.finishRefresh(success: true);
      _controller.finishLoad(noMore: false);
      if (isRefresh) {
        items.clear();
      }
      items.addAll(list);
    });
  }
}
