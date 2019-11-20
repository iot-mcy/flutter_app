import 'package:flutter/material.dart';
import 'package:flutter_app/routers/application.dart';
import 'package:flutter_app/routers/routes.dart';

import 'attention_page_item_data.dart';

/// 作者 mcy
/// 时间 2019/8/7 14:00
/// 关注的列表Item布局
class AttentionPageItem extends StatelessWidget {
  final AttentionPageItemData data;

  const AttentionPageItem(this.data);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: SizedBox(
          height: 72.0,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 16.0,
                        ),
                        Text(
                          data.author,
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black87),
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
                        Text(
                          data.createdTime,
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        )
                      ],
                    ))
              ]),
        ),
      ),
      onTap: () {
        onItemClick(context, data);
      },
    );
  }

  void onItemClick(BuildContext context, AttentionPageItemData data) {
//    // todo 做跳转动作
//    Fluttertoast.showToast(msg: data.title);
    Application.router.navigateTo(context,
        '${Routes.webViewPage}?title=${Uri.encodeComponent(data.title)}&url=${Uri.encodeComponent(data.detailUrl)}');
  }
}
