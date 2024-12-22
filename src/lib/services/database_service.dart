import 'package:logger/logger.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/models/patient.dart';

class DatabaseService {
  final _logger = Logger();

  // Simulated database
  final Map<String, Patient> _patients = {};
  final Map<String, List<Consultation>> _consultations = {};

  Future<List<Patient>> getPatients() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      return _patients.values.toList();
    } catch (e) {
      _logger.e('Failed to fetch patients: $e');
      throw Exception('Unable to load patients. Please try again later.');
    }
  }

  Future<Patient> getPatient(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final patient = _patients[id];
      if (patient == null) {
        throw Exception('Patient not found');
      }
      return patient;
    } catch (e) {
      _logger.e('Failed to fetch patient: $e');
      throw Exception(
          'Unable to load patient details. Please try again later.');
    }
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _patients[patient.id] = patient;
      _consultations[patient.id] = [];
      _logger.i('Added new patient: ${patient.id}');
    } catch (e) {
      _logger.e('Failed to add patient: $e');
      throw Exception('Unable to add patient. Please try again later.');
    }
  }

  Future<List<Consultation>> getConsultations(String patientId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return _consultations[patientId] ?? [];
    } catch (e) {
      _logger.e('Failed to fetch consultations: $e');
      throw Exception(
          'Unable to load consultation history. Please try again later.');
    }
  }

  Future<void> addConsultation(Consultation consultation) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final consultations = _consultations[consultation.patientId] ?? [];
      consultations.add(consultation);
      _consultations[consultation.patientId] = consultations;
      _logger.i('Added new consultation: ${consultation.id}');
    } catch (e) {
      _logger.e('Failed to add consultation: $e');
      throw Exception('Unable to save consultation. Please try again later.');
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _patients[patient.id] = patient;
      _logger.i('Updated patient: ${patient.id}');
    } catch (e) {
      _logger.e('Failed to update patient: $e');
      throw Exception(
          'Unable to update patient information. Please try again later.');
    }
  }

  Future<void> deletePatient(String patientId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _patients.remove(patientId);
      _consultations.remove(patientId);
      _logger.i('Deleted patient: $patientId');
    } catch (e) {
      _logger.e('Failed to delete patient: $e');
      throw Exception('Unable to delete patient. Please try again later.');
    }
  }
}
