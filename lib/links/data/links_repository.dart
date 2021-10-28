import 'package:blog/links/data/dato_api_client.dart';
import 'package:blog/links/models/models.dart';

class LinksRepository {
  LinksRepository({DatoApiClient? apiClient})
      : _apiClient = apiClient ?? DatoApiClient();

  final DatoApiClient _apiClient;

  Future<List<Link>> getLinks() async {
    return _apiClient.fetchLinks();
  }
}
