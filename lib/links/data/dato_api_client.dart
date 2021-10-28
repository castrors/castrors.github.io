import 'dart:convert';
import 'dart:io';

import 'package:blog/links/models/models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class DatoApiClient {
  Future<List<Link>> fetchLinks() async {
    final response = await http.post(
      Uri.parse("https://graphql.datocms.com/"),
      headers: {
        HttpHeaders.authorizationHeader: dotenv.env['DATO_API_KEY']!,
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.contentTypeHeader: 'application/json'
      },
      body: '''
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
    ''',
    );

    print(response);

    try {
      final content = json.decode(response.body)['data']['allLinks'] as List;
      return content
          .map((dynamic item) => Link.fromJson(item as Map<String, dynamic>))
          .toList();
    } on Exception {
      return [];
    }
  }
}
