import 'package:equatable/equatable.dart';

class Patient extends Equatable {
  final String id;
  final String name;
  final int age;
  final String gender;
  final String contactNumber;
  final String? medicalHistory;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.contactNumber,
    this.medicalHistory,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      contactNumber: json['contactNumber'] as String,
      medicalHistory: json['medicalHistory'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'contactNumber': contactNumber,
      'medicalHistory': medicalHistory,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Patient copyWith({
    String? id,
    String? name,
    int? age,
    String? gender,
    String? contactNumber,
    String? medicalHistory,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Patient(
      id: id ?? this.id,
      name: name ?? this.name,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      contactNumber: contactNumber ?? this.contactNumber,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        age,
        gender,
        contactNumber,
        medicalHistory,
        createdAt,
        updatedAt,
      ];
}
