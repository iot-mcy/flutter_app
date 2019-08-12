import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/12 9:36
/// 其它新闻
class OtherPage extends StatelessWidget {
  String name = "";

  OtherPage(this.name);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: TextStyle(fontSize: 18.0, color: Colors.black87),
      ),
    );
  }
}
