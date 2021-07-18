import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/profile.jpeg'),
                ),
                Text(
                  'Nirbhay Makhija',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Colors.teal[100], // same as Colors.teal.shade100
                    fontFamily: 'SourceSansPro',
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '8851848417',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'nirbhaymakhija@gmail.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}







// Few Key pointers

        /* backgroundColor: Colors.teal,
        body: SafeArea( // to prevent the columns and rows to go into the bezels etc
          child: Column(
              // verticalDirection: VerticalDirection.up, // sets the orietation from bottom to top
              // verticalDirection: VerticalDirection.down, // sets the orietation from top to bottom(defualt)

              // main axis for column is vertical axis
              // mainAxisAlignment: MainAxisAlignment.start, // sets the orientations as start,end or center
              // mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly, // spreads the children evenly throughout the column

              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // spreads the children with one at the top and one at the end and equal spaces in between

              // for arrangement accross horizontal axis
              // crossAxisAlignment: CrossAxisAlignment.end,

              // if we set width: double.infinty then it puts the width across the whole screen
              // a container just having infinite width is an invisible container

              // if u want to stretch all the containers then use:
              // crossAxisAlignment: CrossAxisAlignment.stretch,
                /* SizedBox(
                   height: 20.0,
                   ), 
                */ // used to give space between two containers, for a row just replace height with width
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.white,
                  child: Text('Container 1'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.blue,
                  child: Text('Container 2'),
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.red,
                  child: Text('Container 3'),
                ),
                Container(
                  width: double.infinity,
                ),
              ]),
        ),*/