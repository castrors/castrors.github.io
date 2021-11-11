import 'dart:io';

import 'package:blog/repository/dato_api_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('datoApiClient', () {
    late http.Client httpClient;
    late DatoApiClient datoApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      datoApiClient = DatoApiClient(httpClient: httpClient);
      dotenv.testLoad(fileInput: File('dotenv').readAsStringSync());
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(DatoApiClient(), isNotNull);
      });
    });

    group('linksFetch', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('[]');
        when(() => httpClient.post(any())).thenAnswer((_) async => response);

        try {
          await datoApiClient.fetchLinks();
        } catch (_) {}

        verify(
          () => httpClient.post(
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
          ),
        ).called(1);
      });

      test('throws LinksNotFoundFailure', () async {});
      test('throws LinksEmptyResponse', () async {});

      test('returns list of links on valid response', () async {});
    });
  });
}
