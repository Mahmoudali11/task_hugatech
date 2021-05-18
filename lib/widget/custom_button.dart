 
import 'package:flutter/material.dart';

Widget custmoButton(String txt,Function function,BuildContext context){



  return SizedBox(
    height: 40,
      child: ElevatedButton(onPressed:function, child: Text(txt),style:  ElevatedButton.styleFrom(
     primary: Theme.of(context).primaryColor,
 
elevation: 3,
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))


      ),
      
      
      
      ),
  );
}