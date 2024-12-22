import 'package:flutter/material.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/ui_helpers.dart';
import 'package:my_app/ui/dialogs/name_pet/name_pet_dialog_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NamePetDialog extends StackedView<NamePetDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NamePetDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    NamePetDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Name Your Pet',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            verticalSpaceMedium,
            TextField(
              onChanged: viewModel.setName,
              decoration: const InputDecoration(
                hintText: 'Enter pet name',
                border: OutlineInputBorder(),
              ),
            ),
            verticalSpaceMedium,
            if (viewModel.hasError)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  viewModel.modelError.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => completer(DialogResponse(confirmed: false)),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: viewModel.isBusy || !viewModel.canCreate
                      ? null
                      : () async {
                          await viewModel.createPet();
                          if (!viewModel.hasError) {
                            completer(DialogResponse(confirmed: true));
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kcPrimaryColor,
                  ),
                  child: viewModel.isBusy
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text('Create'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  NamePetDialogModel viewModelBuilder(BuildContext context) =>
      NamePetDialogModel();
}
