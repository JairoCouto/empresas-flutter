class Env {
  static bool debug = false;

  static String _productionBaseUrl = 'https://empresas.ioasys.com.br/api/v1/';

  static String _developerBaseUrl = 'https://empresas.ioasys.com.br/api/v1/';

  static String get baseUrl => debug ? _developerBaseUrl : _productionBaseUrl;

  static String _productionBaseUrlImage = 'https://empresas.ioasys.com.br';

  static String _developerBaseUrlImage = 'https://empresas.ioasys.com.br';

  static String get baseUrlImage => debug ? _developerBaseUrlImage : _productionBaseUrlImage;


}