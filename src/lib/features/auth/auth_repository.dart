import 'package:my_app/app/app.locator.dart';
import 'package:my_app/services/authentication_service.dart';
import 'package:logger/logger.dart';

class AuthRepository {
  final _authService = locator<AuthenticationService>();
  final _logger = Logger();

  Future<void> login(String email, String password) async {
    try {
      await _authService.login(email, password);
    } catch (e) {
      _logger.e('Login failed in repository: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
    } catch (e) {
      _logger.e('Logout failed in repository: $e');
      rethrow;
    }
  }

  Future<bool> checkAuthStatus() async {
    try {
      return await _authService.checkAuthStatus();
    } catch (e) {
      _logger.e('Check auth status failed in repository: $e');
      rethrow;
    }
  }

  bool get isAuthenticated => _authService.isAuthenticated;
  String? get currentUserId => _authService.currentUserId;
}
