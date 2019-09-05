import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/9/5 14:20
///
class RadioPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _RadioPageState();
  }
}

class _RadioPageState extends State<RadioPage> {
  int radioValue = 0;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Radio"),
      ),
      body: Container(
        color: Colors.grey[100],
        height: 100.0,
        child: Align(
//          alignment: FractionalOffset(0.2, 0.6),
//          alignment: const Alignment(0.2, 0.6),
//          alignment: Alignment.topRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Radio<int>(
                    value: 0,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged,
                  ),
                  Radio<int>(
                    value: 1,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged,
                  ),
                  Radio<int>(
                    value: 2,
                    groupValue: radioValue,
                    onChanged: handleRadioValueChanged,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
