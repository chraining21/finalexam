
import 'package:flutter/material.dart';
import 'model.dart';

class EditPage extends StatefulWidget {
  int index;
  EditPage({required this.index, Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState(index: index);
}

class _EditPageState extends State<EditPage> {
  int index;
  _EditPageState({required this.index, });
  @override
  void initState() {
    super.initState();
    t_nameController.text=notes[index].t_name;
    c_nameController.text=notes[index].c_name;
    whyController.text=notes[index].why;
    whereController.text=notes[index].where;
    whenController.text=notes[index].when;
    howController.text=notes[index].how;
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
        title: Text("Add note"),
        backgroundColor: colors[0],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  var note_ = Note(id: notes[index].id,
                      t_name: t_nameController.text,
                      c_name: c_nameController.text,
                      why: whyController.text,
                      where: whereController.text,
                      when: whenController.text,
                      how: howController.text);
                  t_nameController.clear();
                  c_nameController.clear();
                  whyController.clear();
                  whereController.clear();
                  whenController.clear();
                  howController.clear();
                  notes[index] = note_;
                });
                Navigator.pop(context);
              },
              child: Icon(
                Icons.save_rounded,
                size: 26.0,
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
              answers(tex: t_nameController,str: "Enter the Type",),
              SizedBox(height: 10,),
              answers(tex: c_nameController,str: "Enter the Name",),
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
                      answers(tex: whyController,str: hint,),
                      SizedBox(height: 10,),
                      questions(index: 1),
                      SizedBox(height: 10,),
                      answers(tex: whereController,str: hint,),
                      SizedBox(height: 10,),
                      questions(index: 2),
                      SizedBox(height: 10,),
                      answers(tex: whenController,str: hint,),
                      SizedBox(height: 10,),
                      questions(index: 3),
                      SizedBox(height: 10,),
                      answers(tex: howController,str: hint,),
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
  String str;
  answers({required this.tex,Key? key,required this.str}): super(key: key);
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
        style: TextStyle(fontSize: 20,color: colors[0]),
        maxLines: null,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 20),
          hintText: str,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}