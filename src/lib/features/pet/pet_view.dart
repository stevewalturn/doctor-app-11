import 'package:flutter/material.dart';
import 'package:my_app/features/pet/pet_viewmodel.dart';
import 'package:my_app/features/pet/widgets/pet_avatar.dart';
import 'package:my_app/features/pet/widgets/pet_action_buttons.dart';
import 'package:my_app/features/pet/widgets/pet_status_bar.dart';
import 'package:my_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class PetView extends StackedView<PetViewModel> {
  const PetView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PetViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              if (viewModel.pet != null) ...[
                verticalSpaceLarge,
                PetStatusBar(pet: viewModel.pet!),
                verticalSpaceLarge,
                const PetAvatar(),
                verticalSpaceLarge,
                PetActionButtons(
                  onFeed: viewModel.feedPet,
                  onPlay: viewModel.playWithPet,
                  onSleep: viewModel.putPetToSleep,
                  isBusy: viewModel.isBusy,
                ),
                if (viewModel.hasError)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      viewModel.modelError.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ] else
                const Center(
                  child: Text('No pet found! Create one from the home screen.'),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  PetViewModel viewModelBuilder(BuildContext context) => PetViewModel();
}
