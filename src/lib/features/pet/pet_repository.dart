import 'package:my_app/models/pet.dart';
import 'package:my_app/services/pet_service.dart';
import 'package:my_app/app/app.locator.dart';

class PetRepository {
  final _petService = locator<PetService>();

  Future<void> createPet(String name) => _petService.createPet(name);

  Future<void> feedPet() => _petService.feedPet();

  Future<void> playWithPet() => _petService.playWithPet();

  Future<void> putPetToSleep() => _petService.putPetToSleep();

  Pet? get currentPet => _petService.currentPet;
}
