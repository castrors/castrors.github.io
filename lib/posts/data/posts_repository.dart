import 'package:blog/posts/models/models.dart';
import 'package:blog/repository/repository.dart';

class PostsRepository {
  PostsRepository({DatoApiClient? apiClient})
      : _apiClient = apiClient ?? DatoApiClient();

  final DatoApiClient _apiClient;

  Future<List<Post>> getPosts() async {
    return _apiClient.fetchPosts();
  }
}
