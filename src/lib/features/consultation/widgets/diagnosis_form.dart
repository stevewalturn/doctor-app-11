import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_text_field.dart';

class DiagnosisForm extends StatelessWidget {
  final Function(String) onDiagnosisChanged;
  final String? initialValue;
  final String? error;

  const DiagnosisForm({
    Key? key,
    required this.onDiagnosisChanged,
    this.initialValue,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.medical_information, color: kcPrimaryColor),
                  const SizedBox(width: 8),
                  Text(
                    'Diagnosis',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Medical Diagnosis',
                hint: 'Enter detailed diagnosis',
                onChanged: onDiagnosisChanged,
                initialValue: initialValue,
                errorText: error,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
