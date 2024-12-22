import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_app/ui/views/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Tamagotchi!',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Gap(25),
                if (viewModel.hasPet)
                  Column(
                    children: [
                      Text(
                        'Your pet ${viewModel.petName} is waiting!',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Gap(16),
                      ElevatedButton(
                        onPressed: viewModel.navigateToPet,
                        child: const Text('Visit Pet'),
                      ),
                    ],
                  )
                else
                  ElevatedButton(
                    onPressed: viewModel.createNewPet,
                    child: const Text('Create New Pet'),
                  ),
                if (viewModel.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      viewModel.modelError.toString(),
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
