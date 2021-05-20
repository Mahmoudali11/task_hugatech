import 'package:flutter/cupertino.dart';
import 'package:task_hugatech/model/userProfile.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:task_hugatech/Services/ApiCall.dart';

class Profiles extends ChangeNotifier {
  Profile profile;
  List p;
  Future<Profile> getUserProfile(String token) async {
    final uri = Uri.parse(userProfileUrl);

    try {
      final value = await http.get(uri,
          headers: {"Content-Type": "application/json", "token": "$token"});
      final sjson = value.body;
      final pjson = convert.jsonDecode(sjson);

      if (value.statusCode == 200) {
        profile = Profile.fromJson(pjson);

        return profile;
      } else {
        print(value.statusCode);

        return pjson;
      }
    } catch (p) {
      print(p);
    }
    return profile;
  }
}
