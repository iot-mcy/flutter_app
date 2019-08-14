import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/widget/Button.dart';
import 'package:flutter_app/widget/ConstrainedBoxAndSizedBox.dart';
import 'package:flutter_app/widget/ContainerWidget.dart';
import 'package:flutter_app/widget/FlexLayoutTestRoute.dart';
import 'package:flutter_app/widget/ImageWidget.dart';
import 'package:flutter_app/widget/ListViewRoute.dart';
import 'package:flutter_app/widget/ListViewRoute1.dart';
import 'package:flutter_app/widget/StackLayout.dart';
import 'package:flutter_app/widget/SwitchAndCheckBoxTestRoute.dart';
import 'package:flutter_app/widget/TextFieldWidget.dart';
import 'package:flutter_app/widget/TextWidget.dart';
import 'package:flutter_app/widget/TransformWidget.dart';
import 'package:flutter_app/widget/WrapLayout.dart';

import 'demo/cached_network_image_page.dart';
import 'demo/device_info_page.dart';
import 'demo/image_picker.dart';
import 'demo/multi_image_picker.dart';
import 'demo/package_info_page.dart';
import 'demo/path_provider.dart';
import 'demo/photo_view_page.dart';
import 'demo/url_launcher.dart';
import 'widget/PaddingTestRoute.dart';
import 'widget/RowLayout.dart';
import 'widget/ScaffoldRoute.dart';
import 'widget/Test2.dart';
import 'widget/Test3.dart';
import 'widget/Test4.dart';
import 'widget/Test5.dart';
import 'widget/test1.dart';

/// 作者 mcy
/// 时间 2019/6/20 14:34
/// Widget Demo
class GalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: new FlatButton(
                          child: new Text("Test1"),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {
                            String message = "Flutter";
                            int code = 78;

                            //第三方路由
//                        String route = "/category/" +
//                            Test1.routeName +
//                            "?message=$message&color=$code";
//                            Application.router.navigateTo(context, route);

                            //命名路由，需要注册
//                            Navigator.pushNamed(context, Test1.routeName);
                            //命名路由传自定义参数，需要注册
//                        Navigator.pushNamed(context, Test1.routeName,
//                            arguments: StoryModel(1, "flutter"));

                            //构建路由，可以传自定义参数
//                            Navigator.push(context, new MaterialPageRoute(
//                                builder: (context) {
//                              return new Test1();
//                            }));

                            _onNavigator(context, new Test1());
                          }))
                ],
              ),
              new FlatButton(
                  child: new Text("Test2"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    String message = "Flutter";
                    Application.router.navigateTo(
                        context, Test2.routeName + "?message=$message");
                  }),
              new FlatButton(
                  child: new Text("Test3"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new Test3());
                  }),
              new FlatButton(
                  child: new Text("Test4"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new Test4());
                  }),
              new FlatButton(
                  child: new Text("Test5"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ParentWidget());
                  }),
              new FlatButton(
                  child: new Text("TextWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new TextWidget());
                  }),
              new FlatButton(
                  child: new Text("ButtonWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ButtonWidget());
                  }),
              new FlatButton(
                  child: new Text("ImageWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ImageWidget());
                  }),
              new FlatButton(
                  child: new Text("SwitchAndCheckBoxTestRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new SwitchAndCheckBoxTestRoute());
                  }),
              new FlatButton(
                  child: new Text("TextFieldWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new TextFieldWidget());
                  }),
              new FlatButton(
                  child: new Text("RowLayout"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new RowLayout());
                  }),
              new FlatButton(
                  child: new Text("FlexLayoutTestRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new FlexLayoutTestRoute());
                  }),
              new FlatButton(
                  child: new Text("WrapLayout"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new WrapLayout());
                  }),
              new FlatButton(
                  child: new Text("StackLayout"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new StackLayout());
                  }),
              new FlatButton(
                  child: new Text("PaddingTestRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new PaddingTestRoute());
                  }),
              new FlatButton(
                  child: new Text("ConstrainedBoxAndSizedBox"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ConstrainedBoxAndSizedBox());
                  }),
              new FlatButton(
                  child: new Text("TransformWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new TransformWidget());
                  }),
              new FlatButton(
                  child: new Text("ContainerWidget"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ContainerWidget());
                  }),
              new FlatButton(
                  child: new Text("ScaffoldRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ScaffoldRoute());
                  }),
              new FlatButton(
                  child: new Text("ListViewRoute"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ListViewRoute());
                  }),
              new FlatButton(
                  child: new Text("ListViewRoute1"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ListViewRoute1());
                  }),
              new FlatButton(
                  child: new Text("url_launcher的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new UrlLauncher());
                  }),
              new FlatButton(
                  child: new Text("path_provider的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new PathProvider());
                  }),
              new FlatButton(
                  child: new Text("image_picker的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new ImagePickerPage());
                  }),
              new FlatButton(
                  child: new Text("multi_image_picker的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new MultiImagePickerPage());
                  }),
              new FlatButton(
                  child: new Text("cached_network_image的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new CachedNetworkImagePage());
                  }),
              new FlatButton(
                  child: new Text("package_info的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new PackageInfoPage());
                  }),
              new FlatButton(
                  child: new Text("device_info的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new DeviceInfoPage());
                  }),
              new FlatButton(
                  child: new Text("photo_view的使用"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    _onNavigator(context, new PhotoViewPage());
                  }),
            ],
          ),
        ));
  }
}

void _onNavigator(BuildContext context, var route) {
//  Application.router.navigateTo(context, '/category$routeName');

  Navigator.push(context, new MaterialPageRoute(builder: (context) {
    return route;
  }));
}
