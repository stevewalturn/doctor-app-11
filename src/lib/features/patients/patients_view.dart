import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/widgets/custom_app_bar.dart';
import 'package:my_app/ui/widgets/custom_button.dart';
import 'package:my_app/features/patients/patients_viewmodel.dart';
import 'package:my_app/features/patients/widgets/patient_card.dart';
import 'package:stacked/stacked.dart';

class PatientsView extends StackedView<PatientsViewModel> {
  const PatientsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: const CustomAppBar(
        title: 'Patients',
        showBackButton: false,
      ),
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : _buildContent(context, viewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.navigateToAddPatient,
        backgroundColor: kcPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildContent(BuildContext context, PatientsViewModel viewModel) {
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
              onPressed: viewModel.initialise,
              backgroundColor: kcErrorRed,
            ),
          ],
        ),
      );
    }

    if (viewModel.patients.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_outline,
              size: 64,
              color: kcMediumGrey,
            ),
            const SizedBox(height: 16),
            const Text(
              'No patients found',
              style: TextStyle(
                fontSize: 18,
                color: kcMediumGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add your first patient to get started',
              style: TextStyle(
                color: kcMediumGrey,
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: viewModel.refreshPatients,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: viewModel.patients.length,
        itemBuilder: (context, index) {
          final patient = viewModel.patients[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PatientCard(
              patient: patient,
              onTap: () => viewModel.navigateToPatientDetails(patient.id),
            ),
          );
        },
      ),
    );
  }

  @override
  PatientsViewModel viewModelBuilder(BuildContext context) =>
      PatientsViewModel();

  @override
  void onViewModelReady(PatientsViewModel viewModel) => viewModel.initialise();
}
