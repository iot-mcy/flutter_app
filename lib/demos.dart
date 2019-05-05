import 'package:flutter/material.dart';
import 'package:flutter_app/Test2.dart';
import 'package:flutter_app/Test3.dart';
import 'package:flutter_app/Test4.dart';
import 'package:flutter_app/Test5.dart';
import 'package:flutter_app/test1.dart';
import 'package:flutter_app/widget/Button.dart';
import 'package:flutter_app/widget/ImageWidget.dart';
import 'package:flutter_app/widget/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/widget/TextFieldWidget.dart';
import 'package:flutter_app/widget/TextWidget.dart';

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
    GalleryDemo(
        title: "Test3",
        routeName: Test3.routeName,
        builderRoute: (BuildContext context) => const Test3()),
    GalleryDemo(
        title: "Test4",
        routeName: Test4.routeName,
        builderRoute: (BuildContext context) => const Test4()),
    GalleryDemo(
        title: "Test5",
        routeName: ParentWidget.routeName,
        builderRoute: (BuildContext context) => const ParentWidget()),
    GalleryDemo(
        title: "TextWidget",
        routeName: TextWidget.routeName,
        builderRoute: (BuildContext context) => const TextWidget()),
    GalleryDemo(
        title: "ButtonWidget",
        routeName: ButtonWidget.routeName,
        builderRoute: (BuildContext context) => const ButtonWidget()),
    GalleryDemo(
        title: "ImageWidget",
        routeName: ImageWidget.routeName,
        builderRoute: (BuildContext context) => const ImageWidget()),
    GalleryDemo(
        title: "SwitchAndCheckBoxTestRoute",
        routeName: SwitchAndCheckBoxTestRoute.routeName,
        builderRoute: (BuildContext context) => const SwitchAndCheckBoxTestRoute()),
    GalleryDemo(
        title: "TextFieldWidget",
        routeName: TextFieldWidget.routeName,
        builderRoute: (BuildContext context) => const TextFieldWidget()),
  ];
  return galleryDemos;
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();
