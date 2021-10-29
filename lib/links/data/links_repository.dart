import 'package:blog/links/models/models.dart';
import 'package:blog/repository/repository.dart';

class LinksRepository {
  LinksRepository({DatoApiClient? apiClient})
      : _apiClient = apiClient ?? DatoApiClient();

  final DatoApiClient _apiClient;

  Future<List<Link>> getLinks() async {
    return _apiClient.fetchLinks();
  }
}
