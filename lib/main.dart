import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Index());
}

class Index extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white, fontFamily: 'Roboto'),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>{

  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),
        () => Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Image(
                                image: AssetImage(
                                    "images/logo.png"),
                                alignment: Alignment.center,
                                width: 200,
                              )
                          )
                        ]
                      ),
                  ),
                  flex:2,
              ),
              Expanded(
                flex: 1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(20,99, 86, 1)),),
                    Padding(
                      padding: EdgeInsets.only(top:20),
                      child: Text(
                        'welcome on our app',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(179,179,179,1),
                            fontSize: 20
                        )
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

}