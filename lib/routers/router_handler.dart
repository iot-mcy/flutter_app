import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../Test2.dart';
import '../test1.dart';

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
