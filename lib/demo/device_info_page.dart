import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';

/// 作者 mcy
/// 时间 2019/8/14 14:43
/// 用于获取手机设备的信息
class DeviceInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DeviceInfoPageState();
  }
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  String data = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("device_info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OutlineButton(
              onPressed: () async {
                DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                if (Platform.isAndroid) {
                  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                  setState(() {
                    data = androidInfo.model;
                  });
                } else if (Platform.isIOS) {
                  IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                  setState(() {
                    data = iosInfo.model;
                  });
                }
              },
              child: Text("获取手机设备的信息"),
            ),
            Text(data),
          ],
        ),
      ),
    );
  }
}
