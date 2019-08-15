import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

/// 作者 mcy
/// 时间 2019/8/15 15:53
/// 进度条
class PercentIndicatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("percent_indicator"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 13.0,
                animation: true,
                percent: 0.85,
                center: new Text(
                  "85%",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  "圆形进度条",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.redAccent,
                backgroundColor: Colors.grey[300],
              ),
              LinearPercentIndicator(
                width: 200.0,
                lineHeight: 16.0,
                percent: 0.8,
                progressColor: Colors.blue,
                backgroundColor: Colors.grey[300],
                padding: EdgeInsets.symmetric(vertical: 56.0),
                animation: true,
                alignment: MainAxisAlignment.center,
                linearStrokeCap: LinearStrokeCap.roundAll,
              ),
            ],
          ),
        ));
  }
}
