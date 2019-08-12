import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_empty_widget.dart';
import 'package:flutter_app/components/custom_first_refresh_widget.dart';
import 'package:flutter_app/components/custom_refresh_header_footer.dart';
import 'package:flutter_app/components/search_input.dart';
import 'package:flutter_app/model/video_entity.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'item_video.dart';

/// 作者 mcy
/// 时间 2019/8/12 14:19
/// 短视频
class Video extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _VideoState();
  }
}

class _VideoState extends State<Video> {
  List<VideoEntity> videos = new List();
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: builderSearchInput(context),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: EasyRefresh.custom(
            controller: _controller,
            enableControlFinishRefresh: true,
            enableControlFinishLoad: true,
            header: CustomClassicalHeaderFooter.getHeader(),
            footer: CustomClassicalHeaderFooter.getFooter(),
            firstRefresh: true,
            firstRefreshWidget: CustomFirstRefreshWidget.firstRefreshWidget(),
            emptyWidget:
                videos.length == 0 ? CustomEmptyWidget.emptyWidget() : null,
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                maxCrossAxisExtent: 120.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 2,
                  childAspectRatio: 0.68,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    VideoEntity entity = videos[index];
                    return ItemVideo(entity.title, entity.count, entity.count,
                        entity.titleImg);
                  },
                  childCount: videos.length,
                ),
              )
            ],
            onRefresh: () async {
              getData(true, 0);
            },
            onLoad: () async {
              getData(false, 0);
            },
          ),
        ));
  }

  getData(bool isRefresh, int i) async {
    List<VideoEntity> list = new List();
    for (int index = 0; index < 9; index++) {
      VideoEntity entity = new VideoEntity(
          "阿丽塔",
          "http://gif-china.cc/uploads/allimg/190223/1587b86bcdbf06ea.jpg?h=190",
          120 + index);
      list.add(entity);
    }
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _controller.finishRefresh(success: true);
        _controller.finishLoad(noMore: false);
        if (isRefresh) {
          videos.clear();
        }
        videos.addAll(list);
      });
    });
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
