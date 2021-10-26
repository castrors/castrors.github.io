import 'package:blog/extensions/color.dart';
import 'package:flutter/widgets.dart';

class MyLink {
  final String title;
  final String url;
  final Color color;
  final DateTime createdat;

  const MyLink(
      {required this.title,
      required this.url,
      required this.color,
      required this.createdat});

  factory MyLink.fromJson(Map<String, dynamic> json) {
    return MyLink(
        title: json['title'] as String,
        url: json['url'] as String,
        color: HexColor.fromHex(json['color']['hex']),
        createdat: DateTime.parse(json['createdat']));
  }
}
