import 'package:blog/repository/dato_api_client.dart';
import 'package:blog/trips/cubit/trips_cubit.dart';
import 'package:blog/trips/trips.dart';
import 'package:blog/trips/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          TripsCubit(TripsRepository(apiClient: DatoApiClient()))..fetchTrips(),
      child: const TripsView(),
    );
  }
}

class TripsView extends StatelessWidget {
  const TripsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsCubit, TripsState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.status) {
          case TripsStatus.initial:
            return const Text('initial');
          case TripsStatus.loading:
            return const CircularProgressIndicator();
          case TripsStatus.success:
            return TripsPopulated(trips: state.trips);
          case TripsStatus.failure:
          default:
            return const Text('error');
        }
      },
    );
  }
}
