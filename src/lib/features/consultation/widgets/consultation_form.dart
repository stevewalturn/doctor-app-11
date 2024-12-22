import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/widgets/custom_text_field.dart';

class ConsultationForm extends StatelessWidget {
  final TextEditingController symptomsController;
  final TextEditingController diagnosisController;
  final TextEditingController prescriptionController;
  final TextEditingController notesController;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSubmit;

  const ConsultationForm({
    Key? key,
    required this.symptomsController,
    required this.diagnosisController,
    required this.prescriptionController,
    required this.notesController,
    required this.isLoading,
    this.errorMessage,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            label: 'Symptoms',
            hint: 'Enter patient symptoms',
            controller: symptomsController,
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter symptoms';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Diagnosis',
            hint: 'Enter diagnosis',
            controller: diagnosisController,
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter diagnosis';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Prescription',
            hint: 'Enter prescription details',
            controller: prescriptionController,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Additional Notes',
            hint: 'Enter any additional notes',
            controller: notesController,
            maxLines: 3,
          ),
          const SizedBox(height: 24),
          if (errorMessage != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                errorMessage!,
                style: const TextStyle(
                  color: kcErrorRed,
                  fontSize: 14,
                ),
              ),
            ),
          ElevatedButton(
            onPressed: isLoading ? null : onSubmit,
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text('Save Consultation'),
          ),
        ],
      ),
    );
  }
}
