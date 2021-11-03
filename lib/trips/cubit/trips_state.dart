part of 'trips_cubit.dart';

enum TripsStatus { initial, loading, success, failure }

extension TripsStatusX on TripsStatus {
  bool get isInitial => this == TripsStatus.initial;
  bool get isLoading => this == TripsStatus.loading;
  bool get isSuccess => this == TripsStatus.success;
  bool get isFailure => this == TripsStatus.failure;
}

class TripsState extends Equatable {
  TripsState({
    this.status = TripsStatus.initial,
    List<Trip>? trips,
  }) : trips = trips ?? [];

  final TripsStatus status;
  final List<Trip> trips;

  TripsState copyWith({TripsStatus? status, List<Trip>? trips}) {
    return TripsState(
      status: status ?? this.status,
      trips: trips ?? this.trips,
    );
  }

  @override
  List<Object> get props => [status, trips];
}
