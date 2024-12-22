import 'package:flutter/material.dart';
import 'package:my_app/features/patient_details/patient_details_viewmodel.dart';
import 'package:my_app/features/patient_details/widgets/consultation_history.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/widgets/custom_app_bar.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:intl/intl.dart';

class PatientDetailsView extends StackedView<PatientDetailsViewModel> {
  final String patientId;

  const PatientDetailsView({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: viewModel.patient?.name ?? 'Patient Details',
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(context, viewModel),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => viewModel.navigateToNewConsultation(),
        backgroundColor: kcPrimaryColor,
        icon: const Icon(Icons.add),
        label: const Text('New Consultation'),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, PatientDetailsViewModel viewModel) {
    if (viewModel.modelError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              viewModel.modelError.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: kcErrorRed),
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Retry',
              onPressed: viewModel.initialize,
              backgroundColor: kcErrorRed,
            ),
          ],
        ),
      );
    }

    final patient = viewModel.patient;
    if (patient == null) {
      return const Center(
        child: Text('Patient not found'),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPatientInfo(patient),
          const SizedBox(height: 24),
          const Text(
            'Consultation History',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ConsultationHistory(
            consultations: viewModel.consultations,
            onConsultationTap: viewModel.onConsultationTap,
          ),
        ],
      ),
    );
  }

  Widget _buildPatientInfo(patient) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kcPrimaryColor,
                  ),
                  child: Center(
                    child: Text(
                      patient.name.substring(0, 1).toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'DOB: ${DateFormat('MMM dd, yyyy').format(patient.dateOfBirth)}',
                        style: const TextStyle(
                          color: kcMediumGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 32),
            _buildInfoRow('Phone', patient.phoneNumber),
            if (patient.email != null) _buildInfoRow('Email', patient.email!),
            if (patient.medicalHistory != null)
              _buildInfoRow('Medical History', patient.medicalHistory!),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                color: kcMediumGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  PatientDetailsViewModel viewModelBuilder(BuildContext context) =>
      PatientDetailsViewModel(patientId: patientId);

  @override
  void onViewModelReady(PatientDetailsViewModel viewModel) =>
      viewModel.initialize();
}
