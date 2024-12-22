import 'dart:async';
import 'package:my_app/models/tamagochi.dart';
import 'package:stacked/stacked.dart';

class TamagochiService with ListenableServiceMixin {
  TamagochiService() {
    _startDecayTimer();
  }

  Timer? _decayTimer;
  Tamagochi? _currentTamagochi;
  Tamagochi? get currentTamagochi => _currentTamagochi;

  void createTamagochi(String name) {
    if (name.isEmpty) {
      throw Exception('Please enter a name for your Tamagochi');
    }
    _currentTamagochi = Tamagochi.create(name: name);
    notifyListeners();
  }

  void feed() {
    if (_currentTamagochi == null) {
      throw Exception('No Tamagochi exists! Create one first.');
    }

    if (_currentTamagochi!.hunger <= 0) {
      throw Exception('${_currentTamagochi!.name} is not hungry right now!');
    }

    _currentTamagochi = _currentTamagochi!.copyWith(
      hunger: (_currentTamagochi!.hunger - 30).clamp(0, 100),
      lastFed: DateTime.now(),
    );
    notifyListeners();
  }

  void play() {
    if (_currentTamagochi == null) {
      throw Exception('No Tamagochi exists! Create one first.');
    }

    if (_currentTamagochi!.energy <= 20) {
      throw Exception('${_currentTamagochi!.name} is too tired to play!');
    }

    _currentTamagochi = _currentTamagochi!.copyWith(
      happiness: (_currentTamagochi!.happiness + 30).clamp(0, 100),
      energy: (_currentTamagochi!.energy - 20).clamp(0, 100),
      lastPlayed: DateTime.now(),
    );
    notifyListeners();
  }

  void sleep() {
    if (_currentTamagochi == null) {
      throw Exception('No Tamagochi exists! Create one first.');
    }

    if (_currentTamagochi!.energy >= 100) {
      throw Exception('${_currentTamagochi!.name} is not tired!');
    }

    _currentTamagochi = _currentTamagochi!.copyWith(
      energy: 100,
      lastSlept: DateTime.now(),
    );
    notifyListeners();
  }

  void _startDecayTimer() {
    _decayTimer?.cancel();
    _decayTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      if (_currentTamagochi != null) {
        _currentTamagochi = _currentTamagochi!.copyWith(
          hunger: (_currentTamagochi!.hunger + 5).clamp(0, 100),
          happiness: (_currentTamagochi!.happiness - 3).clamp(0, 100),
          energy: (_currentTamagochi!.energy - 2).clamp(0, 100),
        );
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _decayTimer?.cancel();
    super.dispose();
  }
}
