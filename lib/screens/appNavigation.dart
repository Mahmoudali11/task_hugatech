 

import 'package:flutter/material.dart';
import 'package:task_hugatech/screens/home.dart';

 

/// This is the stateful widget that the main application instantiates.
class AppNaigation extends StatefulWidget {
  String token;
 AppNaigation({this.token});
 
  @override
  State<AppNaigation > createState() => _AppNaigationState(this.token);
}

 class _AppNaigationState extends State<AppNaigation > {
   String token;
  int _selectedIndex = 0;
  _AppNaigationState(this.token);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      
  static List<Widget> _widgetOptions = [];
  @override
  void initState() {
    _widgetOptions=<Widget>[
  HomeScreen(token: token,),
  Text(""),
  Text(""),
  Text(""),
  Text(""),
 
  

   
  ];;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black87,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
           ),
          
          
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chating',
           ),
            BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
           ),
            BottomNavigationBarItem(
            icon: Icon(Icons.money_off_csred_sharp),
            label: 'Chating',
           ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
           ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap:(v){
          _onItemTapped(v);

        },
      ),
    );
  }
}
