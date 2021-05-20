import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_hugatech/Services/ApiCall.dart';
import 'dart:convert' as convert;
import 'package:task_hugatech/model/userlogin.dart';
class UserLogins extends ChangeNotifier{
  
UserLogin userLogin;

  Future <UserLogin> tryLogin(String email,String pass) async{
      print("fdsfsdf");

    final body= {
  "email": "$email",
  "password": "$pass"
};
final uri=Uri.parse(loginUrl);

final j=json.encode(body);
try{

  print("fdsfsdf");

    final value= await  http.post(uri,headers: {"Content-Type": "application/json"},body:j);  
     final pjson=convert.jsonDecode(value.body);
    print("dfsd"+value.body);
    
  
    

    
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