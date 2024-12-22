import 'package:logger/logger.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/features/patients/patients_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientsViewModel extends BaseViewModel {
  final _patientsRepository = locator<PatientsRepository>();
  final _navigationService = locator<NavigationService>();
  final _logger = Logger();

  List<Patient> _patients = [];
  String? _modelError;
  String _searchQuery = '';

  List<Patient> get patients => _patients;
  String? get modelError => _modelError;

  Future<void> loadPatients() async {
    try {
      _modelError = null;
      setBusy(true);
      _patients = await _patientsRepository.getPatients();
      notifyListeners();
    } catch (e) {
      _logger.e('Failed to load patients: $e');
      _modelError = 'Unable to load patients. Please try again.';
    } finally {
      setBusy(false);
    }
  }

  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners();
  }

  List<Patient> get filteredPatients {
    if (_searchQuery.isEmpty) return _patients;
    return _patients.where((patient) {
      return patient.name.toLowerCase().contains(_searchQuery) ||
          patient.contactNumber.contains(_searchQuery);
    }).toList();
  }

  Future<void> navigateToAddPatient() async {
    await _navigationService.navigateTo(Routes.addPatientView);
    await loadPatients(); // Refresh list after returning
  }

  Future<void> navigateToPatientDetails(String patientId) async {
    await _navigationService.navigateTo(
      Routes.patientDetailsView,
      arguments: patientId,
    );
  }

  @override
  void onFutureError(error, Object? key) {
    _logger.e('Error in PatientsViewModel: $error');
    _modelError = 'An unexpected error occurred. Please try again.';
    notifyListeners();
    super.onFutureError(error, key);
  }
}
