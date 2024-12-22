import 'package:flutter/material.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/services/consultation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConsultationViewModel extends BaseViewModel {
  final String patientId;
  final _consultationService = locator<ConsultationService>();
  final _navigationService = locator<NavigationService>();

  final symptomsController = TextEditingController();
  final diagnosisController = TextEditingController();
  final prescriptionController = TextEditingController();
  final notesController = TextEditingController();

  Consultation? _consultation;
  bool get isEditing => _consultation != null;

  ConsultationViewModel({required this.patientId});

  Future<void> initialize() async {
    // If editing existing consultation, load the data
    if (_consultation != null) {
      symptomsController.text = _consultation!.symptoms;
      diagnosisController.text = _consultation!.diagnosis;
      prescriptionController.text = _consultation!.prescription ?? '';
      notesController.text = _consultation!.notes ?? '';
    }
  }

  Future<void> saveConsultation() async {
    if (!_validateForm()) return;

    setBusy(true);
    try {
      final consultation = Consultation(
        id: _consultation?.id ?? DateTime.now().toString(),
        patientId: patientId,
        symptoms: symptomsController.text,
        diagnosis: diagnosisController.text,
        prescription: prescriptionController.text,
        notes: notesController.text,
        consultationDate: DateTime.now(),
        createdAt: _consultation?.createdAt ?? DateTime.now(),
        updatedAt: DateTime.now(),
      );

      if (isEditing) {
        await _consultationService.updateConsultation(consultation);
      } else {
        await _consultationService.addConsultation(consultation);
      }

      _navigationService.back();
    } catch (e) {
      setError('Failed to save consultation. Please try again.');
    } finally {
      setBusy(false);
    }
  }

  bool _validateForm() {
    if (symptomsController.text.isEmpty) {
      setError('Please enter patient symptoms');
      return false;
    }
    if (diagnosisController.text.isEmpty) {
      setError('Please enter diagnosis');
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    symptomsController.dispose();
    diagnosisController.dispose();
    prescriptionController.dispose();
    notesController.dispose();
    super.dispose();
  }
}
