import 'package:blog/links/links.dart';
import 'package:blog/links/widgets/widgets.dart';
import 'package:blog/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LinksPage extends StatelessWidget {
  const LinksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          LinksCubit(LinksRepository(apiClient: DatoApiClient()))..fetchLinks(),
      child: const LinksView(),
    );
  }
}

class LinksView extends StatelessWidget {
  const LinksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LinksCubit, LinksState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case LinksStatus.initial:
            return const Text('initial');
          case LinksStatus.loading:
            return const CircularProgressIndicator();
          case LinksStatus.success:
            return LinksPopulated(links: state.links);
          case LinksStatus.failure:
          default:
            return const Text('error');
        }
      },
    );
  }
}
