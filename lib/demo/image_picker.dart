import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// 作者 mcy
/// 时间 2019/8/13 16:00
/// ImagePicker图片选择
class ImagePickerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ImagePickerState();
  }
}

class _ImagePickerState extends State<ImagePickerPage> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ImagePicker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            OutlineButton(
              onPressed: () async {
                var image =
                    await ImagePicker.pickImage(source: ImageSource.gallery);
                setState(() {
                  file = image;
                });
              },
              child: Text("选择图片"),
            ),
            Center(
              child: file == null ? Text("请选择图片") : Image.file(file),
            ),
          ],
        ),
      ),
    );
  }
}
