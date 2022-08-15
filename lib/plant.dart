import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Plant()
));

class Plant extends StatefulWidget{
  _Plant createState() => _Plant();
}

class _Plant extends State<Plant>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ALL ABOUT MEDICINE PLANTS',
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold)
                        ),
                      ],
                    )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(20),
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
                                                "images/pic_one.png"),
                                            alignment: Alignment.center,
                                          )
                                      ),
                                      SizedBox(
                                          height: 10.0
                                      ),
                                      Text(
                                          'Medical plants will be useful for maternal and child health care, as essential drugs, in food and nutrition, for common illnesses and injury, for endemic infectious diseases, mental health and oral health',
                                      textAlign: TextAlign.justify,)
                                    ]
                                )
                            ),
                          ]
                      )
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('KIND OF MEDICINE PLANTS',
                              style: TextStyle(fontSize: 25,
                                  fontWeight: FontWeight.bold)
                          ),
                        ],
                      )
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                        children: [
                          Expanded(
                            child: Image(image: AssetImage(
                                "images/pic_two.png")),
                          ),
                          SizedBox(
                              width: 10.0
                          ),
                          Expanded(
                            child: Image(image: AssetImage(
                                "images/pic_three.png")),
                          ),
                        ]
                    ),
                  )

                ]
            )
        )
    );
  }
}