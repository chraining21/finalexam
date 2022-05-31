import 'package:flutter/material.dart';
import 'package:qqq/notearea.dart';
import 'package:qqq/seenote.dart';
import 'model.dart';
String cont = "";
class DNoteslist extends StatefulWidget {
  String con;
  DNoteslist({required this.con,Key? key}) : super(key: key);

  @override
  _DNoteslistState createState() => _DNoteslistState(con: con);
}

class _DNoteslistState extends State<DNoteslist> {
  String con;
  _DNoteslistState({required this.con});
  @override
  void initState() {
    co.clear();
    super.initState();
    cont = this.con;
    for(Note n in notes){
      if(n.t_name==this.con){
        co.add(n);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("$con List",style: TextStyle(fontSize: 25,color: colors[2]),),
        backgroundColor: colors[0],
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push( context, MaterialPageRoute( builder: (context) =>
                      NotesPage()), ).then((value) => setState(() {
                    co.clear();
                    for(Note n in notes){
                      if(n.t_name==this.con && !co.contains(n)){
                        co.add(n);
                      }
                    }
                  }));

                },
                child: Icon(
                  Icons.add,
                  size: 26.0,
                  color: colors[2],
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                 setState(() {
                    co.clear();
                    for(Note n in notes){
                      if(n.t_name==this.con && !co.contains(n)){
                        co.add(n);
                      }
                    }
                  });
                },
                child: Icon(
                  Icons.replay,
                  size: 26.0,
                  color: colors[2],
                ),
              )
          ),
        ],
      ),
      body: table(notes: co,),
      backgroundColor: colors[2],
    );
  }
}
class table extends StatelessWidget{
  List<Note> notes;
  table({required this.notes,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child:ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) =>
            table_(index: index,ns: this.notes,),
        shrinkWrap: true,
        padding: EdgeInsets.all(10.0),
      ),
    );
  }
}
class table_ extends StatelessWidget{
  List<Note> ns;
  int index;
  table_({required this.index,Key? key,required this.ns}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: ListTile(

        title: Text(ns[index].c_name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
        subtitle: Text(ns[index].why,style: TextStyle(fontSize:16,fontWeight: FontWeight.bold,),),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            width: 3,
            color: colors[0],
          ),
        ),
        tileColor: colors[1],
        textColor: colors[0],
      ),
      onTap: (){
        Navigator.push( context, MaterialPageRoute( builder: (context) =>
            NoteseePage( index: notes.indexOf(ns[index]),)), ).then((value) => _DNoteslistState(con: cont).setState(() {
              co.clear();
              for(Note n in notes){
                if(n.t_name==cont){
                co.add(n);
            }
          }
        }));
      },
    );
  }
}