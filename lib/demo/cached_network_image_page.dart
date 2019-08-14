import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/14 11:41
/// 图片加载缓存示例
class CachedNetworkImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("cached_network_image"),
      ),
      body: Column(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: "http://via.placeholder.com/350x150",
            placeholder: (context, url) => new CircularProgressIndicator(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
            width: 70.0,
            height: 30.0,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
          Image(
              image: new CachedNetworkImageProvider(
                  "http://via.placeholder.com/350x150")),
        ],
      ),
    );
  }
}
