import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_text_field.dart';

class SymptomsInput extends StatelessWidget {
  final Function(String) onSymptomsChanged;
  final String? initialValue;
  final String? error;

  const SymptomsInput({
    Key? key,
    required this.onSymptomsChanged,
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
              const Icon(Icons.sick, color: kcPrimaryColor),
              const SizedBox(width: 8),
              Text(
                'Symptoms',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Patient Symptoms',
            hint: 'Describe patient symptoms',
            onChanged: onSymptomsChanged,
            initialValue: initialValue,
            errorText: error,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
          ),
        ],
      ),
    );
  }
}
