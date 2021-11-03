import 'package:blog/repository/repository.dart';
import 'package:blog/trips/models/models.dart';

class TripsRepository {
  TripsRepository({DatoApiClient? apiClient})
      : _apiClient = apiClient ?? DatoApiClient();

  final DatoApiClient _apiClient;

  Future<List<Trip>> getTrips() async {
    return _apiClient.fetchTrips();
  }
}
