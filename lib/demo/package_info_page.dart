import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

/// 作者 mcy
/// 时间 2019/8/14 14:26
/// 获取应用程序的信息
class PackageInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PackageInfoPageState();
  }
}

class _PackageInfoPageState extends State<PackageInfoPage> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("package_info"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          OutlineButton(
            onPressed: () {
              PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
                String appName = packageInfo.appName;
                String packageName = packageInfo.packageName;
                String version = packageInfo.version;
                String buildNumber = packageInfo.buildNumber;

                setState(() {
                  content = 'appName: $appName\n'
                      'packageName: $packageName\n'
                      'version: $version\n'
                      'buildNumber: $buildNumber';
                });
              });
            },
            child: Text("获取应用程序信息"),
          ),
          Text(content)
        ],
      ),
    );
  }
}
