import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

/// 作者 mcy
/// 时间 2019/8/13 17:46
/// 多图选择
class MultiImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _MultiImagePickerPageState();
  }
}

class _MultiImagePickerPageState extends State<MultiImagePickerPage> {
  List<Asset> images = List<Asset>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MultiImagePicker"),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: loadAssets,
            child: Text("选择图片"),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(images.length, (index) {
                Asset a = images[index];
                return AssetThumb(asset: a, width: 300, height: 300);
              }),
            ),
          )
        ],
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "图片",
          allViewTitle: "选择图片",
          actionBarColor: "#C91B3A",
          actionBarTitleColor: "#ffffff",
          lightStatusBar: false,
          statusBarColor: '#C91B3A',
          startInAllView: true,
          selectCircleStrokeColor: "#000000",
          selectionLimitReachedText: "你不能再选择了。",
          textOnNothingSelected: "你还没有选图片。"
        ),
        cupertinoOptions: CupertinoOptions(
          selectionFillColor: "#ff11ab",
          selectionTextColor: "#ff00a5",
          selectionCharacter: "✓",
        ),
      );
    } on Exception catch (e) {
      error = "";
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }
}
