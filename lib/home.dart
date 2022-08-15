import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatefulWidget{
  _Home createState() => _Home();
}

class _Home extends State<Home>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                  children: [
                                    Center(
                                        child: Image(
                                          image: AssetImage(
                                              "images/logo.png"),
                                          alignment: Alignment.center,
                                          height: 300
                                        )
                                    ),
                                    SizedBox(
                                        height: 30.0
                                    ),
                                    SizedBox(
                                      child: Container(
                                        width: MediaQuery.of(context).size.height * 0.5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color.fromRGBO(243, 200, 146, 1),
                                            width: 4,
                                            style: BorderStyle.solid
                                          ),
                                            color: Color.fromRGBO(255, 241, 189, 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)
                                            ),
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                height: 40
                                            ),
                                            Text(
                                              'ALL ABOUT NATMINS',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold
                                              ), textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                                height: 20
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(15),
                                              child: Text(
                                                'NATMINS is an application that aims to provide information about medicines derived from plants. NATMINS stands for Nature Vitamins',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16
                                                ), textAlign: TextAlign.justify,
                                              ),
                                            )

                                          ],
                                        ),
                                      ),
                                    )
                                  ]
                              )
                          )
                        ]
                    )
                )
              ]
          )
      )
    );
  }
}