
import 'package:flutter_empresas/shareds/services/env.dart';
import 'package:flutter_empresas/shareds/services/rest_client.dart';

class ApiProvider {
  ApiProvider() {
    restClient = RestClient(Env.baseUrl);
  }
  late RestClient restClient;
}

