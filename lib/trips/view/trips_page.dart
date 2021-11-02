import 'package:flutter/material.dart';
import 'dart:html';
import 'dart:ui' as ui;
import 'package:google_maps/google_maps.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //A unique id to name the div element
    String htmlId = "6";
    //creates a webview in dart
    //ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      //class to create a div element

      final mapOptions = MapOptions()
        ..zoom = 3
        ..tilt = 90
        ..center = LatLng(23.4138934, -18.9102027);
      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = "none";

      final map = GMap(elem, mapOptions);
      Marker(MarkerOptions()
        ..position = LatLng(47.6023005, 9.3918373)
        ..map = map
        ..title = 'Bodensee');
      Marker(MarkerOptions()
        ..position = LatLng(-18.505133, -54.7413905)
        ..map = map
        ..title = 'Coxim');
      return elem;
    });
    //creates a platform view for Flutter Web
    return HtmlElementView(
      viewType: htmlId,
    );
  }
}
