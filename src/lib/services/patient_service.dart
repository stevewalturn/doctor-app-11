import 'package:my_app/features/patients/patients_repository.dart';
import 'package:my_app/models/patient.dart';
import 'package:stacked/stacked.dart';

class PatientService with ListenableServiceMixin {
  final _patientsRepository = PatientsRepository();

  List<Patient> _patients = [];
  List<Patient> get patients => _patients;

  Future<void> getPatients() async {
    try {
      _patients = await _patientsRepository.getPatients();
      notifyListeners();
    } catch (e) {
      throw 'Unable to load patients. Please check your connection and try again.';
    }
  }

  Future<Patient> getPatientById(String id) async {
    try {
      return await _patientsRepository.getPatientById(id);
    } catch (e) {
      throw 'Unable to load patient details. Please try again later.';
    }
  }

  Future<void> addPatient(Patient patient) async {
    try {
      await _patientsRepository.addPatient(patient);
      _patients.add(patient);
      notifyListeners();
    } catch (e) {
      throw 'Failed to add patient. Please check all fields and try again.';
    }
  }

  Future<void> updatePatient(Patient patient) async {
    try {
      await _patientsRepository.updatePatient(patient);
      final index = _patients.indexWhere((p) => p.id == patient.id);
      if (index != -1) {
        _patients[index] = patient;
        notifyListeners();
      }
    } catch (e) {
      throw 'Failed to update patient information. Please try again.';
    }
  }

  Future<void> deletePatient(String id) async {
    try {
      await _patientsRepository.deletePatient(id);
      _patients.removeWhere((patient) => patient.id == id);
      notifyListeners();
    } catch (e) {
      throw 'Unable to delete patient. Please try again later.';
    }
  }
}
