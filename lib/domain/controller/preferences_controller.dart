

import '../../core/resources/handler_exception.dart';
import '../repositories/preferenfeces/preferences_local_repository.dart';

class PreferencesController {



  PreferencesController(this._preferencesLocalRepository);

  late final PreferencesLocalRepository _preferencesLocalRepository;

  String? getAccessToken() {
    return _preferencesLocalRepository.getAccessToken();
  }

  Future<void> saveAccessToken(String acessToken) async {
    await _preferencesLocalRepository.saveAccessToken(acessToken);
  }

  Future<void> removeAccessToken() async {
    await _preferencesLocalRepository.removeAccessToken();
  }

  String? getRefreshToken() {
    return _preferencesLocalRepository.getRefreshToken();
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await _preferencesLocalRepository.saveRefreshToken(refreshToken);
  }

  Future<void> removeRefreshToken() async {
    await _preferencesLocalRepository.removeRefreshToken();
  }

  String isTokenValid(String? token) {
    if (token == null) {
      throw UnauthenticatedException();
    }

    return token;
  }
}
