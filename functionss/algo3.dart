import 'package:flutter/material.dart';

class Algo3 extends StatelessWidget {
  const Algo3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

              Text(
                'What are Algorithms?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Algorithms are step-by-step procedures or sets of rules for solving a particular problem. They are used in all aspects of computer science: artificial intelligence, databases, graphics, networking, security, and so on. An algorithm is a finite series of instructions to compute a result. It is not the result itself. An algorithm is a step-by-step set of operations that are to be performed. Algorithms are used for calculation, data processing, and automated reasoning.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Example: Binary Search Algorithm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              )
    ]
    )
              );
  }
}