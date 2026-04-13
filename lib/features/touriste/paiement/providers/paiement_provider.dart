import 'package:flutter/material.dart';
import 'package:tourisme_flutter/core/utils/request_status.dart';
import 'package:tourisme_flutter/features/touriste/reservation/services/paiement_service.dart';


class PaiementProvider extends ChangeNotifier {
  final PaiementService _service = PaiementService();

  RequestStatus status = RequestStatus.idle;
  String? message;
  Map<String, dynamic>? paiement;

  // 🔹 Créer paiement
  Future<void> creerPaiement({
    required int reservationId,
    required double montant,
    required String modePaiement,
  }) async {
    status = RequestStatus.loading;
    notifyListeners();

    try {
      final data = await _service.creerPaiement(
        reservationId: reservationId,
        montant: montant,
        modePaiement: modePaiement,
      );

      paiement = data;
      message = "Paiement créé (statut: ${data['statut']})";
      status = RequestStatus.success;
    } catch (e) {
      message = e.toString();
      status = RequestStatus.error;
    }

    notifyListeners();
  }

  // 🔹 Effectuer paiement (orchestration)
  Future<void> effectuerPaiement(int paiementId) async {
    status = RequestStatus.loading;
    notifyListeners();

    try {
      await _service.effectuerPaiement(paiementId);
      message = "Paiement en cours...";
      status = RequestStatus.success;
    } catch (e) {
      message = e.toString();
      status = RequestStatus.error;
    }

    notifyListeners();
  }

  // 🔹 Charger paiement + statut
  Future<void> chargerPaiement(int id) async {
    status = RequestStatus.loading;
    notifyListeners();

    try {
      final data = await _service.getPaiementById(id);
      paiement = data;
      message = "Statut paiement: ${data['statut']}";
      status = RequestStatus.success;
    } catch (e) {
      message = e.toString();
      status = RequestStatus.error;
    }

    notifyListeners();
  }

  void reset() {
    status = RequestStatus.idle;
    paiement = null;
    message = null;
    notifyListeners();
  }
}
