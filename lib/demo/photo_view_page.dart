import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

/// 作者 mcy
/// 时间 2019/8/14 15:47
/// 图片预览
class PhotoViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("photo_view"),
      ),
      body: Center(
        child:
            PhotoView(imageProvider: AssetImage("assets/images/image01.png")),
      ),
    );
  }
}
