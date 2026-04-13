import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tourisme_flutter/core/api/api_client.dart';
import 'package:tourisme_flutter/core/api/endpoints.dart';


class ReservationService {
  final Dio _dio = ApiClient.dio;

  Future<Map<String, dynamic>> creerReservation({
    required int idTouriste,
    required int idService,
    required int nbPlaces,
    required String dateReservation,
  }) async {
    final response = await _dio.post(
      Endpoints.creerReservation,
      data: {
        "idTouriste": idTouriste,
        "idServiceTouristique": idService,
        "nbPlaces": nbPlaces,
        "dateReservation": dateReservation,
      },
    );

    return response.data;
  }

  /*Future<Map<String, dynamic>> getReservationById(int id) async {
    final response = await _dio.get(
      Endpoints.reservationById(id),
    );
    return response.data;
  }*/
  Future<Map<String, dynamic>> getReservationById(int id) async {
  debugPrint("➡️ GET /api/reservations/$id");

  final response = await _dio.get(
    Endpoints.reservationById(id),
  );

  return response.data;
}

}














/*class ReservationService {
  Future<Map<String, dynamic>> creerReservation({
    required int serviceId,
    required int nbPlaces,
  }) async {
    // POST /reservations
    // backend gère la sur-réservation
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> getStatutReservation(int reservationId) async {
    // GET /reservations/{id}/statut
    throw UnimplementedError();
  }
}*/
