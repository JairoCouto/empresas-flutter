import 'package:flutter_empresas/models/enterprise.dart';

class Portfolio {
  int? enterprisesNumber;
  List<Enterprises>? enterprises;

  Portfolio({this.enterprisesNumber, this.enterprises});

  Portfolio.fromJson(Map<String, dynamic> json) {
    enterprisesNumber = json['enterprises_number'];
    if (json['enterprises'] != null) {
      enterprises = <Enterprises>[];

      json['enterprises'].forEach((v) {
        enterprises!.add(new Enterprises.fromJson(v as Map<String, dynamic>));
      });
    
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterprises_number'] = this.enterprisesNumber;
    if (this.enterprises != null) {
      data['enterprises'] = this.enterprises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}