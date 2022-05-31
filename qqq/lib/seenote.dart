
import 'package:flutter/material.dart';
import 'edit.dart';
import 'model.dart';
late Note n;
class NoteseePage extends StatefulWidget {

  int index;
  NoteseePage({required this.index,Key? key,}) : super(key: key);

  @override
  _NoteseePageState createState() => _NoteseePageState(index: index);
}

class _NoteseePageState extends State<NoteseePage> {
  int index;
  _NoteseePageState({required this.index}) ;
  @override
  void initState() {
    super.initState();
    n = notes[index];
    t_nameController.text =n.t_name;
    c_nameController.text =n.c_name;
    whyController.text =n.why;
    whereController.text =n.where;
    whenController.text =n.when;
    howController.text =n.how;
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[2],
      appBar: AppBar(
        title: Text(n.c_name),
        backgroundColor: colors[0],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                for(Note a in notes){
                  if(a.id==n.id){
                    notes.remove(a);
                  }
                }
                Navigator.pop(context);
              },
              child: Icon(
                Icons.delete_rounded,
                size: 26.0,
                color: colors[2],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push( context, MaterialPageRoute( builder: (context) =>
                    EditPage(index: index,)), ).then((value) => setState(() {
                  n = notes[index];
                  t_nameController.text =n.t_name;
                  c_nameController.text =n.c_name;
                  whyController.text =n.why;
                  whereController.text =n.where;
                  whenController.text =n.when;
                  howController.text =n.how;
                }));
              },
              child: Icon(
                Icons.edit,
                size: 26.0,
                color: colors[2],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: colors[0],
                  ),
                  padding: EdgeInsets.all(10.0),
                  child:Column(
                    children:<Widget>[
                      questions(index: 0),
                      SizedBox(height: 10,),
                      answers(tex: whyController,),
                      SizedBox(height: 10,),
                      questions(index: 1),
                      SizedBox(height: 10,),
                      answers(tex: whereController,),
                      SizedBox(height: 10,),
                      questions(index: 2),
                      SizedBox(height: 10,),
                      answers(tex: whenController,),
                      SizedBox(height: 10,),
                      questions(index: 3),
                      SizedBox(height: 10,),
                      answers(tex: howController,),
                    ],
                  )
              )
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ),
    );
  }
}
class questions extends StatelessWidget{
  int index;
  questions({Key? key,required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      child: Text(table2[index],style: TextStyle(
        fontSize: 25,
        color: colors[2],
        fontWeight: FontWeight.bold,
      ),),
    );
  }
}
class answers extends StatelessWidget{
  TextEditingController tex;
  answers({required this.tex,Key? key}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      decoration: BoxDecoration(
        color: colors[1],
        borderRadius:  BorderRadius.circular(32),
      ),
      padding: EdgeInsets.all(10.0),
      child: TextField(
        controller: tex,
        enabled: false,
        style: TextStyle(fontSize: 20,color: colors[0]),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
