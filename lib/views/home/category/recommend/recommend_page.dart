import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_empty_widget.dart';
import 'package:flutter_app/components/custom_first_refresh_widget.dart';
import 'package:flutter_app/components/custom_refresh_header_footer.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:flutter_app/views/home/category/hotspot/hotspot_page_item_data.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'recommend_page_item.dart';

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
  EasyRefreshController _controller = EasyRefreshController();
  List items = new List();
  int max_behot_time = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh(
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
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return RecommendPageItem(items[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: Colors.grey[400],
                height: 0.0,
              );
            },
            itemCount: items.length),
        onRefresh: () async {
          getData(true, 0);
        },
        onLoad: () async {
          getData(false, max_behot_time);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  // don't forget to dispose refreshController
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  getData(bool isRefresh, int time) async {
    final _param = {'max_behot_time': time};
    var response =
        await NetUtils.get("https://www.toutiao.com/api/pc/feed/?", _param);
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
