import 'package:my_app/models/patient.dart';

class PatientsRepository {
  final List<Patient> _mockPatients = [];

  Future<List<Patient>> getPatients() async {
    try {
      // Simulated API delay
      await Future.delayed(const Duration(seconds: 1));
      return _mockPatients;
    } catch (e) {
      throw 'Failed to fetch patients from the server';
    }
  }

  Future<Patient> getPatientById(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final patient = _mockPatients.firstWhere(
        (patient) => patient.id == id,
        orElse: () => throw 'Patient not found',
      );
      return patient;
    } catch (e) {
      throw 'Unable to find patient with ID: $id';
    }
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _mockPatients.add(patient);
    } catch (e) {
      throw 'Failed to add new patient';
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final index = _mockPatients.indexWhere((p) => p.id == patient.id);
      if (index != -1) {
        _mockPatients[index] = patient;
      } else {
        throw 'Patient not found';
      }
    } catch (e) {
      throw 'Failed to update patient information';
    }
  }

  Future<void> deletePatient(String id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _mockPatients.removeWhere((patient) => patient.id == id);
    } catch (e) {
      throw 'Failed to delete patient';
    }
  }
}
