import 'notelist1.dart';
import 'package:flutter/material.dart';
List <Color> colors = const[Color.fromRGBO(46, 121, 85, 1),Color.fromRGBO(147, 202, 176, 1),Color.fromRGBO(185, 233, 210, 1)];
class home_ extends StatelessWidget{
  const home_({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
          child:Column(
            children: <Widget>[
              SizedBox(height: 350,),
              Text("DreamNote",
                style: TextStyle(fontSize: 40,color: colors[0],fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: colors[1],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                    textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: colors[2])),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Noteslist()),
                  );
                },
                child: Text("GOGO!!"),
              ),
            ],
          )
      ),
      backgroundColor: colors[2],
    );
  }

}