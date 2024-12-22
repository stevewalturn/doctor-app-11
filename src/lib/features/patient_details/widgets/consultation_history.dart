import 'package:flutter/material.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:intl/intl.dart';

class ConsultationHistory extends StatelessWidget {
  final List<Consultation> consultations;
  final Function(Consultation) onConsultationTap;

  const ConsultationHistory({
    Key? key,
    required this.consultations,
    required this.onConsultationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (consultations.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No consultation history',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final consultation = consultations[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: () => onConsultationTap(consultation),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('MMM dd, yyyy')
                            .format(consultation.consultationDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: kcPrimaryColor,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        color: kcMediumGrey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow('Symptoms', consultation.symptoms),
                  const SizedBox(height: 8),
                  _buildInfoRow('Diagnosis', consultation.diagnosis),
                  if (consultation.prescription != null &&
                      consultation.prescription!.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildInfoRow('Prescription', consultation.prescription!),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: kcMediumGrey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: kcDarkGreyColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
