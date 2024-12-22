import 'package:my_app/app/app.locator.dart';
import 'package:my_app/features/pet/pet_repository.dart';
import 'package:my_app/models/pet.dart';
import 'package:stacked/stacked.dart';

class PetViewModel extends BaseViewModel {
  final _petRepository = locator<PetRepository>();

  Pet? get pet => _petRepository.currentPet;

  Future<void> feedPet() async {
    try {
      setBusy(true);
      await _petRepository.feedPet();
      notifyListeners();
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }

  Future<void> playWithPet() async {
    try {
      setBusy(true);
      await _petRepository.playWithPet();
      notifyListeners();
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }

  Future<void> putPetToSleep() async {
    try {
      setBusy(true);
      await _petRepository.putPetToSleep();
      notifyListeners();
    } catch (e) {
      setError(e.toString());
    } finally {
      setBusy(false);
    }
  }
}
