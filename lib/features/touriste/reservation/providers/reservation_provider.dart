import 'package:flutter/material.dart';
import 'package:tourisme_flutter/core/api/reservation_api.dart';
import 'package:tourisme_flutter/features/touriste/paiement/models/reservation_request.dart';



enum RequestStatus { idle, loading, success, error }

class ReservationProvider extends ChangeNotifier {
  final ReservationApi api = ReservationApi();

  RequestStatus status = RequestStatus.idle;
  String? error;
  Map<String, dynamic>? reservation;

  Future<void> creerReservation(ReservationRequest request) async {
    status = RequestStatus.loading;
    notifyListeners();

    try {
      reservation = await api.creerReservation(request);
      status = RequestStatus.success;
    } catch (e) {
      error = e.toString();
      status = RequestStatus.error;
    }

    notifyListeners();
  }
}


/*class ReservationProvider extends ChangeNotifier {
  final ReservationService _service = ReservationService();

  RequestStatus status = RequestStatus.idle;
  String? message;
  Map<String, dynamic>? reservation;

  // 🔹 Créer réservation (backend réel)
  Future<void> creerReservation({
    required int idTouriste,
    required int idService,
    required int nbPlaces,
    required String dateReservation,
  }) async {
    status = RequestStatus.loading;
    notifyListeners();

    try {
      final data = await _service.creerReservation(
        idTouriste: idTouriste,
        idService: idService,
        nbPlaces: nbPlaces,
        dateReservation: dateReservation,
      );

      reservation = data;
      message = "Réservation créée (statut: ${data['statut']})";
      status = RequestStatus.success;
    } catch (e) {
      message = e.toString();
      status = RequestStatus.error;
    }

    notifyListeners();
  }

  // 🔹 Récupérer réservation + statut
  Future<void> chargerReservation(int id) async {
    status = RequestStatus.loading;
    notifyListeners();

    try {
      final data = await _service.getReservationById(id);
      reservation = data;
      message = "Statut réservation: ${data['statut']}";
      status = RequestStatus.success;
    } catch (e) {
      message = e.toString();
      status = RequestStatus.error;
    }

    notifyListeners();
  }

  void reset() {
    status = RequestStatus.idle;
    reservation = null;
    message = null;
    notifyListeners();
  }
}*/
