import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/features/tamagochi/tamagochi_viewmodel.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class TamagochiView extends StackedView<TamagochiViewModel> {
  const TamagochiView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TamagochiViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center(
          child: viewModel.hasTamagochi
              ? _buildTamagochiUI(viewModel)
              : _buildCreateTamagochiUI(viewModel),
        ),
      ),
    );
  }

  Widget _buildCreateTamagochiUI(TamagochiViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Create Your Tamagochi',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        verticalSpaceMedium,
        TextField(
          controller: viewModel.nameController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Name',
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kcPrimaryColor),
            ),
          ),
        ),
        verticalSpaceMedium,
        if (viewModel.modelError != null)
          Text(
            viewModel.modelError.toString(),
            style: const TextStyle(color: Colors.red),
          ),
        ElevatedButton(
          onPressed: viewModel.createTamagochi,
          child: const Text('Create'),
        ),
      ],
    );
  }

  Widget _buildTamagochiUI(TamagochiViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          viewModel.tamagochiName,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        verticalSpaceMedium,
        _buildStatusBar('Happiness', viewModel.happiness, Colors.pink),
        const Gap(10),
        _buildStatusBar('Hunger', viewModel.hunger, Colors.green),
        const Gap(10),
        _buildStatusBar('Energy', viewModel.energy, Colors.blue),
        verticalSpaceLarge,
        if (viewModel.modelError != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              viewModel.modelError.toString(),
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              onPressed: viewModel.feed,
              icon: Icons.restaurant,
              label: 'Feed',
            ),
            _buildActionButton(
              onPressed: viewModel.play,
              icon: Icons.sports_esports,
              label: 'Play',
            ),
            _buildActionButton(
              onPressed: viewModel.sleep,
              icon: Icons.bedroom_baby,
              label: 'Sleep',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatusBar(String label, int value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: $value%',
          style: const TextStyle(color: Colors.white),
        ),
        const Gap(4),
        LinearProgressIndicator(
          value: value / 100,
          backgroundColor: Colors.grey[800],
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: kcPrimaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  @override
  TamagochiViewModel viewModelBuilder(BuildContext context) =>
      TamagochiViewModel();
}
