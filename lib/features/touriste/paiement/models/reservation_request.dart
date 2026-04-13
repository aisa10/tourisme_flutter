class ReservationRequest {
  final int touristeId;
  final int serviceId;
  final String dateDebut;
  final int nombrePersonnes;

  ReservationRequest({
    required this.touristeId,
    required this.serviceId,
    required this.dateDebut,
    required this.nombrePersonnes,
  });

  Map<String, dynamic> toJson() => {
        "touristeId": touristeId,
        "serviceId": serviceId,
        "dateDebut": dateDebut,
        "nombrePersonnes": nombrePersonnes,
      };
}
