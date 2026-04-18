enum EapiRoutes {
  auth,
  associados,
  refreshToken,
  validaToken,
}

class EapiSchema {
  static const String baseUrlProd = 'https://geo.auroraalimentos.com.br';
  static const String baseUrlHomolog =
      'https://geohomolog.auroraalimentos.com.br';

  static const apiToken =
      '3af7de38319b045212e19e7190748f46cc8a61a0691c7ba9a48e38af00b7c6bd';

  static const String _apiEapi = '/cqa/autocontroles';

  static const String _apiUtils = '/app/utils';

  static String get baseUrlEapiProd {
    return 'https://eapi.auroraalimentos.com.br';
  }

  static String get baseUrlEapiHomolog {
    return 'https://eapihomolog.auroraalimentos.com.br';
  }

  static String route(EapiRoutes route, {Map<String, dynamic>? params}) {
    switch (route) {
      case EapiRoutes.auth:
        return '/agroapi/auth/login/';
      case EapiRoutes.associados:
        return '$_apiEapi/agroapi/associados?filiada_id=null';
      case EapiRoutes.refreshToken:
        return '$_apiUtils/v2/refresh/token';
      case EapiRoutes.validaToken:
        return '$_apiUtils/v2/validar/token';
    }
  }
}

/*
enum ApiRoutes {
  auth('/agroapi/auth/login/'),
  associados('/agroapi/associados?filiada_id=null');

  const ApiRoutes(this.value);

  final String value;
}

// Utilização de enum com valores
ApiRoutes.auth.value
 */
