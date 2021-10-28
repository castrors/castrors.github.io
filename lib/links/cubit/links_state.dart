part of 'links_cubit.dart';

enum LinksStatus { initial, loading, success, failure }

extension LinksStatusX on LinksStatus {
  bool get isInitial => this == LinksStatus.initial;
  bool get isLoading => this == LinksStatus.loading;
  bool get isSuccess => this == LinksStatus.success;
  bool get isFailure => this == LinksStatus.failure;
}

class LinksState extends Equatable {
  LinksState({
    this.status = LinksStatus.initial,
    List<Link>? links,
  }) : links = links ?? [];

  final LinksStatus status;
  final List<Link> links;

  LinksState copyWith({LinksStatus? status, List<Link>? links}) {
    return LinksState(
      status: status ?? this.status,
      links: links ?? this.links,
    );
  }

  @override
  List<Object> get props => [status, links];
}
