import 'dart:convert';
import 'dart:io';

import 'models/models.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DatoApiClient {
  static Future<List<dynamic>> fetchLinks() async {
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

    try {
      final content = jsonDecode(response.body)['data']['allLinks'];

      print(content);

      return content == null
          ? Future.value(<MyLink>[])
          : content.map((item) => MyLink.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
