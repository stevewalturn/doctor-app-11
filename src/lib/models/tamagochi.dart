import 'package:equatable/equatable.dart';

class Tamagochi extends Equatable {
  final String id;
  final String name;
  final int happiness;
  final int hunger;
  final int energy;
  final DateTime lastFed;
  final DateTime lastPlayed;
  final DateTime lastSlept;

  const Tamagochi({
    required this.id,
    required this.name,
    required this.happiness,
    required this.hunger,
    required this.energy,
    required this.lastFed,
    required this.lastPlayed,
    required this.lastSlept,
  });

  factory Tamagochi.create({required String name}) {
    return Tamagochi(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      happiness: 100,
      hunger: 0,
      energy: 100,
      lastFed: DateTime.now(),
      lastPlayed: DateTime.now(),
      lastSlept: DateTime.now(),
    );
  }

  Tamagochi copyWith({
    String? id,
    String? name,
    int? happiness,
    int? hunger,
    int? energy,
    DateTime? lastFed,
    DateTime? lastPlayed,
    DateTime? lastSlept,
  }) {
    return Tamagochi(
      id: id ?? this.id,
      name: name ?? this.name,
      happiness: happiness ?? this.happiness,
      hunger: hunger ?? this.hunger,
      energy: energy ?? this.energy,
      lastFed: lastFed ?? this.lastFed,
      lastPlayed: lastPlayed ?? this.lastPlayed,
      lastSlept: lastSlept ?? this.lastSlept,
    );
  }

  bool get needsFood => hunger >= 70;
  bool get needsPlay => happiness <= 30;
  bool get needsSleep => energy <= 30;

  @override
  List<Object?> get props => [
        id,
        name,
        happiness,
        hunger,
        energy,
        lastFed,
        lastPlayed,
        lastSlept,
      ];
}
