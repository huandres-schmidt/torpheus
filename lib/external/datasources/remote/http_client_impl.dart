import 'package:dio/dio.dart';

import '../../../config/flavor.dart';
import '../../../data/datasources/remote/http_client.dart';
import 'interceptors/api_interceptor.dart';
import 'interceptors/log_interceptor.dart';

class HttpClientImpl implements HttpClient {
  HttpClientImpl() {
    client.interceptors.addAll([
      ApiInterceptor(client),
      LogApiInterceptor(),
    ]);
  }

  @override
  Dio client = _initClient();

  static Dio _initClient() {
    return Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        // headers: {'X-API-KEY': EapiSchema.apiToken},
        baseUrl: FlavorConfig.baseUrlEapi(),
      ),
    );
  }
}
