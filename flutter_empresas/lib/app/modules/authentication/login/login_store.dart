import 'package:flutter/material.dart';
import 'package:flutter_empresas/app/modules/authenticated/authenticated_module.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_page.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_repository.dart';
import 'package:flutter_empresas/models/user_data.dart';
import 'package:flutter_empresas/shareds/services/app_response.dart';
import 'package:flutter_empresas/shareds/session/user_storage.dart';
import 'package:flutter_empresas/shareds/widgets/toats/custom_toast.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  final LoginRepository repository = new LoginRepository();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @observable
  AppResponse<UserData> postLoginResponse = AppResponse();

  @action
  Future<void> sendPostLogin(BuildContext context) async {
    postLoginResponse = AppResponse.loading();

    try {

      if(email.text.isEmpty || password.text.isEmpty) {
        CustomToastMsg(
          errorMsg: 'O campo e-mail e senha são obrigatórios.', 
          duration: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );

        postLoginResponse = AppResponse.error('');
      } else {
        UserData userData =  await repository.postLogin(email.text, password.text);

        postLoginResponse = AppResponse.completed(userData);

        UserStorage.instance.getClient();
        UserStorage.instance.getToken();
        UserStorage.instance.getUid();

        Modular.to.pushReplacementNamed(AuthenticatedModule.routeName + HomePage.routeName);
      }
    
    } catch (e) {

      postLoginResponse = AppResponse.error(e.toString());

      CustomToastMsg(
        errorMsg: e.toString(), 
        duration: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}