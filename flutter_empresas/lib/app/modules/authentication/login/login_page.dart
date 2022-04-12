import 'package:flutter/material.dart';
import 'package:flutter_empresas/app/modules/authentication/login/login_store.dart';
import 'package:flutter_empresas/shareds/util/assets_path.dart';
import 'package:flutter_empresas/shareds/util/device_info.dart';
import 'package:flutter_empresas/shareds/widgets/buttons/custom_button.dart';
import 'package:flutter_empresas/shareds/widgets/curves/custom_clipper.dart';
import 'package:flutter_empresas/shareds/widgets/textfields/custom_textfield.dart';
import 'package:flutter_empresas/shareds/widgets/textfields/custom_textfield_password.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  final String title;
  const LoginPage({Key? key, this.title = 'Login'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();

}
class LoginPageState extends ModularState<LoginPage, LoginStore> {

  @override
  void initState() {

    super.initState();
  }

  bool _keyboardIsVisible() {
    return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
  }

  @override
  Widget build(BuildContext context) {
    Device.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    child: ClipPath(
                    clipper: CurveClipperLogin(),
                    child: Image.asset(AssetsPath.bg_splash, fit: BoxFit.fill),
                  ),
                  width: double.infinity,
                  height: Device.height * 0.5,
                ),
                
                
                Column(
                  children: [
                    SizedBox(height: Device.height * 0.03, child: Image.asset(AssetsPath.logo_home)),
                    SizedBox(height: Device.height * 0.01),

                    _keyboardIsVisible() ? 
                      Text('')
                      : Text('Seja bem vindo ao empresas!', style: TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: 'Quicksand'))
                  ],
                )
              ],
            ),

            /*
            AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              height: _keyboardIsVisible() ? 140.0 : 240.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsPath.background_login),
                  fit: BoxFit.cover
                ),
              )
              
            ),
            */
            

            Form(
              child: Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      SizedBox(height: Device.height * 0.02),

                      CustomTextField(
                        height: 48.0,
                        hintText: '',
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.email,
                      ),

                      SizedBox(height: Device.height * 0.01),

                      CustomTextFieldPassword(
                        obscureText: true,
                        height: 48.0,
                        hintText: '',
                        labelText: 'Senha',
                        keyboardType: TextInputType.text,
                        controller: controller.password,
                      ),

                      SizedBox(height: Device.height * 0.02),

                      CustomButton(
                        borderRadius: 8.0,
                        buttonColor: Color.fromRGBO(244, 30, 105, 1),
                        title: 'ENTRAR', 
                        onPressed: () {

                          controller.sendPostLogin(context);

                          //Modular.to.pushReplacementNamed(AuthenticatedModule.routeName + HomePage.routeName);
                        }
                      )
                    ],
                  ),
                );
              })
              
            )
          ],
        )
      ),
    );
  }
}
