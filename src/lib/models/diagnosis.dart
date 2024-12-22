import 'package:equatable/equatable.dart';

class Diagnosis extends Equatable {
  final String id;
  final String consultationId;
  final String condition;
  final String description;
  final List<String> symptoms;
  final DateTime diagnosisDate;

  const Diagnosis({
    required this.id,
    required this.consultationId,
    required this.condition,
    required this.description,
    required this.symptoms,
    required this.diagnosisDate,
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      id: json['id'] as String,
      consultationId: json['consultationId'] as String,
      condition: json['condition'] as String,
      description: json['description'] as String,
      symptoms: List<String>.from(json['symptoms'] as List),
      diagnosisDate: DateTime.parse(json['diagnosisDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'consultationId': consultationId,
      'condition': condition,
      'description': description,
      'symptoms': symptoms,
      'diagnosisDate': diagnosisDate.toIso8601String(),
    };
  }

  Diagnosis copyWith({
    String? id,
    String? consultationId,
    String? condition,
    String? description,
    List<String>? symptoms,
    DateTime? diagnosisDate,
  }) {
    return Diagnosis(
      id: id ?? this.id,
      consultationId: consultationId ?? this.consultationId,
      condition: condition ?? this.condition,
      description: description ?? this.description,
      symptoms: symptoms ?? this.symptoms,
      diagnosisDate: diagnosisDate ?? this.diagnosisDate,
    );
  }

  @override
  List<Object> get props => [
        id,
        consultationId,
        condition,
        description,
        symptoms,
        diagnosisDate,
      ];
}
