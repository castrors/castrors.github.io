import 'package:blog/links/links.dart';
import 'package:blog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksPopulated extends StatelessWidget {
  const LinksPopulated({Key? key, required this.links}) : super(key: key);

  final List<Link> links;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (buildContext, index) {
        final link = links[index];
        return Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: link.color,
            ),
            title: TextWidget(
              text: link.title,
            ),
            trailing: TextWidget(
              text: DateFormat('dd/MM/yyyy').format(link.createdAt),
            ),
            onTap: () => _launchURL(link.url),
          ),
        );
      },
      itemCount: links.length,
    );
  }
}

Future<void> _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
