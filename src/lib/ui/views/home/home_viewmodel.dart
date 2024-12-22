import 'package:my_app/app/app.bottomsheets.dart';
import 'package:my_app/app/app.dialogs.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/features/pet/pet_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _petRepository = locator<PetRepository>();

  bool get hasPet => _petRepository.currentPet != null;
  String? get petName => _petRepository.currentPet?.name;

  Future<void> createNewPet() async {
    try {
      final response = await _dialogService.showCustomDialog(
        variant: DialogType.namePet,
      );

      if (response?.confirmed ?? false) {
        await _navigationService.navigateToPetView();
      }
    } catch (e) {
      setError('Failed to create pet. Please try again.');
    }
  }

  Future<void> navigateToPet() async {
    try {
      await _navigationService.navigateToPetView();
    } catch (e) {
      setError('Unable to navigate to pet view. Please try again.');
    }
  }
}
