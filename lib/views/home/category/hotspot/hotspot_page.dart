import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_empty_widget.dart';
import 'package:flutter_app/components/custom_first_refresh_widget.dart';
import 'package:flutter_app/components/custom_refresh_header_footer.dart';
import 'package:flutter_app/utils/net_utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

class _HotspotPageState extends State<HotspotPage>
    with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller = EasyRefreshController();
  List items = new List();
  int max_behot_time = 0;

  @override
  bool get wantKeepAlive => true;

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
            delegate: SliverChildListDelegate([
              Container(
                height: 144.0,
                child: ScrollNotificationInterceptor(
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.teal[index * 100 + 100],
                        ),
                      );
                    },
                    itemCount: 5,
                    viewportFraction: 0.8,
                    scale: 0.9,
                    autoplay: true,
                    pagination: SwiperPagination(alignment: Alignment.bottomCenter),
                    control: new SwiperControl(),
                  ),
                ),
              ),
            ]),
          ),
//          SliverList(
//            delegate: SliverChildListDelegate.fixed(<Widget>[
//              Container(
//                alignment: Alignment.center,
//                color: Colors.green,
//                height: 144.0,
//                child: Text(
//                  "wellcom",
//                  style: TextStyle(color: Colors.white, fontSize: 16.0),
//                ),
//              ),
//            ]),
//          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return HotspotPageItem(items[index]);
              },
              childCount: items.length,
            ),
          ),
        ],

//        child: ListView.separated(
//            itemBuilder: (BuildContext context, int index) {
//              return HotspotPageItem(items[index]);
//            },
//            separatorBuilder: (BuildContext context, int index) {
//              return Divider(
//                color: Colors.grey[400],
//                height: 0.0,
//              );
//            },
//            itemCount: items.length),

        onRefresh: () async {
          getData(true, 0);
        },
        onLoad: () async {
          getData(false, max_behot_time);
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
