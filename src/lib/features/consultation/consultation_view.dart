import 'package:flutter/material.dart';
import 'package:my_app/features/consultation/consultation_viewmodel.dart';
import 'package:my_app/features/consultation/widgets/diagnosis_form.dart';
import 'package:my_app/features/consultation/widgets/prescription_input.dart';
import 'package:my_app/features/consultation/widgets/symptoms_input.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class ConsultationView extends StackedView<ConsultationViewModel> {
  final Patient patient;

  const ConsultationView({
    required this.patient,
    Key? key,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConsultationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Consultation'),
      ),
      body: SingleChildScrollView(
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
            Text(
              '${patient.age} years • ${patient.gender}',
              style: const TextStyle(color: kcTextColorLight),
            ),
            const SizedBox(height: 24),
            SymptomsInput(
              onSymptomsChanged: viewModel.setSymptoms,
            ),
            const SizedBox(height: 16),
            DiagnosisForm(
              onDiagnosisChanged: viewModel.setDiagnosis,
            ),
            const SizedBox(height: 16),
            PrescriptionInput(
              onPrescriptionChanged: viewModel.setPrescription,
            ),
            if (viewModel.modelError != null) ...[
              const SizedBox(height: 16),
              Text(
                viewModel.modelError!,
                style: const TextStyle(color: kcErrorColor),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 24),
            CustomButton(
              text: 'Save Consultation',
              onPressed: viewModel.saveConsultation,
              isLoading: viewModel.isBusy,
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConsultationViewModel viewModelBuilder(BuildContext context) =>
      ConsultationViewModel(patient);
}
