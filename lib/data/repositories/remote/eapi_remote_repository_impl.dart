import 'package:dio/dio.dart';

import '../../../config/eapi_schema.dart';
import '../../../core/resources/base_remote_data_source.dart';
import '../../../domain/repositories/remote/eapi_remote_repository.dart';
import '../../datasources/remote/http_client.dart';
import '../../models/refresh_token.dart';

class EapiRemoteRepositoryImpl extends BaseRemoteDataSource
    implements EapiRemoteRepository {
  EapiRemoteRepositoryImpl(super.httpClient);


  @override
  Future<RefreshToken> getNewAccessToken(String refreshToken) async {
    final String titleMessage = 'Não foi possível atualizar a autenticação';

    final rota = EapiSchema.route(EapiRoutes.refreshToken);

    return await get(
      path: rota,
      titleMessage: titleMessage,
      customHeader: bearerHeader(refreshToken),
      response: (res) {
        if (res.statusCode == 200) {
          return RefreshToken.fromJson(res.data);
        } else {
          final title = requestErrorTitle(titleMessage, res.requestOptions);
          throw HttpRequestException(
            response: res,
            titleMessage: title,
            infoMessage: statusCodeUnexpected,
          );
        }
      },
    );
  }

  @override
  Future<void> validaToken(String accessToken) async {
    final String titleMessage = 'Não foi possível validar a autenticação';

    final rota = EapiSchema.route(EapiRoutes.validaToken);

    return await get(
      path: rota,
      titleMessage: titleMessage,
      customHeader: bearerHeader(accessToken),
      responseType: ResponseType.json,
      response: (res) {
        if (res.statusCode != 200) {
          final title = requestErrorTitle(titleMessage, res.requestOptions);
          throw HttpRequestException(
            response: res,
            titleMessage: title,
            infoMessage: statusCodeUnexpected,
          );
        }
      },
    );
  }
}
