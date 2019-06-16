import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key key}) : super(key: key);
  static const String routeName = "/TextField";

  @override
  _TextFieldWidgetState createState() {
    return new _TextFieldWidgetState();
  }
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _userController = new TextEditingController();
    TextEditingController _passController = new TextEditingController();
    GlobalKey _formKey = new GlobalKey<FormState>();

    FocusNode focusNode1 = new FocusNode();
    FocusNode focusNode2 = new FocusNode();

    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text("简单的登录界面"),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      focusNode: focusNode1,
                      autofocus: false,
                      maxLines: 1,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "用户名",
                          hintText: "手机号或邮箱",
                          prefixIcon: Icon(Icons.person)),
                      controller: _userController,
                      validator: (v) {
                        return v.trim().length > 0 ? null : "用户名不能为空";
                      },
                      onFieldSubmitted: (str) {
                        focusNode1.unfocus();
                        FocusScope.of(context).requestFocus(focusNode2);
                      },
                    ),
                    TextFormField(
                      focusNode: focusNode2,
                      maxLines: 1,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          labelText: "密码",
                          hintText: "您的登录密码",
                          prefixIcon: Icon(Icons.lock)),
                      obscureText: true,
                      controller: _passController,
                      validator: (v) {
                        return v.trim().length > 5 ? null : "密码不能少于6位";
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 32.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
                                focusNode2.unfocus();
//                              FocusScope.of(context).requestFocus(focusNode2);
                                if ((_formKey.currentState as FormState)
                                    .validate()) {
                                  print("用户名：" +
                                      _userController.text +
                                      "\n密码：" +
                                      _passController.text);
                                }
                              },
                              child: new Text("登录"),
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              color: Colors.red,
                              highlightColor: Colors.red[700],
                              colorBrightness: Brightness.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () {
//                              FocusScope.of(context).requestFocus(focusNode2);
                              },
                              child: new Text("注册"),
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              color: Colors.blue,
                              highlightColor: Colors.blue[700],
                              colorBrightness: Brightness.dark,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
