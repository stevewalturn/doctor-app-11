import 'package:flutter/material.dart';
import 'package:my_app/features/consultation/consultation_viewmodel.dart';
import 'package:my_app/features/consultation/widgets/consultation_form.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/widgets/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

class ConsultationView extends StackedView<ConsultationViewModel> {
  final String patientId;

  const ConsultationView({
    Key? key,
    required this.patientId,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConsultationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: viewModel.isEditing ? 'Edit Consultation' : 'New Consultation',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (viewModel.modelError != null)
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: kcErrorRed.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: kcErrorRed,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        viewModel.modelError.toString(),
                        style: const TextStyle(
                          color: kcErrorRed,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: SingleChildScrollView(
                child: ConsultationForm(
                  symptomsController: viewModel.symptomsController,
                  diagnosisController: viewModel.diagnosisController,
                  prescriptionController: viewModel.prescriptionController,
                  notesController: viewModel.notesController,
                  isLoading: viewModel.isBusy,
                  errorMessage: viewModel.modelError?.toString(),
                  onSubmit: viewModel.saveConsultation,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ConsultationViewModel viewModelBuilder(BuildContext context) =>
      ConsultationViewModel(patientId: patientId);

  @override
  void onViewModelReady(ConsultationViewModel viewModel) =>
      viewModel.initialize();
}
