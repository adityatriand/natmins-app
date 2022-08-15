import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/item.dart';

void main() {
  runApp(ListMedicine());
}

class ListMedicine extends StatefulWidget {
  _ListMedicine createState() => new _ListMedicine();
}

final notesReference = FirebaseDatabase.instance.reference().child('item');

class _ListMedicine extends State<ListMedicine> {

  final _formKey = GlobalKey<FormState>();
  late List<Item> items;
  late StreamSubscription<Event> _onNoteAddedSubscription;
  late StreamSubscription<Event> _onNoteChangedSubscription;

  late TextEditingController _name, _desc;
  late String _txtname, _txtdesc;

  @override
  void initState() {
    super.initState();
    items = [];
    _onNoteAddedSubscription = notesReference.onChildAdded.listen(_onNoteAdded);
    _onNoteChangedSubscription = notesReference.onChildChanged.listen(_updateItem);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  void _onNoteAdded(Event event) {
    setState(() {
      items.add(new Item.fromSnapshot(event.snapshot));
    });
  }

  void _updateItem(Event event) {
    var oldValue = items.singleWhere((item) => item.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldValue)] = new Item.fromSnapshot(event.snapshot);
    });
  }

  void _saveItem (String value1, String value2, Item item, int position) {
    notesReference.child(item.id).set({
      'name': value1,
      'desc': value2
    }).then((_) {
      Navigator.pop(context);
    });
    notesReference.onChildChanged.listen(_updateItem);
  }

  void _editItem(String name, String price, Item item, int position) {
    showDialog(
        context: context, barrierDismissible: false,
        builder: (BuildContext context) {
          return Form(
            key: _formKey,
            child: AlertDialog(
              title: Text('Update Record'),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: name,
                      decoration: InputDecoration(
                        labelText: 'Plant Name',
                      ),
                      onSaved: (val) => setState(() => _txtname = val!),
                    ),
                    TextFormField(
                      initialValue: price,
                      decoration: InputDecoration(
                        labelText: 'Plant Usability',
                      ),
                      onSaved: (val) => setState(() => _txtdesc = val!),
                    ),
                  ],
                ),
              ),
              actions: [
                FlatButton(
                  child: Text('Save'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _saveItem(_txtname, _txtdesc, items[position], position);
                    }
                  },
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
    );
  }

  void _deleteItem(BuildContext context, Item item, int position) async {
    await notesReference.child(item.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: items.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position) {
          return Column(
            children: [
              Divider(height: 5.0),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${items[position].name}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        Text(
                          '${items[position].desc}',
                          style: new TextStyle(
                            fontSize: 15.0
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.yellow,),
                          onPressed: () {
                            _editItem(items[position].name, items[position].desc, items[position], position);
                          },
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red,),
                          onPressed: () {
                            _deleteItem(context, items[position],position);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}