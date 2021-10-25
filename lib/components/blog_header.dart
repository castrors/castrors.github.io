import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components.dart';

class BlogHeader extends StatelessWidget {
  const BlogHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ClipOval(
              child: Image.network(
            "https://avatars.githubusercontent.com/u/1944720?s=200&v=4",
            height: 200,
            width: 200,
          )),
          const BlogTitle(text: "Rodrigo Castro"),
          const BlogSubtitle(text: "Mobile Developer", color: Colors.black),
          const BlogDescription(
              text:
                  "Brasileiro morando na Alemanha. Escrevo sobre desenvolvimento de aplicações móveis, viagens e vida na Alemanha."),
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
                icon: const FaIcon(FontAwesomeIcons.github),
                onPressed: () => _launchURL('https://github.com/castrors'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _launchURL(url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
