import 'package:flutter/material.dart';
import 'package:flutter_app/components/search_input.dart';
import 'package:flutter_app/model/video_entity.dart';

import 'item_video.dart';

class Video extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _VideoState();
  }
}

class _VideoState extends State<Video> {
  List<VideoEntity> videos = new List();

  @override
  void initState() {
    super.initState();
    for (int index = 0; index < 9; index++) {
      VideoEntity entity = new VideoEntity(
          "阿丽塔",
          "http://gif-china.cc/uploads/allimg/190223/1587b86bcdbf06ea.jpg?h=190",
          120 + index);
      videos.add(entity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: builderSearchInput(context),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            slivers: <Widget>[
              getSliverGrid(videos),
            ],
          ),
        ));
  }

  SliverGrid getSliverGrid(List<VideoEntity> list) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                maxCrossAxisExtent: 120.0,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          crossAxisCount: 2,
          childAspectRatio: 0.68,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ItemVideo(list[index].title, list[index].count,
                list[index].count, list[index].titleImg);
          },
          childCount: list.length,
        ));
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
