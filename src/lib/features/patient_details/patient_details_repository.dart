import 'package:logger/logger.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/services/database_service.dart';

class PatientDetailsRepository {
  final _databaseService = locator<DatabaseService>();
  final _logger = Logger();

  Future<Patient> getPatientDetails(String patientId) async {
    try {
      return await _databaseService.getPatient(patientId);
    } catch (e) {
      _logger.e('Failed to get patient details: $e');
      rethrow;
    }
  }

  Future<List<Consultation>> getPatientConsultations(String patientId) async {
    try {
      return await _databaseService.getConsultations(patientId);
    } catch (e) {
      _logger.e('Failed to get patient consultations: $e');
      rethrow;
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await _databaseService.updatePatient(patient);
    } catch (e) {
      _logger.e('Failed to update patient: $e');
      rethrow;
    }
  }

  Future<void> deletePatient(String patientId) async {
    try {
      await _databaseService.deletePatient(patientId);
    } catch (e) {
      _logger.e('Failed to delete patient: $e');
      rethrow;
    }
  }
}
