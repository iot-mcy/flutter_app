import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

/// 作者 mcy
/// 时间 2019/8/15 14:30
/// 图片裁剪
class ImageCropperPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _ImageCropperPageState();
  }
}

class _ImageCropperPageState extends State<ImageCropperPage> {
  File file;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("image_cropper"),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: () async {
              var image =
                  await ImagePicker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                _cropImage(image);
              }
            },
            child: Text("选图裁剪"),
          ),
          file == null ? Text("请选图...") : Image.file(file),
        ],
      ),
    );
  }

  Future<Null> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );

    setState(() {
      file = croppedFile;
    });
  }
}
