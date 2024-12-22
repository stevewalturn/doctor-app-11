import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/services/database_service.dart';
import 'package:logger/logger.dart';

class ConsultationRepository {
  final _databaseService = locator<DatabaseService>();
  final _logger = Logger();

  Future<List<Consultation>> getConsultations(String patientId) async {
    try {
      return await _databaseService.getConsultations(patientId);
    } catch (e) {
      _logger.e('Failed to get consultations in repository: $e');
      rethrow;
    }
  }

  Future<void> addConsultation(Consultation consultation) async {
    try {
      await _databaseService.addConsultation(consultation);
    } catch (e) {
      _logger.e('Failed to add consultation in repository: $e');
      rethrow;
    }
  }
}
