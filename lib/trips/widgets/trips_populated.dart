// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:blog/trips/models/models.dart';
import 'package:blog/widgets/description_widget.dart';
import 'package:blog/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

class TripsPopulated extends StatelessWidget {
  const TripsPopulated({Key? key, required this.trips}) : super(key: key);

  final List<Trip> trips;

  @override
  Widget build(BuildContext context) {
    const htmlId = '6';
    //ignore: undefined_prefixed_name, avoid_dynamic_calls
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = MapOptions()
        ..zoom = 3
        ..tilt = 90
        ..center = LatLng(23.4138934, -18.9102027);
      final elem = DivElement()
        ..id = htmlId
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);
      for (final trip in trips) {
        Marker(
          MarkerOptions()
            ..position = trip.location
            ..map = map
            ..title = trip.title,
        ).onClick.listen((event) {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TitleWidget(text: trip.title),
                    DescriptionWidget(text: trip.description),
                    for (final photo in trip.photos)
                      Image.network(
                        photo as String,
                        height: 240,
                        width: 240,
                      ),
                    ElevatedButton(
                      child: const Text('Close BottomSheet'),
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              );
            },
          );
        });
      }

      return elem;
    });
    return const HtmlElementView(
      viewType: htmlId,
    );
  }
}
