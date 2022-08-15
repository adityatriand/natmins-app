import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/insert_medicine.dart';
import 'package:flutter_myapp/list_medicine.dart';
import 'package:flutter_myapp/plant.dart';
import 'home.dart';
import 'profile.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyHome(),
));

class MyHome extends StatefulWidget{
  _MyHome createState() => _MyHome();
}

class _MyHome extends State<MyHome>{
  late Widget mainWidget;

  void initState(){
    mainWidget = Home();
    super.initState();
  }

  void dispose(){
    super.dispose();
  }

  _loadingExit(){
    showDialog(context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return Dialog(
            child: Row(
              children: [
                CircularProgressIndicator(),
                Text('Loading')
              ],
            ),
          );
        });
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pop(context);
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(243, 200, 146, 1),
          title: Text('NATMINS')
      ),
      body: Container(
        child: mainWidget,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(243, 200, 146, 1)
              ),
              child: Container(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('images/user_logo.png'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text('Group Garuda',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('garuda@gmail.com',style: TextStyle(fontSize: 12.0),)
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                setState(() {
                  mainWidget = Home();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('User Profile'),
              onTap: (){
                setState(() {
                  mainWidget = Profile();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Plant Info'),
              onTap: (){
                setState(() {
                  mainWidget = Plant();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services),
              title: Text('List Medicine'),
              onTap: (){
                setState(() {
                  mainWidget = ListMedicine();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Insert Medicine'),
              onTap: (){
                setState(() {
                  mainWidget = InsertMedicine();
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: (){
                _loadingExit();
              },
            )
          ],
        ),
      ),
    );
  }
}