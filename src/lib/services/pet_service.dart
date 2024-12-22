import 'package:my_app/models/pet.dart';
import 'package:stacked/stacked_annotations.dart';

class PetService {
  Pet? _currentPet;

  Pet? get currentPet => _currentPet;

  Future<void> createPet(String name) async {
    try {
      _currentPet = Pet(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        lastFed: DateTime.now(),
        lastPlayed: DateTime.now(),
        lastSlept: DateTime.now(),
      );
    } catch (e) {
      throw 'Unable to create pet. Please try again.';
    }
  }

  Future<void> feedPet() async {
    try {
      if (_currentPet == null) {
        throw 'No pet exists! Create a pet first.';
      }

      _currentPet = _currentPet!.copyWith(
        hunger: (_currentPet!.hunger - 30).clamp(0, 100),
        happiness: (_currentPet!.happiness + 10).clamp(0, 100),
        lastFed: DateTime.now(),
      );
    } catch (e) {
      throw 'Unable to feed pet. Please try again.';
    }
  }

  Future<void> playWithPet() async {
    try {
      if (_currentPet == null) {
        throw 'No pet exists! Create a pet first.';
      }

      _currentPet = _currentPet!.copyWith(
        happiness: (_currentPet!.happiness + 20).clamp(0, 100),
        energy: (_currentPet!.energy - 20).clamp(0, 100),
        lastPlayed: DateTime.now(),
      );
    } catch (e) {
      throw 'Unable to play with pet. Please try again.';
    }
  }

  Future<void> putPetToSleep() async {
    try {
      if (_currentPet == null) {
        throw 'No pet exists! Create a pet first.';
      }

      _currentPet = _currentPet!.copyWith(
        energy: 100,
        lastSlept: DateTime.now(),
      );
    } catch (e) {
      throw 'Unable to put pet to sleep. Please try again.';
    }
  }
}
