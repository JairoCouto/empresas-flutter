import 'package:flutter_empresas/shareds/services/env.dart';

class ListEnterprises {
  List<Enterprises>? enterprises;

  ListEnterprises({this.enterprises});

  ListEnterprises.fromJson(Map<String, dynamic> json) {
      if(json['enterprises'] != []) {
        enterprises = <Enterprises> [];

        json['enterprises'].forEach((v) {
          enterprises!.add(new Enterprises.fromJson(v as Map<String, dynamic>));
        });
      } else {
        enterprises = [];
      }
  }
}

class Enterprises {
  int? id;
  String? emailEnterprise;
  String? facebook;
  String? twitter;
  String? linkedin;
  String? phone;
  bool? ownEnterprise;
  String? enterpriseName;
  String? photo;
  String? description;
  String? city;
  String? country;
  int? value;
  double? sharePrice;
  EnterpriseType? enterpriseType;

  Enterprises(
      {this.id,
      this.emailEnterprise,
      this.facebook,
      this.twitter,
      this.linkedin,
      this.phone,
      this.ownEnterprise,
      this.enterpriseName,
      this.photo,
      this.description,
      this.city,
      this.country,
      this.value,
      this.sharePrice,
      this.enterpriseType});

  Enterprises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    emailEnterprise = json['email_enterprise'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    phone = json['phone'];
    ownEnterprise = json['own_enterprise'];
    enterpriseName = json['enterprise_name'];
    photo = json['photo'] != null
      ? photo = Env.baseUrlImage.toString() + json['photo']
      : null;
    description = json['description'];
    city = json['city'];
    country = json['country'];
    value = json['value'];
    sharePrice = json['share_price'];
    enterpriseType = json['enterprise_type'] != null
        ? new EnterpriseType.fromJson(json['enterprise_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email_enterprise'] = this.emailEnterprise;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['phone'] = this.phone;
    data['own_enterprise'] = this.ownEnterprise;
    data['enterprise_name'] = this.enterpriseName;
    data['photo'] = this.photo;
    data['description'] = this.description;
    data['city'] = this.city;
    data['country'] = this.country;
    data['value'] = this.value;
    data['share_price'] = this.sharePrice;
    if (this.enterpriseType != null) {
      data['enterprise_type'] = this.enterpriseType!.toJson();
    }
    return data;
  }
}

class EnterpriseType {
  int? id;
  String? enterpriseTypeName;

  EnterpriseType({this.id, this.enterpriseTypeName});

  EnterpriseType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    enterpriseTypeName = json['enterprise_type_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['enterprise_type_name'] = this.enterpriseTypeName;
    return data;
  }
}