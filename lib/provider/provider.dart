import 'package:flutter/cupertino.dart';
import 'package:statemanagement_program/model/modellist/notemodel.dart';

class Notesprovider with  ChangeNotifier{
List<Notemodel>Note=[];
void addNote(Notemodel notes){
  Note.add(notes);
  notifyListeners();
}

void removeNote(Notemodel logout){
  Note.remove(logout);
  notifyListeners();

}

}