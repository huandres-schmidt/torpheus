abstract class PreferencesLocalRepository {
  String? getAccessToken();

  String? getRefreshToken();

  Future<void> removeAccessToken();

  Future<void> removeRefreshToken();

  Future<void> saveAccessToken(String acessToken);

  Future<void> saveRefreshToken(String refreshToken);
}
