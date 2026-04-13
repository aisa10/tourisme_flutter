import 'package:dio/dio.dart';
import 'package:tourisme_flutter/core/api/api_client.dart';
import 'package:tourisme_flutter/core/api/endpoints.dart';


class PaiementService {
  final Dio _dio = ApiClient.dio;

  Future<Map<String, dynamic>> creerPaiement({
    required int reservationId,
    required double montant,
    required String modePaiement,
  }) async {
    final response = await _dio.post(
      Endpoints.creerPaiement,
      data: {
        "reservationId": reservationId,
        "montant": montant,
        "modePaiement": modePaiement,
      },
    );

    return response.data;
  }

  Future<void> effectuerPaiement(int paiementId) async {
    await _dio.post(
      Endpoints.effectuerPaiement(paiementId),
    );
  }

  Future<Map<String, dynamic>> getPaiementById(int id) async {
    final response = await _dio.get(
      Endpoints.paiementById(id),
    );
    return response.data;
  }
}


















/*class PaiementService {
  Future<Map<String, dynamic>> effectuerPaiement({
    required int reservationId,
    required double montant,
  }) async {
    // POST /paiements
    throw UnimplementedError();
  }

  Future<Map<String, dynamic>> getStatutPaiement(int paiementId) async {
    // GET /paiements/{id}/statut
    throw UnimplementedError();
  }
}*/
