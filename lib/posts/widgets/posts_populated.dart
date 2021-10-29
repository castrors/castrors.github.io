import 'package:blog/posts/posts.dart';
import 'package:blog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

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
              selectable: true,
              onTapLink: (text, href, title) =>
                  href != null ? _launchURL(href) : null,
            ),
          ),
        );
      },
      itemCount: posts.length,
    );
  }
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
