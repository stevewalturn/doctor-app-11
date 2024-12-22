import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/models/consultation.dart';
import 'package:my_app/ui/common/app_colors.dart';

class ConsultationHistory extends StatelessWidget {
  final List<Consultation> consultations;

  const ConsultationHistory({
    required this.consultations,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (consultations.isEmpty) {
      return const Center(
        child: Text(
          'No consultation history available',
          style: TextStyle(color: kcTextColorLight),
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
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                DateFormat('MMM d, yyyy').format(consultation.consultationDate),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                DateFormat('h:mm a').format(consultation.consultationDate),
                style: const TextStyle(color: kcTextColorLight),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSection('Symptoms', consultation.symptoms),
                      const SizedBox(height: 16),
                      _buildSection('Diagnosis', consultation.diagnosis),
                      const SizedBox(height: 16),
                      _buildSection('Prescription', consultation.prescription),
                      if (consultation.notes != null) ...[
                        const SizedBox(height: 16),
                        _buildSection('Notes', consultation.notes!),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: kcTextColorLight,
          ),
        ),
        const SizedBox(height: 4),
        Text(content),
      ],
    );
  }
}
