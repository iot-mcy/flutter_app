import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// 作者 mcy
/// 时间 2019/8/13 14:10
/// 第三方 url_launcher 使用
class UrlLauncher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _UrlLauncher();
  }
}

class _UrlLauncher extends State<UrlLauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("url_launcher 使用"),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
              onPressed: () async {
                const url = 'https://flutter.dev';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Text("使用外部浏览器打开")),
          OutlineButton(
              onPressed: () async {
                String url = 'tel:15607800961';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  print('不能访问');
                }
              },
              child: Text("拨打电话：15607800961")),
          OutlineButton(
              onPressed: () async {
                String url = 'sms:15607800961';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  print('不能访问');
                }
              },
              child: Text("给15607800961发短信")),
          OutlineButton(
              onPressed: () async {
                String url =
                    'mailto:714405544@qq.com?subject=News&body=New%20plugin';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  print('不能访问');
                }
              },
              child: Text("发邮件")),
        ],
      ),
    );
  }
}
