import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: Text('I am Rich'),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1471879832106-c7ab9e0cee23?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZGV3fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80'),
          ),
        ),
      ),
    ),
  );
}
