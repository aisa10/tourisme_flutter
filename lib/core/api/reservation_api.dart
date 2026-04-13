import 'package:dio/dio.dart';
import 'package:tourisme_flutter/core/api/api_client.dart';
import 'package:tourisme_flutter/features/touriste/paiement/models/reservation_request.dart';

class ReservationApi {
  final Dio dio = ApiClient.dio;

  Future<Map<String, dynamic>> creerReservation(
      ReservationRequest request) async {
    final response = await dio.post(
      '/reservations',
      data: request.toJson(),
    );
    return response.data;
  }
}
