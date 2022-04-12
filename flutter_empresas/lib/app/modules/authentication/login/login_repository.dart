import 'package:flutter_empresas/models/user_data.dart';
import 'package:flutter_empresas/shareds/services/api_provider.dart';
import 'package:flutter_empresas/shareds/services/env.dart';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:flutter_empresas/shareds/session/user_storage.dart';

class LoginRepository {
  final ApiProvider apiProvider = new ApiProvider();

  Env env = Env();

  //Função responsável por realizar o login
  Future<UserData> postLogin(String email, String password) async {
    try {
      var url = 'users/auth/sign_in';

      Map<String, String> credentials = {
        "email" : email,
        "password" : password
      };

      var response = await apiProvider.restClient.postWithoutToken(url, body: credentials);

      if(response.statusCode != 200) {
        response  = convert.jsonDecode(response.body);

        throw ('Credenciais Inválidas');
      }

      final headers = convert.jsonDecode(convert.jsonEncode(response.headers)) as Map<String, dynamic>;

      response = convert.jsonDecode(response.body);
 
      final request = UserData.fromJson(response);

      await saveSessionShared(headers['access-token'], headers['client'], headers['uid']);

      return request;

    } on DioError catch (e) {
      throw Exception('Ocorreu um erro ao realizar o login. Erro: ${e.toString()}');
    }
  }

  //Função responsável por gravar os dados na sessão do SharedPreference
  Future<void> saveSessionShared(String accessToken, String client, String uid) async {
    await UserStorage.instance.setToken(accessToken.toString());
    await UserStorage.instance.setClient(client.toString());
    await UserStorage.instance.setUid(uid.toString());
  }
}