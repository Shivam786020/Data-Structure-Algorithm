import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/functionss/algo1.dart';
import 'package:dsa_app/functionss/algo2.dart';
import 'package:dsa_app/functionss/algo3.dart';
import 'package:dsa_app/functionss/conta.dart';
import 'package:flutter/material.dart';

class Algorithms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Algorithms', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Algorithm',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        const Algo3(),
                        SizedBox(height: 10),
                        const Algo2(),
                        const Algo1(),
                      ],
                    ),
                  ),
                  const Conta(), // Moved outside the Padding
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}