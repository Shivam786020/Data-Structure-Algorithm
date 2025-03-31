import 'package:flutter/material.dart';

class Arrop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                        backgroundColor: const Color.fromARGB(255, 215, 79, 38),

        title: Text('Arrays', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Text('Arrays Content'),
      ),
    );
  }
}