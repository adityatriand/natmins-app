import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() {
  runApp(InsertMedicine());
}

class InsertMedicine extends StatefulWidget {
  _InsertMedicine createState() => _InsertMedicine();
}

class _InsertMedicine extends State<InsertMedicine> {

  final _formKey = GlobalKey<FormState>();
  late String _ItemName, _ItemDesc;

  final notesReference = FirebaseDatabase.instance.reference().child('item');

  Widget Header(){
    return Container(
      child: Text('Insert New Medicine', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
    );
  }

  void AddItem() {
    var msg = '';
    try{
      notesReference.push().set({
        'name': _ItemName,
        'desc': _ItemDesc
      });
      msg = 'Insert Success';
    }catch(e){
      msg = 'Insert Fail';
    }
    Toast.show(msg, context);
  }

  Widget _itemName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Plant Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Color.fromRGBO(243, 200, 146, 1),),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Plant Name';
        }
      },
      onSaved: (val) => setState(() => _ItemName = val!),
    );
  }

  Widget _itemUsability() {
    return TextFormField(
      maxLines: null,
      minLines: 6,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: 'Plant Usability',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: Color.fromRGBO(243, 200, 146, 1),),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter Plant Usability';
        }
      },
      onSaved: (val) => setState(() => _ItemDesc = val!),
    );
  }

  Widget ButtonSave() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.4 * (MediaQuery.of(context).size.height/20),
          width: 5 * (MediaQuery.of(context).size.width/10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Color.fromRGBO(243, 200, 146, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                AddItem();
              }
            },
            child: Text('Save Record',
              style: TextStyle(color: Colors.white, letterSpacing: 1.5, fontSize: MediaQuery.of(context).size.height/40),),
          ),
        ),
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
            padding: EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Header(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _itemName(),
                  SizedBox(
                    height: 20.0,
                  ),
                  _itemUsability(),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonSave(),
                ],
              ),
            ),
          ]
          )
        )
        )
    );
  }
}