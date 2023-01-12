import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class NewsData {
  NewsData({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });
  final String? by;
  final int? descendants;
  final int? id;
  final List<dynamic>? kids;
  final int? score;
  final int? time;
  final String? title;
  final String? type;
  final String? url;

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
        by: json['by'],
        descendants: json['descendants'],
        id: json['id'],
        kids: List.castFrom<dynamic, dynamic>(json['kids']),
        score: json['score'],
        time: json['time'],
        title: json['title'],
        type: json['type'],
        url: json['url']);
  }
}
