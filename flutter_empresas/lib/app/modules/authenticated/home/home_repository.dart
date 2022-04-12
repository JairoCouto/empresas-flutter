import 'package:dio/dio.dart';
import 'package:flutter_empresas/models/enterprise.dart';
import 'package:flutter_empresas/shareds/services/api_provider.dart';
import 'package:flutter_empresas/shareds/services/env.dart';
import 'dart:convert' as convert;

class HomeRepository {
  final ApiProvider apiProvider = new ApiProvider();

  Env env = Env();

  //Função responsável por listar as empresas
  Future<ListEnterprises> getEnterprises(String? name) async {
    try {
      var url = 'enterprises?enterprise_types=2&name=${name.toString()}';

      var response = await apiProvider.restClient.get(url);

      if(response.statusCode != 200 && response.statusCode != 401) {
        response  = convert.jsonDecode(response.body);

        throw (response['errors'][0]);
      }

      if(response.statusCode == 401) {
        response  = convert.jsonDecode(response.body);

        throw ('É necessário refazer o login para continuar com a listagem de empresas.');
      }

      response  = convert.jsonDecode(response.body);

      final request = ListEnterprises.fromJson(response);

      return request;

    } on DioError catch (e) {
      throw Exception('Ocorreu um erro ao carregar a listagem de empresas. Erro: ${e.toString()}');
    }
  }

  //Função responsável por retornar os dados de uma determinada empresa.
  Future<Enterprises> getEnterpriseById(String id) async {
    try {
      
      var url = 'enterprises/${id}';

      var response = await apiProvider.restClient.get(url);

      if(response.statusCode != 200 && response.statusCode != 401) {
        response  = convert.jsonDecode(response.body);

        throw (response['errors'][0]);
      }

      if(response.statusCode == 401) {
        response  = convert.jsonDecode(response.body);

        throw ('É necessário refazer o login para continuar com a listagem de empresas.');
      }

      response  = convert.jsonDecode(response.body);

      final request = Enterprises.fromJson(response['enterprise']);

      return request;

    } on DioError catch (e) {
      throw Exception('Ocorreu um erro ao carregar os dados da empresa. Erro: ${e.toString()}');
    }
  }


}