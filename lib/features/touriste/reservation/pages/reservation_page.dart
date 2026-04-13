import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourisme_flutter/features/touriste/reservation/providers/reservation_provider.dart';

import '../../../../core/utils/request_status.dart';

/*class ReservationTestPage extends StatelessWidget {
  const ReservationTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Test Réservation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton(
              onPressed: provider.status == RequestStatus.loading
                  ? null
                  : () {
                      provider.creerReservation(
                        idTouriste: 1,
                        idService: 1,
                        nbPlaces: 3,
                        dateReservation: "2026-02-10",
                      );
                    },
              child: const Text("Créer réservation"),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: provider.status == RequestStatus.loading
              ? null
              : () {
              final res = provider.reservation;
              if (res != null && res['idReservation'] != null) {
            provider.chargerReservation(res['idReservation']);
          }
        },
  child: const Text("Charger réservation + statut"),
            ),

            const SizedBox(height: 24),

            if (provider.status == RequestStatus.loading)
              const Center(child: CircularProgressIndicator()),

            if (provider.message != null)
              Text(
                provider.message!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

            if (provider.reservation != null)
              Text(
                "Données : ${provider.reservation}",
                style: const TextStyle(fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
*/