import 'package:flutter/cupertino.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_repository.dart';
import 'package:flutter_empresas/models/enterprise.dart';
import 'package:flutter_empresas/shareds/services/app_response.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;
abstract class _HomeStoreBase with Store {

  final HomeRepository repository = new HomeRepository();

  TextEditingController searchEnterprise = TextEditingController();

  @observable
  AppResponse<ListEnterprises> getEnterprisesResponse = AppResponse();

  @action
  Future<void> listEnterprises() async {
    getEnterprisesResponse = AppResponse.loading();

    try {
      ListEnterprises enterprises = await repository.getEnterprises(searchEnterprise.text);

      getEnterprisesResponse = AppResponse.completed(enterprises);

    } catch (e) {
      getEnterprisesResponse = AppResponse.error(e.toString());
    }

  }

  @observable
  AppResponse<Enterprises> getEnterpriseByIdResponse = AppResponse();

  @action
  Future<void> getEnterprise(String id) async {
    getEnterpriseByIdResponse = AppResponse.loading();

    try {
      Enterprises enterprise = await repository.getEnterpriseById(id);

      getEnterpriseByIdResponse = AppResponse.completed(enterprise);

    } catch (e) {
      getEnterprisesResponse = AppResponse.error(e.toString());
    }
  }


}