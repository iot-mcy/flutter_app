import 'package:flutter/material.dart';
import 'package:flutter_app/components/search_input.dart';
import 'item_video.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: builderSearchInput(context),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
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
                    return ItemVideo("阿丽塔战斗天使", 1200, 100,
                        "http://gif-china.cc/uploads/allimg/190223/1587b86bcdbf06ea.jpg?h=190");
                  },
                  childCount: 19,
                ),
              )
            ],
          ),
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
