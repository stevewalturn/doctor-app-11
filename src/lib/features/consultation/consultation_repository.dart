import 'package:my_app/models/consultation.dart';

class ConsultationRepository {
  final List<Consultation> _mockConsultations = [];

  Future<List<Consultation>> getConsultationsForPatient(
      String patientId) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return _mockConsultations
          .where((consultation) => consultation.patientId == patientId)
          .toList();
    } catch (e) {
      throw 'Failed to load consultation history';
    }
  }

  Future<Consultation> getConsultationById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final consultation = _mockConsultations.firstWhere(
        (consultation) => consultation.id == id,
        orElse: () => throw 'Consultation not found',
      );
      return consultation;
    } catch (e) {
      throw 'Unable to find consultation record';
    }
  }

  Future<void> addConsultation(Consultation consultation) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _mockConsultations.add(consultation);
    } catch (e) {
      throw 'Failed to save consultation record';
    }
  }

  Future<void> updateConsultation(Consultation consultation) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final index =
          _mockConsultations.indexWhere((c) => c.id == consultation.id);
      if (index != -1) {
        _mockConsultations[index] = consultation;
      } else {
        throw 'Consultation record not found';
      }
    } catch (e) {
      throw 'Failed to update consultation record';
    }
  }

  Future<void> deleteConsultation(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _mockConsultations.removeWhere((consultation) => consultation.id == id);
    } catch (e) {
      throw 'Failed to delete consultation record';
    }
  }
}
