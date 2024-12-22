import 'package:flutter/material.dart';
import 'package:my_app/models/patient.dart';
import 'package:my_app/ui/common/app_colors.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback onTap;

  const PatientCard({
    Key? key,
    required this.patient,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: kcPrimaryGradient,
                ),
                child: Center(
                  child: Text(
                    patient.name[0].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${patient.age} years • ${patient.gender}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: kcTextColorLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      patient.contactNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kcTextColorLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: kcTextColorLight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
