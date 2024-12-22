import 'package:equatable/equatable.dart';

class Consultation extends Equatable {
  final String id;
  final String patientId;
  final String symptoms;
  final String diagnosis;
  final String prescription;
  final DateTime consultationDate;
  final String doctorId;
  final String? notes;

  const Consultation({
    required this.id,
    required this.patientId,
    required this.symptoms,
    required this.diagnosis,
    required this.prescription,
    required this.consultationDate,
    required this.doctorId,
    this.notes,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      symptoms: json['symptoms'] as String,
      diagnosis: json['diagnosis'] as String,
      prescription: json['prescription'] as String,
      consultationDate: DateTime.parse(json['consultationDate'] as String),
      doctorId: json['doctorId'] as String,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'symptoms': symptoms,
      'diagnosis': diagnosis,
      'prescription': prescription,
      'consultationDate': consultationDate.toIso8601String(),
      'doctorId': doctorId,
      'notes': notes,
    };
  }

  Consultation copyWith({
    String? id,
    String? patientId,
    String? symptoms,
    String? diagnosis,
    String? prescription,
    DateTime? consultationDate,
    String? doctorId,
    String? notes,
  }) {
    return Consultation(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      symptoms: symptoms ?? this.symptoms,
      diagnosis: diagnosis ?? this.diagnosis,
      prescription: prescription ?? this.prescription,
      consultationDate: consultationDate ?? this.consultationDate,
      doctorId: doctorId ?? this.doctorId,
      notes: notes ?? this.notes,
    );
  }

  @override
  List<Object?> get props => [
        id,
        patientId,
        symptoms,
        diagnosis,
        prescription,
        consultationDate,
        doctorId,
        notes,
      ];
}
