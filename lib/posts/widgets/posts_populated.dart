import 'package:blog/posts/posts.dart';
import 'package:blog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PostsPopulated extends StatelessWidget {
  const PostsPopulated({Key? key, required this.posts}) : super(key: key);

  final List<Post> posts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (buildContext, index) {
        final post = posts[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: TextWidget(
              text: post.title,
              fontSize: 24,
            ),
            subtitle: MarkdownBody(
              data: post.body,
            ),
          ),
        );
      },
      itemCount: posts.length,
    );
  }
}
