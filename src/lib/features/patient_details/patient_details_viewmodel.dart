import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/services/consultation_service.dart';
import 'package:my_app/services/patient_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PatientDetailsViewModel extends BaseViewModel {
  final String patientId;
  final _patientService = locator<PatientService>();
  final _consultationService = locator<ConsultationService>();
  final _navigationService = locator<NavigationService>();

  Patient? _patient;
  Patient? get patient => _patient;

  List<Consultation> _consultations = [];
  List<Consultation> get consultations => _consultations;

  PatientDetailsViewModel({required this.patientId});

  Future<void> initialize() async {
    setBusy(true);
    try {
      await Future.wait([
        _loadPatient(),
        _loadConsultations(),
      ]);
    } catch (e) {
      setError(
          'Failed to load patient details. Please check your connection and try again.');
    } finally {
      setBusy(false);
    }
  }

  Future<void> _loadPatient() async {
    try {
      _patient = await _patientService.getPatientById(patientId);
      notifyListeners();
    } catch (e) {
      setError('Unable to load patient information. Please try again.');
    }
  }

  Future<void> _loadConsultations() async {
    try {
      _consultations =
          await _consultationService.getConsultationsForPatient(patientId);
      _consultations
          .sort((a, b) => b.consultationDate.compareTo(a.consultationDate));
      notifyListeners();
    } catch (e) {
      setError('Unable to load consultation history. Please try again.');
    }
  }

  void navigateToNewConsultation() {
    _navigationService.navigateTo(
      Routes.consultationView,
      arguments: ConsultationViewArguments(patientId: patientId),
    );
  }

  void onConsultationTap(Consultation consultation) {
    // TODO: Implement consultation details view navigation
    // _navigationService.navigateTo(
    //   Routes.consultationDetailsView,
    //   arguments: ConsultationDetailsViewArguments(consultation: consultation),
    // );
  }

  Future<void> refreshData() async {
    await initialize();
  }
}
