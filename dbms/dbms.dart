import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Dbms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: const Color.fromARGB(255, 215, 79, 38),

        title: Text('DBMS', style: TextStyle(color: Colors.white),)
      ),
      endDrawer: AppDrawer(),
      body: Center(
        child: Text(' Content Will coming soon',style: TextStyle(color: Colors.white),),
      ),
    );
  }
}