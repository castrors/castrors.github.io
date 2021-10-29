import 'package:blog/posts/posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(this._postsRepository) : super(PostsState());
  final PostsRepository _postsRepository;

  Future<void> fetchPosts() async {
    emit(state.copyWith(status: PostsStatus.loading));

    try {
      final posts = await _postsRepository.getPosts();
      emit(state.copyWith(status: PostsStatus.success, posts: posts));
    } on Exception {
      emit(state.copyWith(status: PostsStatus.failure));
    }
  }
}
