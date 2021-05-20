import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Profile {
  Data data;
  String message;
  bool success;

  Profile({this.data, this.message, this.success});

  Profile.fromJson(Map<String, dynamic> json) {
    data = json['Data'] != null ? new Data.fromJson(json['Data']) : null;
    message = json['Message'];
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data.toJson();
    }
    data['Message'] = this.message;
    data['Success'] = this.success;
    return data;
  }
}

class Data {
  String name;
  String avatar;
  String jobTitle;
  double income;
  double expenses;
  double loan;
  Overview overview;

  Data(
      {this.name,
      this.avatar,
      this.jobTitle,
      this.income,
      this.expenses,
      this.loan,
      this.overview});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    avatar = json['Avatar'];
    jobTitle = json['JobTitle'];
    income = json['Income'];
    expenses = json['Expenses'];
    loan = json['Loan'];
    overview = json['Overview'] != null
        ? new Overview.fromJson(json['Overview'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Avatar'] = this.avatar;
    data['JobTitle'] = this.jobTitle;
    data['Income'] = this.income;
    data['Expenses'] = this.expenses;
    data['Loan'] = this.loan;
    if (this.overview != null) {
      data['Overview'] = this.overview.toJson();
    }
    return data;
  }
}

class Overview {
  String date;
  List<OverviewList> overviewList;

  Overview({this.date, this.overviewList});

  Overview.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    if (json['OverviewList'] != null) {
      overviewList = [];
      json['OverviewList'].forEach((v) {
        overviewList.add(new OverviewList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    if (this.overviewList != null) {
      data['OverviewList'] = this.overviewList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OverviewList {
  String type;
  String description;
  double amount;
  String icon;

  OverviewList({this.type, this.description, this.amount, this.icon});

  OverviewList.fromJson(Map<String, dynamic> json) {
    type = json['Type'];
    description = json['Description'];
    amount = json['Amount'];
    icon = json['Icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Type'] = this.type;
    data['Description'] = this.description;
    data['Amount'] = this.amount;
    data['Icon'] = this.icon;
    return data;
  }
}
