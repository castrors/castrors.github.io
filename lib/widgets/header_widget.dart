import 'package:blog/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
              child: Image.network(
            "https://avatars.githubusercontent.com/u/1944720?s=120&v=4",
            height: 120,
            width: 120,
          )),
          const TitleWidget(text: "Rodrigo Castro"),
          const SizedBox(
            height: 8,
          ),
          SubtitleWidget(text: l10n.jobTitle, color: Colors.black),
          const SizedBox(
            height: 8,
          ),
          DescriptionWidget(text: l10n.homeSubtitle),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.linkedin),
                onPressed: () =>
                    _launchURL('https://www.linkedin.com/in/castrodev/'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.twitter),
                onPressed: () =>
                    _launchURL('https://twitter.com/rodrigocastro_o'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.dev),
                onPressed: () => _launchURL('https://dev.to/rodrigocastro_o'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () => _launchURL('https://github.com/castrors'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.instagram),
                onPressed: () =>
                    _launchURL('https://instagram.com/rodrigocastro_o'),
              ),
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.unsplash),
                onPressed: () =>
                    _launchURL('https://unsplash.com/@rodrigocastro_o'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
