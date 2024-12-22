import 'package:logger/logger.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/features/patient_details/patient_details_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientDetailsViewModel extends BaseViewModel {
  final _patientDetailsRepository = locator<PatientDetailsRepository>();
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _logger = Logger();

  final String patientId;
  Patient? _patient;
  List<Consultation> _consultations = [];
  String? _modelError;

  PatientDetailsViewModel(this.patientId);

  Patient? get patient => _patient;
  List<Consultation> get consultations => _consultations;
  String? get modelError => _modelError;

  Future<void> loadPatientDetails() async {
    try {
      _modelError = null;
      setBusy(true);
      _patient = await _patientDetailsRepository.getPatientDetails(patientId);
      _consultations =
          await _patientDetailsRepository.getPatientConsultations(patientId);
      notifyListeners();
    } catch (e) {
      _logger.e('Failed to load patient details: $e');
      _modelError = 'Unable to load patient information. Please try again.';
    } finally {
      setBusy(false);
    }
  }

  Future<void> navigateToNewConsultation() async {
    if (_patient == null) return;

    final result = await _navigationService.navigateTo(
      Routes.consultationView,
      arguments: _patient,
    );

    if (result == true) {
      await loadPatientDetails(); // Refresh after new consultation
    }
  }

  Future<void> deletePatient() async {
    final response = await _dialogService.showDialog(
      title: 'Delete Patient',
      description:
          'Are you sure you want to delete this patient? This action cannot be undone.',
      buttonTitle: 'Delete',
      cancelTitle: 'Cancel',
    );

    if (response?.confirmed ?? false) {
      try {
        setBusy(true);
        await _patientDetailsRepository.deletePatient(patientId);
        await _navigationService.back();
      } catch (e) {
        _logger.e('Failed to delete patient: $e');
        _modelError = 'Unable to delete patient. Please try again.';
        notifyListeners();
      } finally {
        setBusy(false);
      }
    }
  }

  @override
  void onFutureError(error, Object? key) {
    _logger.e('Error in PatientDetailsViewModel: $error');
    _modelError = 'An unexpected error occurred. Please try again.';
    notifyListeners();
    super.onFutureError(error, key);
  }
}
