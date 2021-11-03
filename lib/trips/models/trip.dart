// ignore_for_file: avoid_dynamic_calls

import 'package:equatable/equatable.dart';
import 'package:google_maps/google_maps.dart';

class Trip extends Equatable {
  const Trip({
    required this.title,
    required this.description,
    required this.location,
    required this.photos,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        title: json['title'] as String,
        description: json['description'] as String,
        location: LatLng(
          json['location']['latitude'] as num,
          json['location']['longitude'] as num,
        ),
        photos: List<String>.from(json['photos'] as List),
      );

  static final empty = Trip(
    title: '',
    description: '',
    location: LatLng(0, 0),
    photos: const <String>[],
  );

  final String title;
  final String description;
  final LatLng location;
  final List<String> photos;

  @override
  List<Object> get props => [title, description, location, photos];

  Trip copyWith({
    String? title,
    String? url,
    LatLng? location,
    List<String>? createdAt,
  }) {
    return Trip(
      title: title ?? this.title,
      description: description,
      location: location ?? this.location,
      photos: photos,
    );
  }
}
