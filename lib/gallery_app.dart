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
import 'package:flutter_app/widget/bottom_sheet.dart';
import 'package:flutter_app/widget/event_bus_page.dart';
import 'package:flutter_app/widget/flutter_html_page.dart';

import 'demo/azlistview_page.dart';
import 'demo/barcode_scan_page.dart';
import 'demo/cached_network_image_page.dart';
import 'demo/camera_page.dart';
import 'demo/connectivity_page.dart';
import 'demo/device_info_page.dart';
import 'demo/dialog_demo.dart';
import 'demo/fancy_bottom_navigation_page.dart';
import 'demo/flutter_spinkit_page.dart';
import 'demo/flutter_svg_page.dart';
import 'demo/gallery_example.dart';
import 'demo/image_cropper_page.dart';
import 'demo/image_picker.dart';
import 'demo/local_notifications_page.dart';
import 'demo/multi_image_picker.dart';
import 'demo/package_info_page.dart';
import 'demo/path_provider.dart';
import 'demo/percent_indicator_page.dart';
import 'demo/photo_view_page.dart';
import 'demo/qr_flutter_page.dart';
import 'demo/sensors_page.dart';
import 'demo/shared_preferences_page.dart';
import 'demo/url_launcher.dart';
import 'demo/video_player_page.dart';
import 'widget/PaddingTestRoute.dart';
import 'widget/RowLayout.dart';
import 'widget/ScaffoldRoute.dart';
import 'widget/Test2.dart';
import 'widget/Test3.dart';
import 'widget/Test4.dart';
import 'widget/Test5.dart';
import 'widget/ToggleButtonsPage.dart';
import 'widget/chip_page.dart';
import 'widget/page_selector_demo.dart';
import 'widget/radio_page.dart';
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
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          children: <Widget>[
            new FlatButton(
                child: new Text("Test1"),
                color: Colors.grey[200],
                textColor: Colors.black54,
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
                }),
            new FlatButton(
                child: new Text("Test2"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  String message = "Flutter";
                  Application.router.navigateTo(
                      context, Test2.routeName + "?message=$message");
                }),
            new FlatButton(
                child: new Text("Test3"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new Test3());
                }),
            new FlatButton(
                child: new Text("Test4"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new Test4());
                }),
            new FlatButton(
                child: new Text("Test5"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ParentWidget());
                }),
            new FlatButton(
                child: new Text("TextWidget"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new TextWidget());
                }),
            new FlatButton(
                child: new Text("ButtonWidget"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ButtonWidget());
                }),
            new FlatButton(
                child: new Text("ImageWidget"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ImageWidget());
                }),
            new FlatButton(
                child: new Text("SwitchAndCheckBoxTestRoute"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new SwitchAndCheckBoxTestRoute());
                }),
            new FlatButton(
                child: new Text("TextFieldWidget"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new TextFieldWidget());
                }),
            new FlatButton(
                child: new Text("RowLayout"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new RowLayout());
                }),
            new FlatButton(
                child: new Text("FlexLayoutTestRoute"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new FlexLayoutTestRoute());
                }),
            new FlatButton(
                child: new Text("WrapLayout"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new WrapLayout());
                }),
            new FlatButton(
                child: new Text("StackLayout"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new StackLayout());
                }),
            new FlatButton(
                child: new Text("PaddingTestRoute"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new PaddingTestRoute());
                }),
            new FlatButton(
                child: new Text("ConstrainedBoxAndSizedBox"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ConstrainedBoxAndSizedBox());
                }),
            new FlatButton(
                child: new Text("TransformWidget"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new TransformWidget());
                }),
            new FlatButton(
                child: new Text("ContainerWidget"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ContainerWidget());
                }),
            new FlatButton(
                child: new Text("ScaffoldRoute"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ScaffoldRoute());
                }),
            new FlatButton(
                child: new Text("ListViewRoute"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ListViewRoute());
                }),
            new FlatButton(
                child: new Text("ListViewRoute1"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ListViewRoute1());
                }),
            new FlatButton(
                child: new Text("url_launcher的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new UrlLauncher());
                }),
            new FlatButton(
                child: new Text("path_provider的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new PathProvider());
                }),
            new FlatButton(
                child: new Text("image_picker的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ImagePickerPage());
                }),
            new FlatButton(
                child: new Text("multi_image_picker的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new MultiImagePickerPage());
                }),
            new FlatButton(
                child: new Text("cached_network_image的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new CachedNetworkImagePage());
                }),
            new FlatButton(
                child: new Text("package_info的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new PackageInfoPage());
                }),
            new FlatButton(
                child: new Text("device_info的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new DeviceInfoPage());
                }),
            new FlatButton(
                child: new Text("photo_view的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new PhotoViewPage());
                }),
            new FlatButton(
                child: new Text("GalleryExample"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new GalleryExample());
                }),
            new FlatButton(
                child: new Text("barcode_scan的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new BarcodeScanPage());
                }),
            new FlatButton(
                child: new Text("qr_flutter的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new QrFlutterPage());
                }),
            new FlatButton(
                child: new Text("图片裁剪"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ImageCropperPage());
                }),
            new FlatButton(
                child: new Text("进度条"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new PercentIndicatorPage());
                }),
            new FlatButton(
                child: new Text("shared_preferences"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new SharedPreferencesPage());
                }),
            new FlatButton(
                child: new Text("相机的使用"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new CameraPage());
                }),
            new FlatButton(
                child: new Text("加载SVG图片"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new FlutterSvgPage());
                }),
            new FlatButton(
                child: new Text("flutter_spinkit"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new FlutterSpinKitPage());
                }),
            new FlatButton(
                child: new Text("azlistview"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new AzListViewPage());
                }),
            new FlatButton(
                child: new Text("fancy_bottom_navigation"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new FancyBottomNavigationPage());
                }),
            new FlatButton(
                child: new Text("Sensors"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new SensorsPage());
                }),
            new FlatButton(
                child: new Text("网络连接"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ConnectivityPage());
                }),
            new FlatButton(
                child: new Text("视频播放"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new VideoPlayerPage());
                }),
            new FlatButton(
                child: new Text("通知栏通知"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new LocalNotificationsPage());
                }),
            new FlatButton(
                child: new Text("Dialogs"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new DialogDemoPage());
                }),
            new FlatButton(
                child: new Text("BottomSheet"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new BottomSheetPage());
                }),
            new FlatButton(
                child: new Text("Chip"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ChipPage());
                }),
            new FlatButton(
                child: new Text("PageView with indicator"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new PageSelectorPage());
                }),
            new FlatButton(
                child: new Text("Radio"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new RadioPage());
                }),
            new FlatButton(
                child: new Text("ToggleButtons"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new ToggleButtonsPage());
                }),
            new FlatButton(
                child: new Text("Flutter Html"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new FlutterHtmlPage());
                }),
            new FlatButton(
                child: new Text("EventBus"),
                color: Colors.grey[200],
                textColor: Colors.black54,
                onPressed: () {
                  _onNavigator(context, new EventBusPage());
                }),
          ],
        ));
  }
}

void _onNavigator(BuildContext context, var route) {
//  Application.router.navigateTo(context, '/category$routeName');

  Navigator.push(context, new MaterialPageRoute(builder: (context) {
    return route;
  }));
}
