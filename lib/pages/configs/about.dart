import 'package:flutter/material.dart';
import 'package:ui_color_tester/util/nameChangelog.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("About"),
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(6,0,6,5),
          child: ListView(
              children: <Widget>[
                const SizedBox(height: 20),
                Text(NameChangelog.appName+" " + NameChangelog.appVersion,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 25),

                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.deepPurpleAccent[100],
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ),

                Text( '''                     
                
HAMMERED AND REDONE:
0 Times !!!
( This is The Way! )  
     
      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),


                Text( '''                     
                                
Application created using
Flutter and the Dart language,
used for testing and learning.
            
      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    //fontWeight: FontWeight.bold
                  ),
                ),

                Text( ''' 
                
" Before software can be reusable,
it first has to be usable. "
- Ralph Johnson           
      ''',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ]),
        )
    );

  }
}

