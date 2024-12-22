import 'package:equatable/equatable.dart';

class Pet extends Equatable {
  final String id;
  final String name;
  final int happiness;
  final int hunger;
  final int energy;
  final DateTime lastFed;
  final DateTime lastPlayed;
  final DateTime lastSlept;

  const Pet({
    required this.id,
    required this.name,
    this.happiness = 100,
    this.hunger = 0,
    this.energy = 100,
    required this.lastFed,
    required this.lastPlayed,
    required this.lastSlept,
  });

  Pet copyWith({
    String? id,
    String? name,
    int? happiness,
    int? hunger,
    int? energy,
    DateTime? lastFed,
    DateTime? lastPlayed,
    DateTime? lastSlept,
  }) {
    return Pet(
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

  bool get needsFeeding => DateTime.now().difference(lastFed).inHours >= 4;
  bool get needsPlaying => DateTime.now().difference(lastPlayed).inHours >= 2;
  bool get needsSleep => DateTime.now().difference(lastSlept).inHours >= 8;

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
