import 'package:blog/posts/posts.dart';
import 'package:blog/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          PostsCubit(PostsRepository(apiClient: DatoApiClient()))..fetchPosts(),
      child: const PostsView(),
    );
  }
}

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case PostsStatus.initial:
            return const Text('initial');
          case PostsStatus.loading:
            return const CircularProgressIndicator();
          case PostsStatus.success:
            return PostsPopulated(posts: state.posts);
          case PostsStatus.failure:
          default:
            return const Text('error');
        }
      },
    );
  }
}
