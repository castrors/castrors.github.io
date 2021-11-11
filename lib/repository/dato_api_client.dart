import 'dart:convert';
import 'dart:io';

import 'package:blog/links/models/models.dart';
import 'package:blog/posts/models/models.dart';
import 'package:blog/trips/models/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DatoApiClient {
  DatoApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'https://graphql.datocms.com/';

  final http.Client _httpClient;

  Future<List<Link>> fetchLinks() async {
    try {
      final response = await _fetch('''
    { 
      "query": "query {
        allLinks {
          title
          url
          createdat
          color {
          hex
          }
        }
      }" 
    }
    ''');
      final content = json.decode(response.body)['data']['allLinks'] as List;
      return content
          .map((dynamic item) => Link.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      return [];
    }
  }

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await _fetch('''
    { 
      "query": "query {
        allPosts {
          title
          body
          createdAt
        }
      }" 
    }
    ''');
      final content = json.decode(response.body)['data']['allPosts'] as List;
      return content
          .map((dynamic item) => Post.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      return [];
    }
  }

  Future<List<Trip>> fetchTrips() async {
    try {
      final response = await _fetch('''
    { 
      "query": "query {
        allTrips{
          title
          description
          location{
            latitude
            longitude
          }
          photos
        }
      }" 
    }
    ''');
      final content = json.decode(response.body)['data']['allTrips'] as List;
      return content
          .map((dynamic item) => Trip.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      return [];
    }
  }

  Future<http.Response> _fetch(String body) {
    return _httpClient.post(
      Uri.parse(_baseUrl),
      headers: {
        HttpHeaders.authorizationHeader: dotenv.env['DATO_API_KEY']!,
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: body,
    );
  }
}
