import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Util.dart';
import 'package:flutter_app/views/web_page/web_view_page.dart';
import 'package:quiver/strings.dart';

import 'hotspot_page_item_data.dart';

/// 作者 mcy
/// 时间 2019/8/8 16:45
/// 新闻热点列表的item
class HotspotPageItem extends StatelessWidget {
  HotspotPageItemData data;

  HotspotPageItem(this.data);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(data.title);
        //构建路由，可以传自定义参数
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new WebViewPage(
              'https://www.toutiao.com/a${Uri.encodeComponent(data.item_id)}',
              data.title);
        }));
      },
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
          child: SizedBox(
              height: 88.0,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.network(
                        isNotEmpty(data.middle_image) ? data.middle_image : "",
                        width: 108.0,
                        height: 88.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 88.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                              ),
                              Text(
                                data.title,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                                maxLines: 2,
                              ),
                              Expanded(
                                  child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      'https:${data.media_avatar_url}',
                                      width: 16.0,
                                      height: 16.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4)),
                                  Text(
                                    '${data.source}·${data.comments_count}评论·${Util.getTimeDuration2(data.behot_time * 1000)}',
                                    style: TextStyle(fontSize: 12.0),
                                  )
                                ],
                              )),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 0.0,
                    color: Colors.grey[400],
                  )
                ],
              ))),
    );
  }
}
