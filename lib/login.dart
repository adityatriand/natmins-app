import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/first.dart';
import 'package:flutter_myapp/regis.dart';
import 'package:toast/toast.dart';

void main () => runApp(
    LoginPage()
);

class LoginPage extends StatefulWidget{
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage>{

  final _formKey = GlobalKey<FormState>();
  late String _email, _password;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void _loginSave() async{
    var msg = '';
    try{
      UserCredential userCredential = await FirebaseAuth.instance.
      signInWithEmailAndPassword(email: _email, password: _password
      );
      msg = 'Login Success';
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyHome()));
    }catch(e){
      msg = 'Email and Password not match';
    }
    Toast.show(msg, context);
  }

  Widget _buildLogo(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Center(
            child: Image(
              image: AssetImage(
                  "images/logo.png",),
              alignment: Alignment.center,
              height: 200,
            )
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
        )
      ],
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

  Widget _buildLogin(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height/20),
          width: 5 * (MediaQuery.of(context).size.width/10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0 ,
            color: Color.fromRGBO(243, 200, 146, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            onPressed: (){
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                _loginSave();

              }
            },
            child: Text(
              'LOGIN',
              style: TextStyle(color:Colors.white,letterSpacing: 1.5, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildRegister(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 20,
          child: FlatButton(
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => RegisPage()));
              },
              child: Text('Register Here !',
                style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(20,99,86,1), decoration: TextDecoration.underline, fontSize: 16),
              )
          ),
        )
      ],
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
                          height: 30
                      ),
                      Text(
                        'FORM ACCOUNT LOGIN',
                        style: TextStyle(
                            color: Color.fromRGBO(20,99, 86, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ), textAlign: TextAlign.center,
                      ),
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
                  _buildLogo(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildContainer(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildLogin(),
                  _buildRegister()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}