class Endpoints {

  // 🔵 Réservation
  static const String creerReservation = "/reservations/create";
   static String reservationById(int id) {
    return "/reservations/$id";
  }

  // 🟢 Paiement
  static const String creerPaiement = '/paiements/creer';
  static String effectuerPaiement(int id) => '/paiements/$id/effectuer';
  static String paiementById(int id) => '/paiements/$id';
}
