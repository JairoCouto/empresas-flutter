import 'package:flutter/material.dart';
import 'package:flutter_empresas/app/modules/authenticated/home/home_store.dart';
import 'package:flutter_empresas/shareds/util/device_info.dart';
import 'package:flutter_empresas/shareds/widgets/cards/custom_item_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DetailCompany extends StatefulWidget {

  static const String routeName = '/detail-company';
  final dynamic id;

  const DetailCompany(this.id, { Key? key }) : super(key: key);

  @override
  State<DetailCompany> createState() => _DetailCompanyState();
}

class _DetailCompanyState extends ModularState<DetailCompany, HomeStore> {

  @override
  void initState() {
    super.initState();
    print(widget.id.toString());
    
    controller.getEnterprise(widget.id.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if(controller.getEnterpriseByIdResponse.isLoading) {
        return Scaffold(
          body: Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(),
              ),
            )
        );
      }

      if(controller.getEnterpriseByIdResponse.hasError) {
        return Scaffold(
          body: Center(
              child: Text('Ocorreu um erro ao carregar os dados da empresa.')
            )
        );
      }

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Center(
            child: Text(controller.getEnterpriseByIdResponse.body!.enterpriseName.toString(), style: TextStyle(color: Colors.black)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: Device.height * 0.001),

              CustomItemList(
                colorWidget: Color.fromRGBO(121, 187, 202, 1),
                marginSymetricHoriz: 0.0,
                height: Device.height * 0.18,
                imageUrl: controller.getEnterpriseByIdResponse.body!.photo != null 
                          ? controller.getEnterpriseByIdResponse.body!.photo.toString()
                          : null,
                title: controller.getEnterpriseByIdResponse.body!.enterpriseName.toString(),
                onPressed: () {},
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 18.0, fontFamily: 'Quicksand'),
                        text:  controller.getEnterpriseByIdResponse.body!.description.toString()
                      )
                    ]
                  )
                ),
              )
            ],
    
          )
        
        )
      );
  
    });

  }
}