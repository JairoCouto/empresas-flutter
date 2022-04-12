import 'package:flutter/material.dart';
import 'package:flutter_empresas/app/modules/app_widget.dart';
import 'package:flutter_empresas/app/modules/authentication/authentication_module.dart';
import 'package:flutter_modular/flutter_modular.dart';


void main() {

  runApp(
    ModularApp(
      module: AuthenticationModule(), 
      child: const AppWidget()
    )
  );
}