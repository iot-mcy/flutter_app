import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 作者 mcy
/// 时间 2019/8/15 16:44
/// 数据缓存（注意：实际使用要做单例处理）
class SharedPreferencesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _SharedPreferencesPageState();
  }
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  String content = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("shared_preferences"),
      ),
      body: Column(
        children: <Widget>[
          OutlineButton(
            onPressed: () async {
              SharedPreferences _share = await SharedPreferences.getInstance();
              int count = (_share.getInt("count") ?? 0) + 1;
              await _share.setInt("count", count);

              setState(() {
                int i = _share.getInt("count");
                content = 'count：$i';
              });
            },
            child: Text("测试"),
          ),
          Text(content),
          OutlineButton(
            onPressed: () {
              const MethodChannel('plugins.flutter.io/shared_preferences')
                  .setMockMethodCallHandler((MethodCall methodCall) async {
                if (methodCall.method == 'getAll') {
                  return <String,
                      dynamic>{}; // set initial values here if desired
                }
                return null;
              });
            },
            child: Text("检测"),
          ),
        ],
      ),
    );
  }
}
