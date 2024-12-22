import 'package:flutter/material.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/features/patients/widgets/patient_card.dart';
import 'package:my_app/widgets/loading_indicator.dart';

class PatientList extends StatelessWidget {
  final List<Patient> patients;
  final Function(String) onPatientTap;
  final bool isLoading;

  const PatientList({
    Key? key,
    required this.patients,
    required this.onPatientTap,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingIndicator(
        message: 'Loading patients...',
      );
    }

    if (patients.isEmpty) {
      return const Center(
        child: Text(
          'No patients found.\nTap + to add a new patient.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: patients.length,
      itemBuilder: (context, index) {
        final patient = patients[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: PatientCard(
            patient: patient,
            onTap: () => onPatientTap(patient.id),
          ),
        );
      },
    );
  }
}
