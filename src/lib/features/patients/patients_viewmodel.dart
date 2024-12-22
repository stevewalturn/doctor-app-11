import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/services/patient_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientsViewModel extends BaseViewModel {
  final _patientService = locator<PatientService>();
  final _navigationService = locator<NavigationService>();

  List<Patient> _patients = [];
  List<Patient> get patients => _patients;

  Future<void> initialise() async {
    await runBusyFuture(loadPatients());
  }

  Future<void> loadPatients() async {
    try {
      await _patientService.getPatients();
      _patients = _patientService.patients;
    } catch (e) {
      setError(
          'Unable to load patients. Please check your connection and try again.');
    }
  }

  Future<void> refreshPatients() async {
    await loadPatients();
    notifyListeners();
  }

  void navigateToAddPatient() {
    // TODO: Implement add patient navigation
  }

  void navigateToPatientDetails(String patientId) {
    _navigationService.navigateTo(
      Routes.patientDetailsView,
      arguments: PatientDetailsViewArguments(patientId: patientId),
    );
  }
}
