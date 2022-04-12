import 'package:flutter_empresas/app/modules/authenticated/authenticated_module.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_module.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_page.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_repository.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_store.dart';
import 'package:flutter_empresas/app/modules/authentication/splash/splash.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticationModule extends Module {

  static const String routeName = '/app-module';
  
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind.lazySingleton((i) => LoginRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashScreen()),
    ChildRoute(LoginPage.routeName, child: (_, args) => const LoginPage()),

    ModuleRoute(AuthenticatedModule.routeName, module: HomeModule())
    

  ];

}