import 'package:flutter_empresas/models/enterprise.dart';
import 'package:flutter_empresas/models/investor.dart';

class UserData {
  Investor? investor;
  Enterprises? enterprise;
  bool? success;

  UserData({this.investor, this.enterprise, this.success});

  UserData.fromJson(Map<String, dynamic> json) {
    investor = json['investor'] != null
        ? new Investor.fromJson(json['investor'])
        : null;
    enterprise = json['enterprise'] != null
        ? new Enterprises.fromJson(json['enterprise'])
        : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.investor != null) {
      data['investor'] = this.investor!.toJson();
    }
    data['enterprise'] = this.enterprise;
    data['success'] = this.success;
    return data;
  }
}