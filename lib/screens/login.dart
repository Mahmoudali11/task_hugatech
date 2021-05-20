import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 import 'package:task_hugatech/provider/userlogin_provider.dart';
import 'package:task_hugatech/screens/appNavigation.dart';
 import 'package:task_hugatech/screens/theme/style.dart';
import 'package:task_hugatech/widget/custom_button.dart';
import 'package:task_hugatech/widget/custom_form_filed.dart';
import 'package:task_hugatech/Validation/validation.dart';
 import 'package:task_hugatech/provider/userdata_provider.dart';
 
class LoginScreen extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  TextEditingController emai = TextEditingController();
  TextEditingController password = TextEditingController();

   var currentuser;

  @override
  Widget build(BuildContext context) {
    final userlogins=Provider.of<UserLogins>(context,listen: false);
    final userdata =  Provider.of<UserData>(context,listen: false);
        
    print("loginscreeen");

    return Scaffold(
      body:FutureBuilder<String>(
        future: userdata.getUserData()
        ,
              builder: (context,snapshot){

                if(snapshot.hasData&&snapshot.connectionState==ConnectionState.waiting){
                  print("dsf");
  return Center(child: CircularProgressIndicator(),);

                }


                if(snapshot.hasData){
         return AppNaigation();
    


                }
                if(!snapshot.hasData){
              
              
        return      SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 100),
                      CircleAvatar(
                        child: Image.asset("assets/a.png"),
                        maxRadius: 50,
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).backgroundColor,
                              boxShadow: [BoxShadow(color: Colors.grey)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text(
                                  "Email Address:",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomeFormField(
                                    emai,
                                    false,
                                    "Enterr correct Email!",
                                    "email",
                                    Icons.email,
                                    TextInputType.emailAddress,
                                    Validator.isValidEmail),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17.0, right: 17),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).backgroundColor,
                              boxShadow: [BoxShadow(color: Colors.grey)]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Text(
                                  "Password:",
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomeFormField(
                                    password,
                                    false,
                                    "Enter correct password",
                                    "Password",
                                    Icons.enhanced_encryption,
                                    TextInputType.visiblePassword,
                                    Validator.isValidPassword),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: custmoButton("Login", () async {
                          print(Validator.isValidPassword(password.text));
                          if (formkey.currentState.validate()) {
                              print("press");

                            final respond = await userlogins.tryLogin(
                                emai.text, password.text);
                                print("sdsf");
                            if (respond.success == true) {
                              print("success");

                              await Provider.of<UserData>(context, listen: false)
                                  .saveUserData(respond.data);
                                

                              print(respond.data);
                              final route = MaterialPageRoute(builder: (context) {
                                return AppNaigation(
                                 );
                              });
   
                              Navigator.pushReplacement(context, route);
                              print("to user profile");

                              return;
                            } 
                          }
                        }, context),
                      ),
                     Consumer<UserLogins>(builder: (context,d,w){
                       
                       if(d.userLogin==null){
                     
                         return Text("");
                         }
                         else{
                           return Text(d.userLogin.message,style: TextStyle(color: Colors.red,));
                         }
                       })

                     ,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "SignUp",
                                  style: style1,
                                )),
                            Spacer(),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "ForgetPassword?",
                                  style: style1,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );}}
      )
     );
  }
}
