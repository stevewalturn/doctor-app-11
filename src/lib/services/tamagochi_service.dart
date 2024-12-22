import 'dart:async';
import 'package:my_app/models/tamagochi.dart';
import 'package:stacked/stacked.dart';

class TamagochiService with ReactiveServiceMixin {
  TamagochiService() {
    _startDecayTimer();
    listenToReactiveValues([_currentTamagochi]);
  }

  Timer? _decayTimer;
  ReactiveValue<Tamagochi?> _currentTamagochi = ReactiveValue<Tamagochi?>(null);
  Tamagochi? get currentTamagochi => _currentTamagochi.value;

  void createTamagochi(String name) {
    if (name.isEmpty) {
      throw Exception('Please enter a name for your Tamagochi');
    }
    _currentTamagochi.value = Tamagochi.create(name: name);
  }

  void feed() {
    if (_currentTamagochi.value == null) {
      throw Exception('No Tamagochi exists! Create one first.');
    }

    if (_currentTamagochi.value!.hunger <= 0) {
      throw Exception('${_currentTamagochi.value!.name} is not hungry right now!');
    }

    _currentTamagochi.value = _currentTamagochi.value!.copyWith(
      hunger: (_currentTamagochi.value!.hunger - 30).clamp(0, 100),
      lastFed: DateTime.now(),
    );
  }

  void play() {
    if (_currentTamagochi.value == null) {
      throw Exception('No Tamagochi exists! Create one first.');
    }

    if (_currentTamagochi.value!.energy <= 20) {
      throw Exception('${_currentTamagochi.value!.name} is too tired to play!');
    }

    _currentTamagochi.value = _currentTamagochi.value!.copyWith(
      happiness: (_currentTamagochi.value!.happiness + 30).clamp(0, 100),
      energy: (_currentTamagochi.value!.energy - 20).clamp(0, 100),
      lastPlayed: DateTime.now(),
    );
  }

  void sleep() {
    if (_currentTamagochi.value == null) {
      throw Exception('No Tamagochi exists! Create one first.');
    }

    if (_currentTamagochi.value!.energy >= 100) {
      throw Exception('${_currentTamagochi.value!.name} is not tired!');
    }

    _currentTamagochi.value = _currentTamagochi.value!.copyWith(
      energy: 100,
      lastSlept: DateTime.now(),
    );
  }

  void _startDecayTimer() {
    _decayTimer?.cancel();
    _decayTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_currentTamagochi.value != null) {
        _currentTamagochi.value = _currentTamagochi.value!.copyWith(
          hunger: (_currentTamagochi.value!.hunger + 5).clamp(0, 100),
          happiness: (_currentTamagochi.value!.happiness - 3).clamp(0, 100),
          energy: (_currentTamagochi.value!.energy - 2).clamp(0, 100),
        );
      }
    });
  }

  void dispose() {
    _decayTimer?.cancel();
  }
}