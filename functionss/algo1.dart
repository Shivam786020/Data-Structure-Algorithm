import 'package:flutter/material.dart';

class Algo1 extends StatelessWidget {
  const Algo1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(
                    'An algorithm is a step-by-step procedure to solve a problem or accomplish a task. '
                    'They serve as the building blocks of computer programs, providing precise instructions '
                    'that computers can execute efficiently. Algorithms exist everywhere - from simple recipes '
                    'to complex machine learning models.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('From the data Structure point of view ,following are some important categories of algorithms.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text('Search',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white)),
                  SizedBox(height: 10),
                  Text('Algorithm to search an item in a data structure.',style: TextStyle(fontSize: 14,color: Colors.white70)),
                  SizedBox(height: 10),
                  Text('Sort',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white)),
                  Text('Algorithm to sort items in a data structure.',style: TextStyle(fontSize: 14,color: Colors.white70)),
                  SizedBox(height: 10),
                  Text('Insert',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white)),
                  Text('Algorithm to insert an item in a data structure.',style: TextStyle(fontSize: 14,color: Colors.white70)),
                  SizedBox(height: 10),
                  Text('Update',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white)),
                  Text('Algorithm to update an item in a data structure.',style: TextStyle(fontSize: 14,color: Colors.white70)),
                  SizedBox(height: 10),
                  Text('Delete',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200,color: Colors.white)),
                  Text('Algorithm to delete an item in a data structure.',style: TextStyle(fontSize: 14,color: Colors.white70)),
                  SizedBox(height: 30),
                  Text(
                    'Key Properties of Algorithms',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '1. **Definiteness**: Each step must be clear and unambiguous\n'
                    '2. **Finiteness**: Must terminate after a finite number of steps\n'
                    '3. **Input**: Can take zero or more inputs\n'
                    '4. **Output**: Must produce at least one output\n'
                    '5. **Effectiveness**: Steps must be basic enough to be executed',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Algorithm Efficiency',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'We measure algorithm efficiency using:\n\n'
                    '• **Time Complexity**: How runtime grows with input size (Big-O notation)\n'
                    '• **Space Complexity**: How much memory the algorithm requires\n\n'
                    'Efficient algorithms minimize both time and space usage, especially important '
                    'for large datasets or real-time systems.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Why Algorithms Matter in Computer Science\n",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "1. **Foundation of Programming**: All code implements some algorithm\n"
                    "2. **Performance Critical**: Good algorithms handle large datasets efficiently\n"
                    "3. **Problem-Solving Framework**: Teaches structured thinking\n"
                    "4. **Universal Application**: Useful across all tech domains\n"
                    "5. **Innovation Driver**: Enables new technologies like AI and blockchain",
                    style: TextStyle(fontSize: 14,color: Colors.white70),
                  ),
                  SizedBox(height: 30),

                  
                ],
              );
  }
}