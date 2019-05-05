import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({Key key}) : super(key: key);
  static const String routeName = "/TextField";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TextField"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "手机号或邮箱",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock)
            ),
            obscureText: true,
          )
        ],
      ),
    );
  }
}
