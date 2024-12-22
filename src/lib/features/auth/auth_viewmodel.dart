import 'package:logger/logger.dart';
import 'package:my_app/app/app.locator.dart';
import 'package:my_app/app/app.router.dart';
import 'package:my_app/features/auth/auth_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthViewModel extends BaseViewModel {
  final _authRepository = locator<AuthRepository>();
  final _navigationService = locator<NavigationService>();
  final _logger = Logger();

  String _email = '';
  String _password = '';
  String? _modelError;

  String? get modelError => _modelError;

  void setEmail(String email) {
    _email = email.trim();
  }

  void setPassword(String password) {
    _password = password;
  }

  bool _validateInputs() {
    if (_email.isEmpty || _password.isEmpty) {
      _modelError = 'Please enter both email and password';
      notifyListeners();
      return false;
    }
    if (!_email.contains('@')) {
      _modelError = 'Please enter a valid email address';
      notifyListeners();
      return false;
    }
    if (_password.length < 6) {
      _modelError = 'Password must be at least 6 characters long';
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<void> login() async {
    try {
      _modelError = null;
      if (!_validateInputs()) return;

      setBusy(true);
      await _authRepository.login(_email, _password);
      await _navigationService.replaceWith(Routes.homeView);
    } catch (e) {
      _logger.e('Login failed: $e');
      _modelError =
          'Login failed. Please check your credentials and try again.';
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }

  Future<void> logout() async {
    try {
      setBusy(true);
      await _authRepository.logout();
      await _navigationService.clearStackAndShow(Routes.loginView);
    } catch (e) {
      _logger.e('Logout failed: $e');
      _modelError = 'Failed to logout. Please try again.';
      notifyListeners();
    } finally {
      setBusy(false);
    }
  }
}
