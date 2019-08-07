import 'package:flutter_app/utils/Util.dart';

/// 作者 mcy
/// 时间 2019/8/7 14:00
/// 关注页Item列表的数据
class AttentionPageItemData {
  String title;
  String subtitle;
  String author;
  String avatarLarge;
  String createdTime;
  int commentCount;
  String detailUrl;

  AttentionPageItemData(
      {this.title,
      this.subtitle,
      this.author,
      this.avatarLarge,
      this.createdTime,
      this.commentCount,
      this.detailUrl});

  factory AttentionPageItemData.fromJson(Map<String, dynamic> json) {
    return AttentionPageItemData(
      title: json['title'],
      subtitle: json["content"],
      author: json['user']['username'],
      avatarLarge: json["user"]["avatarLarge"],
      createdTime: Util.getTimeDuration(json['createdAt']),
      commentCount: json['commentsCount'],
      detailUrl: json['originalUrl'],
    );
  }
}
