import 'package:flutter/material.dart';
import 'model.dart';
import 'notearea.dart';
import 'notelist2.dart';
class Noteslist extends StatefulWidget {
  Noteslist({Key? key}) : super(key: key);

  @override
  _NoteslistState createState() => _NoteslistState();
}

class _NoteslistState extends State<Noteslist> {
  @override
  void initState() {
    super.initState();
    types.clear();
    for(Note n in notes){
      String a = n.t_name;
      if(!types.contains(a)){
        types.add(a);
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
          title: Text("Type List",style: TextStyle(fontSize: 25,color: colors[2]),),
          backgroundColor: colors[0],
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push( context, MaterialPageRoute( builder: (context) =>
                        NotesPage()), ).then((value) => setState(() {
                          types.clear();
                      for(Note n in notes){
                        String a = n.t_name;
                        if(!types.contains(a)){
                          types.add(a);
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
                      types.clear();
                      for(Note n in notes){
                        String a = n.t_name;
                        if(!types.contains(a)){
                          types.add(a);
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
      backgroundColor: colors[2],
      body: SingleChildScrollView(
        child:Container(
          child:GridView.builder(
            padding: EdgeInsets.all(8.0),
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: types.length,
            itemBuilder: (context, index) => character(title: types[index]),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          ),
        ),
      )
    );
  }
}
class character extends StatelessWidget{
  String title;
  character({required this.title,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: SizedBox(
        width: 80,
        height: 80,
        child:Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: colors[0],
                width: 5
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Text(this.title,
              style: TextStyle(color: colors[0],fontSize: 30,fontWeight: FontWeight.bold),
            ),
          ),
          color: colors[1],
        ),
      ),
      onTap: (){
        Navigator.push( context, MaterialPageRoute( builder: (context) =>
            DNoteslist(con: title,)), ).then((value) => _NoteslistState().setState(() {
          for(Note n in notes){
            String a = n.t_name;
            if(!types.contains(a)){
              types.add(a);
            }
          }
        }));
      },
    );
  }
}