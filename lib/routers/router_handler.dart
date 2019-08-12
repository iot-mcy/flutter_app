import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/web_page/web_view_page.dart';
import 'package:flutter_app/widget/Test2.dart';
import 'package:flutter_app/widget/test1.dart';

var categoryHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  String name = params["type"]?.first;
  switch (name) {
    case Test1.routeName:
      return new Test1();
    case Test2.routeName:
      return new Test2();
  }
});

var routesTest1Handler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return new Test2();
});

var webViewPageHand = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String url = params["url"]?.first;
  String title = params["title"]?.first;
  return new WebViewPage(url, title);
});
