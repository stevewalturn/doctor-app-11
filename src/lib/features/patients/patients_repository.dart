import 'package:my_app/app/app.locator.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/services/database_service.dart';
import 'package:logger/logger.dart';

class PatientsRepository {
  final _databaseService = locator<DatabaseService>();
  final _logger = Logger();

  Future<List<Patient>> getPatients() async {
    try {
      return await _databaseService.getPatients();
    } catch (e) {
      _logger.e('Failed to get patients in repository: $e');
      rethrow;
    }
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await _databaseService.addPatient(patient);
    } catch (e) {
      _logger.e('Failed to add patient in repository: $e');
      rethrow;
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await _databaseService.updatePatient(patient);
    } catch (e) {
      _logger.e('Failed to update patient in repository: $e');
      rethrow;
    }
  }

  Future<void> deletePatient(String patientId) async {
    try {
      await _databaseService.deletePatient(patientId);
    } catch (e) {
      _logger.e('Failed to delete patient in repository: $e');
      rethrow;
    }
  }
}
