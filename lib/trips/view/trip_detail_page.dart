import 'package:blog/trips/trips.dart';
import 'package:blog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TripDetailPage extends StatelessWidget {
  const TripDetailPage({Key? key, required this.trip}) : super(key: key);

  final Trip trip;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleWidget(
          text: trip.title,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: SubtitleWidget(text: trip.description),
            )),
            for (final photo in trip.photos)
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Image.network(
                      photo,
                      height: 520,
                      width: 520,
                    ),
                  ),
                  MaterialButton(
                    child: DescriptionWidget(
                      text: 'Veja mais fotos minhas no Unsplash',
                    ),
                    onPressed: () =>
                        _launchURL("https://unsplash.com/@rodrigocastro_o"),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
