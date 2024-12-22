import 'package:logger/logger.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/features/consultation/consultation_repository.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/models/patient.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ConsultationViewModel extends BaseViewModel {
  final _consultationRepository = locator<ConsultationRepository>();
  final _navigationService = locator<NavigationService>();
  final _logger = Logger();

  final Patient patient;
  String? _symptoms;
  String? _diagnosis;
  String? _prescription;
  String? _modelError;

  ConsultationViewModel(this.patient);

  String? get modelError => _modelError;

  void setSymptoms(String symptoms) {
    _symptoms = symptoms;
    notifyListeners();
  }

  void setDiagnosis(String diagnosis) {
    _diagnosis = diagnosis;
    notifyListeners();
  }

  void setPrescription(String prescription) {
    _prescription = prescription;
    notifyListeners();
  }

  bool _validateInputs() {
    if (_symptoms?.isEmpty ?? true) {
      _modelError = 'Please enter patient symptoms';
      notifyListeners();
      return false;
    }
    if (_diagnosis?.isEmpty ?? true) {
      _modelError = 'Please enter diagnosis';
      notifyListeners();
      return false;
    }
    if (_prescription?.isEmpty ?? true) {
      _modelError = 'Please enter prescription';
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<void> saveConsultation() async {
    try {
      _modelError = null;
      if (!_validateInputs()) return;

      setBusy(true);
      final consultation = Consultation(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        patientId: patient.id,
        symptoms: _symptoms!,
        diagnosis: _diagnosis!,
        prescription: _prescription!,
        consultationDate: DateTime.now(),
        doctorId: 'current_doctor_id', // Replace with actual doctor ID
      );

      await _consultationRepository.addConsultation(consultation);
      _navigationService.back(result: true);
    } catch (e) {
      _logger.e('Failed to save consultation: $e');
      _modelError = 'Unable to save consultation. Please try again.';
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  @override
  void onFutureError(error, Object? key) {
    _logger.e('Error in ConsultationViewModel: $error');
    _modelError = 'An unexpected error occurred. Please try again.';
    notifyListeners();
    super.onFutureError(error, key);
  }
}
