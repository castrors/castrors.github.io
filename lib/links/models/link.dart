// ignore_for_file: avoid_dynamic_calls

import 'package:blog/extensions/color.dart';
import 'package:blog/extensions/extensions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Link extends Equatable {
  const Link({
    required this.title,
    required this.url,
    required this.color,
    required this.createdAt,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        title: json['title'] as String,
        url: json['url'] as String,
        color: HexColor.fromHex(json['color']['hex'] as String),
        createdAt: DateTime.parse(json['createdat'] as String),
      );

  static final empty = Link(
    title: '',
    url: '',
    color: Colors.white,
    createdAt: DateTime.now(),
  );

  final String title;
  final String url;
  final Color color;
  final DateTime createdAt;

  @override
  List<Object> get props => [title, url, color, createdAt];

  Link copyWith({
    String? title,
    String? url,
    Color? color,
    DateTime? createdAt,
  }) {
    return Link(
      title: title ?? this.title,
      url: url ?? this.url,
      color: color ?? this.color,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
