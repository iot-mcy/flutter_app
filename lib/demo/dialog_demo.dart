import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 作者 mcy
/// 时间 2019/8/27 9:12
/// 对话框的使用
class DialogDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _DialogDemoPageState();
  }
}

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class _DialogDemoPageState extends State<DialogDemoPage> {
  final GlobalKey<ScaffoldState> _ScaffoldKey = GlobalKey<ScaffoldState>();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        title: Text("dialog"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              showDialog<DialogDemoAction>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("电量过低。"),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context, DialogDemoAction.cancel);
                              _ScaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text("取消")));
                            },
                            child: Text("取消")),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context, DialogDemoAction.agree);
                              _ScaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text("确定")));
                            },
                            child: Text(
                              "确定",
                              style: TextStyle(color: Colors.blue),
                            )),
                      ],
                    );
                  });
            },
            child: Text("alert"),
          ),
          RaisedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: Text("Account"),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("张三"),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("李四"),
                        ),
                      ],
                    );
                  });
            },
            child: Text("simple"),
          ),
          RaisedButton(
            onPressed: () async {
              DateTime d = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(2018, 8),
                  lastDate: DateTime(2020),
                  initialDatePickerMode: DatePickerMode.day);
              if (d != null) {
                setState(() {
                  date = d;
                });
              }
            },
            child: Text(DateFormat.yMMMMd('zh_CH').format(date)),
          ),
          RaisedButton(
            onPressed: () async {
              TimeOfDay t =
                  await showTimePicker(context: context, initialTime: time);
              if (t != null) {
                setState(() {
                  time = t;
                });
              }
            },
            child: Text(time.format(context)),
          ),
          DropdownButton(
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              value: dropdownValue,
              isExpanded: true,
              onChanged: (String value) {
                setState(() {
                  dropdownValue = value;
                });
              }),
        ],
      ),
    );
  }
}
