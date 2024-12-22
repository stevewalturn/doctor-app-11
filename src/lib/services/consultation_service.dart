import 'package:my_app/features/consultation/consultation_repository.dart';
import 'package:my_app/models/consultation.dart';
import 'package:stacked/stacked.dart';

class ConsultationService with ListenableServiceMixin {
  final _consultationRepository = ConsultationRepository();

  List<Consultation> _consultations = [];
  List<Consultation> get consultations => _consultations;

  Future<List<Consultation>> getConsultationsForPatient(
      String patientId) async {
    try {
      _consultations =
          await _consultationRepository.getConsultationsForPatient(patientId);
      notifyListeners();
      return _consultations;
    } catch (e) {
      throw 'Unable to load consultation history. Please try again.';
    }
  }

  Future<void> addConsultation(Consultation consultation) async {
    try {
      await _consultationRepository.addConsultation(consultation);
      _consultations.add(consultation);
      notifyListeners();
    } catch (e) {
      throw 'Failed to save consultation. Please check all fields and try again.';
    }
  }

  Future<void> updateConsultation(Consultation consultation) async {
    try {
      await _consultationRepository.updateConsultation(consultation);
      final index = _consultations.indexWhere((c) => c.id == consultation.id);
      if (index != -1) {
        _consultations[index] = consultation;
        notifyListeners();
      }
    } catch (e) {
      throw 'Failed to update consultation. Please try again.';
    }
  }

  Future<void> deleteConsultation(String id) async {
    try {
      await _consultationRepository.deleteConsultation(id);
      _consultations.removeWhere((consultation) => consultation.id == id);
      notifyListeners();
    } catch (e) {
      throw 'Unable to delete consultation. Please try again later.';
    }
  }
}
