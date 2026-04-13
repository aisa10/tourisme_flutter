import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourisme_flutter/features/touriste/paiement/providers/paiement_provider.dart';

import '../../../../core/utils/request_status.dart';

class PaiementTestPage extends StatelessWidget {
  const PaiementTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PaiementProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Test Paiement")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton(
              onPressed: provider.status == RequestStatus.loading
                  ? null
                  : () {
                      provider.creerPaiement(
                        reservationId: 1,
                        montant: 15000,
                        modePaiement: "WAVE",
                      );
                    },
              child: const Text("Créer paiement"),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: provider.status == RequestStatus.loading
                  ? null
                  : () {
                      provider.effectuerPaiement(1);
                    },
              child: const Text("Effectuer paiement"),
            ),

            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: provider.status == RequestStatus.loading
                  ? null
                  : () {
                      provider.chargerPaiement(1);
                    },
              child: const Text("Charger paiement + statut"),
            ),

            const SizedBox(height: 24),

            if (provider.status == RequestStatus.loading)
              const Center(child: CircularProgressIndicator()),

            if (provider.message != null)
              Text(
                provider.message!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

            if (provider.paiement != null)
              Text(
                "Données : ${provider.paiement}",
                style: const TextStyle(fontSize: 12),
              ),
          ],
        ),
      ),
    );
  }
}
