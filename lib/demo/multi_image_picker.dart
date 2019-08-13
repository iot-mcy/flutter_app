import 'package:flutter/material.dart';
//import 'package:multi_image_picker/multi_image_picker.dart';

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
//  List<Asset> images = List<Asset>();

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
//            onPressed: loadAssets,
            child: Text("选择图片"),
          ),
//          Expanded(
//            child: GridView.count(
//              crossAxisCount: 3,
//              children: List.generate(images.length, (index) {
//                Asset a = images[index];
//                return AssetThumb(asset: a, width: 300, height: 300);
//              }),
//            ),
//          )
        ],
      ),
    );
  }

//  Future<void> loadAssets() async {
//    List<Asset> resultList = List<Asset>();
//    String error = 'No Error Dectected';
//
//    try {
//      resultList = await MultiImagePicker.pickImages(
//        maxImages: 300,
//        enableCamera: true,
//        selectedAssets: images,
//        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//        materialOptions: MaterialOptions(
//          actionBarColor: "#abcdef",
//          actionBarTitle: "Example App",
//          allViewTitle: "All Photos",
//          useDetailsView: false,
//          selectCircleStrokeColor: "#000000",
//          backButtonDrawable: "ic_back_arrow",
//        ),
//      );
//
//      for (var r in resultList) {
//        var t = await r.filePath;
//        print(t);
//      }
//    } on Exception catch (e) {
//      error = e.toString();
//    }
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    setState(() {
//      images = resultList;
//    });
//  }
}
