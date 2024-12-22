import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_text_field.dart';

class PrescriptionInput extends StatelessWidget {
  final Function(String) onPrescriptionChanged;
  final String? initialValue;
  final String? error;

  const PrescriptionInput({
    Key? key,
    required this.onPrescriptionChanged,
    this.initialValue,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              const Icon(Icons.medication, color: kcPrimaryColor),
              const SizedBox(width: 8),
              Text(
                'Prescription',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Prescribed Medications',
            hint: 'Enter medications and dosage',
            onChanged: onPrescriptionChanged,
            initialValue: initialValue,
            errorText: error,
            maxLines: 4,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}
