import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/routers/router_handler.dart';

import '../Test2.dart';

class Routes {

  static void configureRoutes(Router router){
    router.define("/category/:type", handler: categoryHandler);
    router.define(Test2.routeName, handler: routesTest1Handler);
  }
}