part of 'posts_cubit.dart';

enum PostsStatus { initial, loading, success, failure }

extension PostsStatusX on PostsStatus {
  bool get isInitial => this == PostsStatus.initial;
  bool get isLoading => this == PostsStatus.loading;
  bool get isSuccess => this == PostsStatus.success;
  bool get isFailure => this == PostsStatus.failure;
}

class PostsState extends Equatable {
  PostsState({
    this.status = PostsStatus.initial,
    List<Post>? posts,
  }) : posts = posts ?? [];

  final PostsStatus status;
  final List<Post> posts;

  PostsState copyWith({PostsStatus? status, List<Post>? posts}) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
    );
  }

  @override
  List<Object> get props => [status, posts];
}
