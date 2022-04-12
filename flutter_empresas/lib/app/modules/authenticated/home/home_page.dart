import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_empresas/app/modules/authenticated/authenticated_module.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_store.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/pages/detail_company.dart';
import 'package:flutter_empresas/shareds/util/assets_path.dart';
import 'package:flutter_empresas/shareds/util/device_info.dart';
import 'package:flutter_empresas/shareds/widgets/cards/custom_item_list.dart';
import 'package:flutter_empresas/shareds/widgets/textfields/custom_textfield.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {

  static const String routeName = '/home';

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  var listItemEnterprises = <Widget>[];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if(controller.getEnterprisesResponse.isLoading) {
        return Scaffold(
          body: Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(),
            ),
          ),
        );
      }

      if(controller.getEnterprisesResponse.hasError) {
        return Scaffold(
          body: Center(
            child: Text('Ocorreu um erro ao listar as empresas')
          ),
        );
      }

      return Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: Image.asset(AssetsPath.bg_home_full, fit: BoxFit.fill),
                    width: double.infinity,
                    height: Device.height * 0.22,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: Device.height * 0.16),
                    child: CustomTextField(
                      keyboardType: TextInputType.text,
                      height: 48.0,
                      labelText: '',
                      hintColor: Colors.grey,
                      hintText: 'Pesquise por empresa',
                      isPrefixIcon: true,
                      prefixIcon: Icon(Icons.search),
                      controller: controller.searchEnterprise,
                      onChanged: (value) => setState(() {
                        Timer(
                          const Duration(milliseconds: 3000),
                          () {
                            if(value.length >= 3) {
                              controller.listEnterprises();
                            }
                          }
                          
                        );
                      })
                    ),
                  )
                ],
              ),

              SizedBox(height: Device.height * 0.03),

              if(controller.getEnterprisesResponse.isCompleted)

                SingleChildScrollView(
                  child: Column(
                    children: [
                      for(int item = 0; item < controller.getEnterprisesResponse.body!.enterprises!.length ; item++)...[
                        CustomItemList(
                          colorWidget: Color.fromRGBO(121, 187, 202, 5),
                          height: Device.height * 0.18,
                          title: controller.getEnterprisesResponse.body!.enterprises![item].enterpriseName.toString(),
                          imageUrl: controller.getEnterprisesResponse.body!.enterprises![item].photo != null 
                            ? controller.getEnterprisesResponse.body!.enterprises![item].photo.toString()
                            : null,
                          onPressed: () {
                            Modular.to.pushNamed(AuthenticatedModule.routeName + DetailCompany.routeName, arguments: controller.getEnterprisesResponse.body!.enterprises![item].id.toString());
                          },
                        ),

                        SizedBox(height: Device.height * 0.03),
                      ],
                    ],
                  )
                )
            ],
          )
        ),
      );

    });
  }
}