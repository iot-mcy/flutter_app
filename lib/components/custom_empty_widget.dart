import 'package:flutter/material.dart';

/// 作者 mcy
/// 时间 2019/8/8 14:06
/// 自定义空数据时显示样式
class CustomEmptyWidget {
  static Widget emptyWidget() {
    return Container(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
            flex: 2,
          ),
          Icon(Icons.description,size: 88.0,color: Colors.grey[300],),
//          SizedBox(
//            width: 100.0,
//            height: 100.0,
//            child: Image.asset('assets/images/image02.png'),
//          ),
          Text(
            '暂无记录',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
          ),
          Expanded(
            child: SizedBox(),
            flex: 3,
          ),
        ],
      ),
    );
  }
}
