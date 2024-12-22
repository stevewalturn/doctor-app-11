import 'package:flutter/material.dart';
import 'package:my_app/features/auth/auth_viewmodel.dart';
import 'package:my_app/ui/common/app_colors.dart';
import 'package:my_app/widgets/custom_button.dart';
import 'package:my_app/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class AuthView extends StackedView<AuthViewModel> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AuthViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(
                Icons.medical_services_rounded,
                size: 80,
                color: kcPrimaryColor,
              ),
              const SizedBox(height: 24),
              Text(
                'Doctor\'s Assistant',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kcPrimaryColor,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              CustomTextField(
                label: 'Email',
                hint: 'Enter your email',
                onChanged: viewModel.setEmail,
                keyboardType: TextInputType.emailAddress,
                prefix:
                    const Icon(Icons.email_outlined, color: kcTextColorLight),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                onChanged: viewModel.setPassword,
                obscureText: true,
                prefix: const Icon(Icons.lock_outline, color: kcTextColorLight),
              ),
              const SizedBox(height: 24),
              if (viewModel.modelError != null) ...[
                Text(
                  viewModel.modelError!,
                  style: const TextStyle(
                    color: kcErrorColor,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              ],
              CustomButton(
                text: 'Login',
                onPressed: viewModel.login,
                isLoading: viewModel.isBusy,
              ),
              const Spacer(),
              Text(
                '© 2024 Doctor\'s Assistant',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AuthViewModel viewModelBuilder(BuildContext context) => AuthViewModel();
}
