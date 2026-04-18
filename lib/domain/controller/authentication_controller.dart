import '../../core/resources/handler_exception.dart';
import '../../data/datasources/remote/http_client.dart';
import '../../data/models/refresh_token.dart';
import '../repositories/remote/eapi_remote_repository.dart';

class AuthenticationController {
  final EapiRemoteRepository _hubapiRemoteRepository;

  AuthenticationController(
    this._hubapiRemoteRepository,
  );

  Future<RefreshToken> refreshToken(String refreshToken) async {
    try {
      return await _hubapiRemoteRepository.getNewAccessToken(refreshToken);
    } on HttpRequestException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthenticatedException.fromHttpException(e);
      }

      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> checkTokenValidity(String accessToken) async {
    try {
      await _hubapiRemoteRepository.validaToken(accessToken);
    } on HttpRequestException catch (e) {
      if (e.response?.statusCode == 401) {
        throw UnauthenticatedException.fromHttpException(e);
      }

      rethrow;
    } catch (_) {
      rethrow;
    }
  }
}
