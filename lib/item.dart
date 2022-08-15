import 'package:firebase_database/firebase_database.dart';

class Item {
  String _id = '';
  String _name = '';
  String _desc = '';

  Item(this._id, this._name, this._desc);

  Item.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._desc = obj['desc'];
  }

  String get id => _id;
  String get name => _name;
  String get desc => _desc;

  Item.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _name = snapshot.value['name'];
    _desc = snapshot.value['desc'];
  }
}