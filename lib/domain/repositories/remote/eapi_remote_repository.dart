import '../../../data/models/refresh_token.dart';

abstract class EapiRemoteRepository {

  Future<RefreshToken> getNewAccessToken(String refreshToken);

  Future<void> validaToken(String accessToken);
}
