import 'package:blog/trips/models/models.dart';
import 'package:blog/trips/view/view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripsPopulated extends StatelessWidget {
  const TripsPopulated({Key? key, required this.trips}) : super(key: key);

  final List<Trip> trips;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: LatLng(23.4138934, -18.9102027),
        zoom: 3,
      ),
      markers: trips
          .map(
            (trip) => Marker(
              markerId: MarkerId(trip.title),
              position: trip.location,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => TripDetailPage(
                      trip: trip,
                    ),
                  ),
                );
              },
            ),
          )
          .toSet(),
    );
  }
}
