/// 作者 mcy
/// 时间 2019/8/8 17:04
/// 新闻列表item数据
class HotspotPageItemData {
  String title;
  String middle_image = "";
  String media_avatar_url;
  String source;
  int comments_count;
  int behot_time;
  String item_id;

  HotspotPageItemData(
      {this.title,
      this.middle_image,
      this.media_avatar_url,
      this.source,
      this.comments_count,
      this.behot_time,
      this.item_id});

  factory HotspotPageItemData.fromJson(var entity) {
    return HotspotPageItemData(
      title: entity['title'],
      middle_image: entity['middle_image'],
      source: entity['source'],
      media_avatar_url: entity['media_avatar_url'],
      comments_count: entity['comments_count'],
      behot_time: entity['behot_time'],
      item_id: entity['item_id']
    );
  }
}
