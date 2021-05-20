import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserData extends ChangeNotifier {

static const String token = "token";

  saveUserData(t)async{

final shared=await SharedPreferences.getInstance();
 
shared.setString(token, t);

  //notifyListeners();


}

Future<String> getUserData()async{

final shared=await SharedPreferences.getInstance();


  return shared.getString(token);




}

}