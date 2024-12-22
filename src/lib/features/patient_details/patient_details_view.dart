import 'package:flutter/material.dart';
import 'package:my_app/features/patient_details/patient_details_viewmodel.dart';
import 'package:my_app/features/patient_details/widgets/consultation_history.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/loading_indicator.dart';
import 'package:stacked/stacked.dart';

class PatientDetailsView extends StackedView<PatientDetailsViewModel> {
  final String patientId;

  const PatientDetailsView({
    required this.patientId,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: viewModel.deletePatient,
          ),
        ],
      ),
      body: viewModel.isBusy
          ? const LoadingIndicator(message: 'Loading patient details...')
          : _buildContent(context, viewModel),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: viewModel.navigateToNewConsultation,
        icon: const Icon(Icons.add),
        label: const Text('New Consultation'),
        backgroundColor: kcPrimaryColor,
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
              viewModel.modelError!,
              style: const TextStyle(color: kcErrorColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: 'Retry',
              onPressed: viewModel.loadPatientDetails,
              type: ButtonType.secondary,
              isFullWidth: false,
            ),
          ],
        ),
      );
    }

    final patient = viewModel.patient;
    if (patient == null) return const SizedBox();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.person, '${patient.age} years old'),
                  const SizedBox(height: 4),
                  _buildInfoRow(Icons.wc, patient.gender),
                  const SizedBox(height: 4),
                  _buildInfoRow(Icons.phone, patient.contactNumber),
                  if (patient.medicalHistory != null) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Medical History',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: kcTextColorLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(patient.medicalHistory!),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Consultation History',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ConsultationHistory(
            consultations: viewModel.consultations,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: kcTextColorLight),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: kcTextColorLight),
        ),
      ],
    );
  }

  @override
  PatientDetailsViewModel viewModelBuilder(BuildContext context) =>
      PatientDetailsViewModel(patientId);

  @override
  void onViewModelReady(PatientDetailsViewModel viewModel) =>
      viewModel.loadPatientDetails();
}
