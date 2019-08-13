import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quiver/strings.dart';

/// 作者 mcy
/// 时间 2019/8/13 14:29
/// path_provider 演示
class PathProvider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PathProviderState();
  }
}

class _PathProviderState extends State<PathProvider> {
  TextEditingController _editingController = new TextEditingController();
  String path = "";
  String content = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("path_provider使用"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              OutlineButton(
                onPressed: () async {
                  //文件读取
                  Directory tempDir = await getTemporaryDirectory();
                  String tempPath = tempDir.path;
                  print(tempPath);

                  Directory appSupDir = await getApplicationSupportDirectory();
                  String appSupPath = appSupDir.path;
                  print(appSupPath);

                  Directory appDocDir =
                      await getApplicationDocumentsDirectory();
                  String appDocPath = appDocDir.path;
                  print(appDocPath);

                  Directory externalStorageDir =
                      await getExternalStorageDirectory();
                  String externalStoragePath = externalStorageDir.path;
                  print(externalStoragePath);

                  setState(() {
                    path = 'getTemporaryDirectory: $tempPath\n'
                        'getApplicationSupportDirectory: $appSupPath\n'
                        'getApplicationDocumentsDirectory: $appDocPath\n'
                        'getExternalStorageDirectory: $externalStoragePath';
                  });
                },
                child: Text("获取路径"),
              ),
              Text(path),
              TextField(
                controller: _editingController,
                decoration: InputDecoration(
                  hintText: "请输入要保存的内容",
                ),
              ),
              OutlineButton(
                onPressed: () async {
                  String str = _editingController.text;
                  if (isNotEmpty(str)) {
                    final file = await localFile();
                    file.writeAsString(str).then((File file) {
                      print(file);
                    });
                  } else {
                    Fluttertoast.showToast(msg: "请输入要保存的内容");
                  }
                },
                child: Text("写入文件"),
              ),
              OutlineButton(
                onPressed: () async {
                  File file = await localFile();
                  file.readAsString().then((String str) {
                    setState(() {
                      content = str;
                    });
                  });
                },
                child: Text("读取文件"),
              ),
              Text(content),
            ],
          ),
        ));
  }

  localFile() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    return new File('$tempPath/file.txt');
  }
}
