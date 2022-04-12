import 'package:flutter_empresas/app/modules/authenticated/home/home_page.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_store.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_repository.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/pages/detail_company.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {

  static const String routeName = '/home-module';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => HomeRepository()),
  ];

  @override
  final List<ModularRoute> routes = [

    ChildRoute(HomePage.routeName, child: (_, args) => const HomePage()),

    ChildRoute(DetailCompany.routeName, child: (_, args) => DetailCompany(args.data)),
  ];
}
