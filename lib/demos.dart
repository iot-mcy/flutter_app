import 'package:flutter/material.dart';
import 'package:flutter_app/Test2.dart';
import 'package:flutter_app/test1.dart';

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.routeName,
    @required this.builderRoute,
  })  : assert(title != null),
        assert(routeName != null),
        assert(builderRoute != null);

  final String title;
  final String routeName;
  final WidgetBuilder builderRoute;

  @override
  String toString() {
    return 'GalleryDemo{builderRoute: $builderRoute}';
  }
}

List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = [
    GalleryDemo(
        title: "Test1",
        routeName: Test1.routeName,
        builderRoute: (BuildContext context) => const Test1()),
    GalleryDemo(
        title: "Test2",
        routeName: Test2.routeName,
        builderRoute: (BuildContext context) => const Test2()),
  ];
  return galleryDemos;
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();
