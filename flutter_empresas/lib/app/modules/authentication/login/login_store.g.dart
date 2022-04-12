// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$postLoginResponseAtom =
      Atom(name: '_LoginStoreBase.postLoginResponse');

  @override
  AppResponse<UserData> get postLoginResponse {
    _$postLoginResponseAtom.reportRead();
    return super.postLoginResponse;
  }

  @override
  set postLoginResponse(AppResponse<UserData> value) {
    _$postLoginResponseAtom.reportWrite(value, super.postLoginResponse, () {
      super.postLoginResponse = value;
    });
  }

  final _$sendPostLoginAsyncAction =
      AsyncAction('_LoginStoreBase.sendPostLogin');

  @override
  Future<void> sendPostLogin(BuildContext context) {
    return _$sendPostLoginAsyncAction.run(() => super.sendPostLogin(context));
  }

  @override
  String toString() {
    return '''
postLoginResponse: ${postLoginResponse}
    ''';
  }
}
