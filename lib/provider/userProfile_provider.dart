import 'package:flutter/cupertino.dart';
import 'package:task_hugatech/model/userProfile.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:task_hugatech/Services/ApiCall.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profiles extends ChangeNotifier {
  Profile profile;
  List p;
  static const String token = "token";
  String usertoken;
 

  
Future<String> getUserData()async{
      


final shared=await SharedPreferences.getInstance();
usertoken=shared.getString(token);
    

  return shared.getString(token);




}
  
  Future<Profile> getUserProfile() async {
     usertoken=   await getUserData();

    final uri = Uri.parse(userProfileUrl);


    try {
      final value = await http.get(uri,
          headers: {"Content-Type": "application/json", "token": "$usertoken"});
       final pjson = convert.jsonDecode(value.body);

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
