import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/6/20 14:22
/// 顶部导航栏的出入框以及发布的入口
class SearchInput extends StatelessWidget {
  final voidCallback;

  SearchInput({this.voidCallback});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Icon(
                      Icons.search,
                      color: Theme.of(context).accentColor,
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 4.0)),
                    Expanded(
                        child: InkWell(
                            onTap: this.voidCallback,
                            child: Text(
                              "搜索",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 16.0),
                            ))),
                  ],
                ))),
        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
        InkWell(
          onTap: () {
            //todo 这里做调转，
            print("调转到作品发布编辑界面");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 32.0,
              ),
              Text(
                "发布",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
