import 'package:blog/links/links.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'links_state.dart';

class LinksCubit extends Cubit<LinksState> {
  LinksCubit(this._linksRepository) : super(LinksState());

  final LinksRepository _linksRepository;

  Future<void> fetchLinks() async {
    emit(state.copyWith(status: LinksStatus.loading));

    try {
      final links = await _linksRepository.getLinks();
      emit(state.copyWith(status: LinksStatus.success, links: links));
    } on Exception {
      emit(state.copyWith(status: LinksStatus.failure));
    }
  }
}
