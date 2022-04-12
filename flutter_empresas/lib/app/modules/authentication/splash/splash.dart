import 'package:flutter/material.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_page.dart';
import 'package:flutter_empresas/shareds/util/assets_path.dart';
import 'package:flutter_empresas/shareds/util/device_info.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = '/';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Future.delayed(const Duration(seconds: 4),
      () => Modular.to.pushReplacementNamed(LoginPage.routeName)
    );
  }

  @override
  Widget build(BuildContext context) {
    Device.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Image.asset(AssetsPath.bg_splash, fit: BoxFit.fill),
              width: double.infinity,
              height: Device.height,
            ),

            SizedBox(height: Device.height * 0.05, child: Image.asset(AssetsPath.bg_logo_all)),
          ],
        )
      ),
    );
  }
}