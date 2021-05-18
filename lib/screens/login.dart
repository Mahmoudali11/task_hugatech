import 'package:flutter/material.dart';
import 'package:task_hugatech/model/userlogin.dart';
import 'package:task_hugatech/screens/appNavigation.dart';
import 'package:task_hugatech/screens/home.dart';
import 'package:task_hugatech/screens/theme/style.dart';
import 'package:task_hugatech/widget/custom_button.dart';
import 'package:task_hugatech/widget/custom_form_filed.dart';
import 'package:task_hugatech/Validation/validation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey=GlobalKey<FormState>();
  TextEditingController emai=TextEditingController();
  TextEditingController password=TextEditingController();
  static const String em = "email";
static const String pass = "password";
static const String token = "token";
var errMessage;
var currentuser;
@override
void initState() {

      getUserData().then((value){
      currentuser=value;

     if(currentuser!=null){
       print(currentuser);

     setState(() {
       currentuser=currentuser;
     });
// final route=MaterialPageRoute(builder: (context){
//  // return HomeScreen(token: currentuser.toString(),);
//  return AppNaigation(token: currentuser,);
// });

// Navigator.pushReplacement(context, route);
// return;

  

     }

      
      });



  
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body:currentuser==null? SingleChildScrollView(
      child: Form(
      key: formkey,
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
         
        children: [
          SizedBox(height:100),
CircleAvatar(
       child: Image.asset("assets/a.png") ,

        maxRadius: 50,
),
SizedBox(height:30)
,

Padding(
      padding: const EdgeInsets.all(17.0),
      child: Container(
        
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).backgroundColor,
          boxShadow: 
          
          [

            BoxShadow(color:Colors.grey)
          ]
          
          ),
          


          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      Padding(
        padding: const EdgeInsets.only(left: 8,top: 8),
        child: Text("Email Address:",textAlign: TextAlign.left,),
      ),
               Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: CustomeFormField(emai, false, "Enterr correct Email!", "email", Icons.email, TextInputType.emailAddress,Validator.isValidEmail),
               )
             
              ],
            ),
          ),
              ),
              
Padding(
      padding: const EdgeInsets.only(left:17.0,right: 17),
      child: Container(
        
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).backgroundColor,
          boxShadow: 
          
          [

            BoxShadow(color:Colors.grey)
          ]
          
          ),
          


          child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
            children: [
      Padding(
        padding: const EdgeInsets.only(left: 8,top: 8),
        child: Text("Password:",textAlign: TextAlign.left,),
      ),
               Padding(
                 padding: const EdgeInsets.only(left:8.0),
                 child: CustomeFormField(password, false, "Enter correct password", "Password", Icons.enhanced_encryption, TextInputType.visiblePassword,Validator.isValidPassword),
               )
             
              ],
            ),
          ),
              ),
              
              
              


                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: custmoButton("Login", ()async{
print(Validator.isValidPassword(password.text));
                        if(formkey.currentState.validate()){




        final respond= await  UserLogin.tryLogin(emai.text, password.text);




        if(respond["Success"]==true){



   await saveUserData(emai.text, password.text, respond["Data"]);

      
final route=MaterialPageRoute(builder: (context){
  return AppNaigation(token: respond["Data"],);
});

Navigator.pushReplacement(context, route);

   return;
        }
      else{

       errMessage=respond["Message"];
       setState(() {
         
       });

      }

 

                        }




                      }, context),
                ),
            errMessage!=null?    Text('$errMessage',style: TextStyle(color: Colors.red)):Text("")
                ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    TextButton(onPressed: (){


                    }, child: Text("SignUp",style: style1,)
                    ),
                    Spacer(),
                    TextButton(onPressed: (){}, child: Text("ForgetPassword?",style: style1,))




                  ],),
                )

                 ],),
    ),
  ):AppNaigation(token: currentuser),      
              );
            }
      

saveUserData(e,p,t)async{

final shared=await SharedPreferences.getInstance();

shared.setString(em, e);
shared.setString(pass, p);
shared.setString(token, t);




}

Future<String> getUserData()async{

final shared=await SharedPreferences.getInstance();
  return shared.getString(token);




}







          }
          
         