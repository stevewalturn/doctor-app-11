import 'package:flutter/material.dart';
import 'package:my_app/features/patients/patients_viewmodel.dart';
import 'package:my_app/features/patients/widgets/patient_list.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_text_field.dart';
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
      appBar: AppBar(
        title: const Text('Patients'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: viewModel.navigateToAddPatient,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomTextField(
              label: 'Search Patients',
              hint: 'Enter name or phone number',
              onChanged: viewModel.setSearchQuery,
              prefix: const Icon(Icons.search, color: kcTextColorLight),
            ),
          ),
          if (viewModel.modelError != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                viewModel.modelError!,
                style: const TextStyle(color: kcErrorColor),
                textAlign: TextAlign.center,
              ),
            ),
          Expanded(
            child: PatientList(
              patients: viewModel.filteredPatients,
              onPatientTap: viewModel.navigateToPatientDetails,
              isLoading: viewModel.isBusy,
            ),
          ),
        ],
      ),
    );
  }

  @override
  PatientsViewModel viewModelBuilder(BuildContext context) =>
      PatientsViewModel();

  @override
  void onViewModelReady(PatientsViewModel viewModel) =>
      viewModel.loadPatients();
}
