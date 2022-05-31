import 'package:flutter/material.dart';

class Note{
  int id;
  String t_name;
  String c_name;
  String why;
  String where;
  String when;
  String how;
  Note({required this.id, required this.t_name, required this.c_name,
    required this.why, required this.where, required this.when, required this.how});
}
String hint ="Enter you answer";
int id =0;
final List<String> noteDescription = [];
final List<String> noteHeading = [];
final List<Note> notes =[];
final List<String> types =[];
final List<Note> co = [];
TextEditingController t_nameController = new TextEditingController();
TextEditingController c_nameController = new TextEditingController();
TextEditingController whyController = new TextEditingController();
TextEditingController whereController = new TextEditingController();
TextEditingController whenController = new TextEditingController();
TextEditingController howController = new TextEditingController();
FocusNode textSecondFocusNode = new FocusNode();

int t_nameMaxLenth = 1;
int c_nameDescriptionMaxLines = 1;
int ansMaxlines = 10;
String deletedNoteHeading = "";
String deletedNoteDescription = "";


List<Color> colors = [Color.fromRGBO(46, 121, 85, 1),Color.fromRGBO(147, 202, 176, 1),Color.fromRGBO(185, 233, 210, 1)];
List <String> table2 = const["Why did you like it?","Where did you see it?","When did you see it?","How much do you like this?"];