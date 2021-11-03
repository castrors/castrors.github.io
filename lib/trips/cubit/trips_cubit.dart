import 'package:blog/trips/trips.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<TripsState> {
  TripsCubit(this._tripsRepository) : super(TripsState());

  final TripsRepository _tripsRepository;

  Future<void> fetchTrips() async {
    emit(state.copyWith(status: TripsStatus.loading));

    try {
      final trips = await _tripsRepository.getTrips();
      emit(state.copyWith(status: TripsStatus.success, trips: trips));
    } on Exception {
      emit(state.copyWith(status: TripsStatus.failure));
    }
  }
}
