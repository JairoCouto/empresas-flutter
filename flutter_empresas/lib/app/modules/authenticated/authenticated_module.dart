import 'package:flutter_empresas/app/modules/authenticated/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthenticatedModule extends Module {

  static const String routeName = '/authenticated-module';

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      HomePage.routeName, child: (_, args) => HomePage(),
      transition: TransitionType.custom
    )
    
  ];

}