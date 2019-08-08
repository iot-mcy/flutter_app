import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 作者 mcy
/// 时间 2019/8/8 10:01
/// 自定义下拉刷新和上拉加载更多的样式
class CustomClassicalHeaderFooter {
  static Header getHeader() {
    return ClassicalHeader(
      refreshText: "下拉可以刷新",
      refreshReadyText: "释放立即刷新",
      refreshingText: "正在刷新...",
      refreshedText: "刷新完成",
      refreshFailedText: "刷新失败",
      noMoreText: "没有更多",
      infoText: "上次更新 %T",
      showInfo: false,
      bgColor: Colors.transparent,
      textColor: Colors.black38,
      infoColor: Colors.teal,
    );
  }

  static Footer getFooter() {
    return new ClassicalFooter(
      loadText: "上拉可以加载",
      loadReadyText: "释放立即加载",
      loadingText: "正在加载...",
      loadedText: "加载完成",
      loadFailedText: "加载失败",
      noMoreText: "没有更多",
      infoText: "更新时间 %T",
      showInfo: false,
      bgColor: Colors.transparent,
      textColor: Colors.black38,
      infoColor: Colors.teal,
    );
  }
}
