import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/8 14:02
/// 自定义列表第一次加载刷新
class CustomFirstRefreshWidget {
  static Widget firstRefreshWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
          child: SizedBox(
        height: 108.0,
        width: 108.0,
        child: Card(
          color: Color(0xAA000000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 48.0,
                height: 48.0,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Text(
                '加载中...',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
