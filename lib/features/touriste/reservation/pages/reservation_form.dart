import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourisme_flutter/features/touriste/paiement/models/reservation_request.dart';
import 'package:tourisme_flutter/features/touriste/reservation/providers/reservation_provider.dart';

class ReservationFormPage extends StatefulWidget {
  const ReservationFormPage({super.key});

  @override
  State<ReservationFormPage> createState() => _ReservationFormPageState();
}

class _ReservationFormPageState extends State<ReservationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final touristeCtrl = TextEditingController();
  final serviceCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final nbCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ReservationProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text("Nouvelle réservation")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: touristeCtrl,
                decoration: const InputDecoration(labelText: "ID Touriste"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Requis" : null,
              ),
              TextFormField(
                controller: serviceCtrl,
                decoration: const InputDecoration(labelText: "ID Service"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Requis" : null,
              ),
              TextFormField(
                controller: dateCtrl,
                decoration: const InputDecoration(
                  labelText: "Date début (YYYY-MM-DD)",
                ),
                validator: (v) => v!.isEmpty ? "Requis" : null,
              ),
              TextFormField(
                controller: nbCtrl,
                decoration:
                    const InputDecoration(labelText: "Nombre de personnes"),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? "Requis" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: provider.status == RequestStatus.loading
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          provider.creerReservation(
                            ReservationRequest(
                              touristeId: int.parse(touristeCtrl.text),
                              serviceId: int.parse(serviceCtrl.text),
                              dateDebut: dateCtrl.text,
                              nombrePersonnes: int.parse(nbCtrl.text),
                            ),
                          );
                        }
                      },
                child: const Text("Créer réservation"),
              ),
              if (provider.status == RequestStatus.error)
                Text(provider.error ?? "Erreur",
                    style: const TextStyle(color: Colors.red)),
              if (provider.status == RequestStatus.success)
                const Text("Réservation créée ",
                    style: TextStyle(color: Colors.green)),
            ],
          ),
        ),
      ),
    );
  }
}
