import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';

/// 作者 mcy
/// 时间 2019/8/15 17:27
/// 相机
class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CameraPageState();
  }
}

List<CameraDescription> cameras;

class _CameraPageState extends State<CameraPage> {
  CameraController controller;
  String imagePath = "";

  @override
  void initState() {
    initCameraController();
    super.initState();
  }

  initCameraController() async {
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Camera"),
        ),
        body: Column(
          children: <Widget>[
        controller==null ? Container() : AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller)),
            OutlineButton(
              onPressed: () {
                onTakePictureButtonPressed();
              },
              child: Text("拍照"),
            )
          ],
        ));
  }

  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        setState(() {
          imagePath = filePath;
          //todo
          Navigator.push(context, new MaterialPageRoute(builder: (context) {
            return new PicPage(File(filePath));
          }));
        });
        if (filePath != null)
          Fluttertoast.showToast(msg: 'Picture saved to $filePath');
      }
    });
  }

  String timestamp() =>
      DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      Fluttertoast.showToast(msg: "Error: select a camera first.");
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }

    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      Fluttertoast.showToast(msg: "异常");
      return null;
    }
    return filePath;
  }
}

//
class PicPage extends StatelessWidget {
  File file;

  PicPage(this.file);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("预览刚刚拍的图片"),
      ),
      body: Center(
        child: PhotoView(imageProvider: FileImage(file)),
      ),
    );
  }
}
