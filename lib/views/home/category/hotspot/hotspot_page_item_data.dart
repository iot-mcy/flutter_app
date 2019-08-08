/// 作者 mcy
/// 时间 2019/8/8 17:04
/// 新闻列表item数据
class HotspotPageItemData {
  String title;
  String middle_image;
  String media_avatar_url;
  String source;
  int comments_count;
  int behot_time;

  HotspotPageItemData(
      {this.title,
      this.middle_image,
      this.media_avatar_url,
      this.source,
      this.comments_count,
      this.behot_time});

  factory HotspotPageItemData.fromJson(var data) {
    var responseList = [];
    responseList = data['data'];
    for (int index = 0; index < responseList.length; index++) {
      var entity = responseList[index];
      return HotspotPageItemData(
        title: entity['title'],
        middle_image: entity['middle_image'],
        source: entity['source'],
        media_avatar_url: entity['media_avatar_url'],
        comments_count: entity['comments_count'],
        behot_time: entity['behot_time'],
      );
    }
  }
}
