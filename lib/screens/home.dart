import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task_hugatech/model/userProfile.dart';
import 'package:task_hugatech/screens/theme/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  String token;
  HomeScreen({this.token});
  
  @override
  _HomeScreenState createState() => _HomeScreenState(this.token);
}

class _HomeScreenState extends State<HomeScreen> {
  String token;
  _HomeScreenState(this.token);
  Profiles profiles = Profiles();
  
Future<String> getUserData()async{

final shared=await SharedPreferences.getInstance();
  return shared.getString(token);




}

  @override
  void initState() {
     
   

    super.initState();
  }
@override
  void didChangeDependencies() async{

   await  getUserData().then((value){
      token=value;
         token=token;
     });
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Profile>(
            future: profiles.getUserProfile(token),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting||!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
             

              if (snapshot.hasData) {
                final data = snapshot.data.data;

                return SingleChildScrollView(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            width: w * .9,
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Theme.of(context).backgroundColor,
                            ),
                            child:Padding(
                              padding: EdgeInsets.only(bottom:20),
                                                          child: Stack(
                                children: [
                                  Positioned(
                                      left: 20,
                                      top: 10,
                                      child: IconButton(
                                        icon: Icon(Icons.list),
                                        onPressed: () {},
                                      )),
                                  Positioned(
                                      right: 20,
                                      top: 10,
                                      child: IconButton(
                                        icon: Icon(Icons.list),
                                        onPressed: () {},
                                      )),
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                         SizedBox(height:30),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              snapshot.data.data.avatar),
                                          maxRadius: 40,
                                        ),
                                        Text(
                                          data.name,
                                          style: TextStyle(
                                              color:
                                                  Theme.of(context).primaryColor,
                                              fontSize: 20,fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          data.jobTitle,
                                          style: TextStyle(
                                            fontSize: 17
                                           ),
                                        ),
                                       SizedBox(height: 40,),
                                        Row(
                                       mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              ("\$"+"${data.income}"),
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context).primaryColor,
                                                    fontSize: 20
                                              ),
                                            ),
                                            Text("Income")
                                          ],
                                        ),
 Padding(
  padding: const EdgeInsets.only(left:8.0,right: 8),
  child:   Container(
  
    width: 1,
  
    height: 70,
  
    color: Colors.grey,
  
  ),
),                                        
                                         Column(
                                          children: [
                                            Text(
                                              ("\$"+"${data.expenses}"),
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context).primaryColor,
                                                    fontSize: 20
                                              ),
                                            ),
                                            Text("Express")
                                          ],
                                        ),
Padding(
  padding: const EdgeInsets.only(left:8.0,right: 8),
  child:   Container(
  
    width: 1,
  
    height: 70,
  
    color: Colors.grey,
  
  ),
),
                                         Column(
                                          children: [
                                            Text(
                                              ("\$"+"${data.loan}"),
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context).primaryColor,
                                                    fontSize: 20
                                              ),
                                            ),
                                            Text("Loan")
                                          ],
                                        ),
                                        

                                      ],
                                    ),
                                      ],
                                    ),
                                  ),
                                  
                                ],
                              ),
                            )),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                              children: [
                                 Text(
                                            "Overview",
                                            style: TextStyle(
                                                color:
                                                    Theme.of(context).primaryColor,
                                                fontSize: 20,fontWeight: FontWeight.bold),
                                          ),
                                          Icon(Icons.notifications)
                                          ,Spacer(),Text(data.overview.date.split(":")[0].toString())

                              ],

                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                                                                ,color: Colors.white
                                                                
                                                                
                                                                ),

                                                            child: ListTile(
                                  leading: Container(width: 50,height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).scaffoldBackgroundColor
                                  )
                                  ,child: Image.network(data.overview.overviewList[0].icon)),
                                  title: Text(data.overview.overviewList[0].type,style: style1.copyWith(fontWeight: FontWeight.bold),),
                                  subtitle: Text(data.overview.overviewList[0].description),
                                  trailing: Text("\$"+data.overview.overviewList[0].amount.toString()),

                                ),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                                                                ,color: Colors.white
                                                                
                                                                
                                                                ),

                                                            child: ListTile(
                                  leading: Container(width: 50,height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).scaffoldBackgroundColor
                                  )
                                  ,child: Image.network(data.overview.overviewList[1].icon)),
                                  title: Text(data.overview.overviewList[1].type,style: style1.copyWith(fontWeight: FontWeight.bold),),
                                  subtitle: Text(data.overview.overviewList[1].description),
                                  trailing: Text("\$"+data.overview.overviewList[1].amount.toString()),

                                ),
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)
                                                                ,color: Colors.white
                                                                
                                                                
                                                                ),

                                                            child: ListTile(
                                  leading: Container(width: 50,height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                  color: Theme.of(context).scaffoldBackgroundColor
                                  )
                                  ,child: Image.network(data.overview.overviewList[2].icon)),
                                  title: Text(data.overview.overviewList[2].type,style: style1.copyWith(fontWeight: FontWeight.bold),),
                                  subtitle: Text(data.overview.overviewList[2].description),
                                  trailing: Text("\$"+data.overview.overviewList[2].amount.toString()),

                                ),
                              ),
                            )



                      ],
                    ),
                  ),
                );
              }
            }),
      ),


    );
  }
}
