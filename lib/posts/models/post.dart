import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  const Post({
    required this.title,
    required this.body,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  static final empty = Post(
    title: '',
    body: '',
    createdAt: DateTime.now(),
  );

  final String title;
  final String body;
  final DateTime createdAt;

  @override
  List<Object> get props => [title, body, createdAt];

  Post copyWith({
    String? title,
    String? body,
    DateTime? createdAt,
  }) {
    return Post(
      title: title ?? this.title,
      body: body ?? this.body,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
