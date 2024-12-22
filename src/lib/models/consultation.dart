import 'package:equatable/equatable.dart';

class Consultation extends Equatable {
  final String id;
  final String patientId;
  final String diagnosis;
  final String symptoms;
  final String? prescription;
  final String? notes;
  final DateTime consultationDate;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Consultation({
    required this.id,
    required this.patientId,
    required this.diagnosis,
    required this.symptoms,
    this.prescription,
    this.notes,
    required this.consultationDate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id: json['id'] as String,
      patientId: json['patientId'] as String,
      diagnosis: json['diagnosis'] as String,
      symptoms: json['symptoms'] as String,
      prescription: json['prescription'] as String?,
      notes: json['notes'] as String?,
      consultationDate: DateTime.parse(json['consultationDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'patientId': patientId,
      'diagnosis': diagnosis,
      'symptoms': symptoms,
      'prescription': prescription,
      'notes': notes,
      'consultationDate': consultationDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Consultation copyWith({
    String? id,
    String? patientId,
    String? diagnosis,
    String? symptoms,
    String? prescription,
    String? notes,
    DateTime? consultationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Consultation(
      id: id ?? this.id,
      patientId: patientId ?? this.patientId,
      diagnosis: diagnosis ?? this.diagnosis,
      symptoms: symptoms ?? this.symptoms,
      prescription: prescription ?? this.prescription,
      notes: notes ?? this.notes,
      consultationDate: consultationDate ?? this.consultationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        patientId,
        diagnosis,
        symptoms,
        prescription,
        notes,
        consultationDate,
        createdAt,
        updatedAt,
      ];
}
