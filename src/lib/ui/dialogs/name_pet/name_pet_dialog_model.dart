import 'package:my_app/app/app.locator.dart';
import 'package:my_app/features/pet/pet_repository.dart';
import 'package:stacked/stacked.dart';

class NamePetDialogModel extends BaseViewModel {
  final _petRepository = locator<PetRepository>();
  String? _name;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  bool get canCreate => _name != null && _name!.isNotEmpty;

  Future<void> createPet() async {
    if (!canCreate) return;

    try {
      setBusy(true);
      await _petRepository.createPet(_name!);
      notifyListeners();
    } catch (e) {
      setError('Failed to create pet. Please try again.');
    } finally {
      setBusy(false);
    }
  }
}
