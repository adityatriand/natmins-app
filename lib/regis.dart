import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/login.dart';
import 'package:toast/toast.dart';

void main() async{
  runApp(RegisPage());
}

class RegisPage extends StatefulWidget{
  _RegisPage createState() => _RegisPage();
}

class _RegisPage extends State<RegisPage> {

  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _regisSave() async {
    var msg = '';
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
      createUserWithEmailAndPassword(email: _email, password: _password
      );
      msg = 'Register Success';
    }catch(e){
      msg = 'Register Fail';
    }
    Toast.show(msg, context);
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (BuildContext context) => LoginPage()));
  }

  Widget _buildButton(){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _regisSave();
                }
              },
              child: Text(
                'REGISTER',
                style: TextStyle(
                    color: Colors.white, letterSpacing: 1.5, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(243, 200, 146, 1)))
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
              },
              child: Text(
                'CANCEL',
                style: TextStyle(
                    color: Color.fromRGBO(179, 179, 179, 1), letterSpacing: 1.5, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(255, 241, 189, 1))),
            ),
          ),
        ]
      )
    );
  }

  Widget _buildEmail(){
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email, color: Color.fromRGBO(243, 200, 146, 1),),
              labelText: 'Email',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color.fromRGBO(243, 200, 146, 1))
              )
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'Enter Email';
            }
          },
          onSaved: (val) => setState(() => _email = val!)
      ),
    );
  }

  Widget _buildPassword(){
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
          obscureText: true,
          keyboardType: TextInputType.text,
          onChanged: (value){

          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(243, 200, 146, 1),),
              labelText: 'Password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Color.fromRGBO(243, 200, 146, 1))
              )
          ),
          validator: (value){
            if(value!.isEmpty){
              return 'Enter Password';
            }
          },
          onSaved: (val) => setState(() => _password = val!)
      ),
    );
  }

  Widget _buildContainer(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          child: Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              // border: Border.all(
              //     color: Colors.black,
              //   width: 4,
              //   style: BorderStyle.solid
              // ),
                borderRadius: BorderRadius.all(
                    Radius.circular(20)
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: const Offset(5.0,5.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0
                  ),
                  BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0,0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0
                  )
                ]
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                          height: 20
                      ),
                      _buildEmail(),
                      _buildPassword()
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'FORM REGISTER ACCOUNT',
                    style: TextStyle(
                        color: Color.fromRGBO(20,99, 86, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ), textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  _buildContainer(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}