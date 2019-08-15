import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

/// 作者 mcy
/// 时间 2019/8/15 14:10
/// 二维码生成
class QrFlutterPage extends StatelessWidget {
  String content = "hello";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("qr_flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(content),
            QrImage(
              data: "1234567890",
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
