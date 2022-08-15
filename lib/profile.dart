import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Profile()
));

class Profile extends StatefulWidget{
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('Our Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/user_logo_2.png'),
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            Text('Group Garuda',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('garuda@gmail.com',style: TextStyle(fontSize: 18.0),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Tim Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Aditya Tri Ananda || E00200',style: TextStyle(fontSize: 18.0),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('M. Furqan Nazuli || E00201',style: TextStyle(fontSize: 18.0),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('Iqbal Fanosa Wiotama || E00197',style: TextStyle(fontSize: 18.0),)
                ]
            )
        )
    );
  }

}