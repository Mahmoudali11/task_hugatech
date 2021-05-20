import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_hugatech/Services/ApiCall.dart';
 import 'dart:convert' as convert;
import 'package:task_hugatech/model/userlogin.dart';
class UserLogins extends ChangeNotifier{
  
UserLogin userLogin;

  Future <UserLogin> tryLogin(String email,String pass) async{
    final body= {
  "email": "$email",
  "password": "$pass"
};
final uri=Uri.parse(loginUrl);

final j=json.encode(body);
try{

    final value= await  http.post(uri,headers: {"Content-Type": "application/json"},body:j);  
    final sjson=value.body;
    final pjson=convert.jsonDecode(sjson);
    
  
    

    
        if(value.statusCode==200){
          userLogin=UserLogin.fromJson(pjson);
      
        }
       else{
userLogin=UserLogin.fromJson(pjson);
  print(value.statusCode);


        }}
       catch(p){
         print("login error:$p");


       }

       notifyListeners();

       return userLogin;

 


  }





}