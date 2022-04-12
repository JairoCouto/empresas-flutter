// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$getEnterprisesResponseAtom =
      Atom(name: '_HomeStoreBase.getEnterprisesResponse');

  @override
  AppResponse<ListEnterprises> get getEnterprisesResponse {
    _$getEnterprisesResponseAtom.reportRead();
    return super.getEnterprisesResponse;
  }

  @override
  set getEnterprisesResponse(AppResponse<ListEnterprises> value) {
    _$getEnterprisesResponseAtom
        .reportWrite(value, super.getEnterprisesResponse, () {
      super.getEnterprisesResponse = value;
    });
  }

  final _$getEnterpriseByIdResponseAtom =
      Atom(name: '_HomeStoreBase.getEnterpriseByIdResponse');

  @override
  AppResponse<Enterprises> get getEnterpriseByIdResponse {
    _$getEnterpriseByIdResponseAtom.reportRead();
    return super.getEnterpriseByIdResponse;
  }

  @override
  set getEnterpriseByIdResponse(AppResponse<Enterprises> value) {
    _$getEnterpriseByIdResponseAtom
        .reportWrite(value, super.getEnterpriseByIdResponse, () {
      super.getEnterpriseByIdResponse = value;
    });
  }

  final _$listEnterprisesAsyncAction =
      AsyncAction('_HomeStoreBase.listEnterprises');

  @override
  Future<void> listEnterprises() {
    return _$listEnterprisesAsyncAction.run(() => super.listEnterprises());
  }

  final _$getEnterpriseAsyncAction =
      AsyncAction('_HomeStoreBase.getEnterprise');

  @override
  Future<void> getEnterprise(String id) {
    return _$getEnterpriseAsyncAction.run(() => super.getEnterprise(id));
  }

  @override
  String toString() {
    return '''
getEnterprisesResponse: ${getEnterprisesResponse},
getEnterpriseByIdResponse: ${getEnterpriseByIdResponse}
    ''';
  }
}
