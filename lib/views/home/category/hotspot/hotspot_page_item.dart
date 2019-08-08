import 'package:flutter/material.dart';
import 'package:flutter_app/utils/Util.dart';

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
      },
      child: Container(
        height: 88.0,
        child: Row(
          children: <Widget>[
            Image.network(
              'https:${data.middle_image}',
              width: 108.0,
              height: double.infinity,
            ),
            Column(
              children: <Widget>[
                Text(
                  data.title,
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  maxLines: 2,
                ),
                Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Image.network(
                      data.media_avatar_url,
                      width: 32.0,
                      height: 32.0,
                    ),
                    Text(
                        '${data.source}·${data.comments_count}评论·${Util.getTimeDuration2(data.behot_time)}')
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
