import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_hugatech/Services/ApiCall.dart';
import 'dart:io';
import 'dart:convert' as convert;
class UserLogin{
  


    static tryLogin(String email,String pass) async{
    final body= {
  "email": "$email",
  "password": "$pass"
};
final uri=Uri.parse('https://demo-api.hugatech-dev.com/User/Login');

final j=json.encode(body);
try{

    final value= await  http.post(uri,headers: {"Content-Type": "application/json"},body:j);  
    final sjson=value.body;
    final pjson=convert.jsonDecode(sjson);
    
  
    

    
        if(value.statusCode==200){
      
 return pjson;
       }
       else{
  print(value.statusCode);


         return pjson;
       }}
       catch(p){
         print(p);


       }





  }





}