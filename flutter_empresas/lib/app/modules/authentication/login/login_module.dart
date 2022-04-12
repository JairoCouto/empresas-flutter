import 'package:flutter_empresas/app/modules/authentication/login/login_store.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => LoginRepository()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
