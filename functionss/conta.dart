import 'package:dsa_app/algorithms/analysis.dart';
import 'package:dsa_app/algorithms/asymptotic.dart';
import 'package:dsa_app/algorithms/complexity.dart';
import 'package:dsa_app/algorithms/devide.dart';
import 'package:dsa_app/algorithms/dynamic.dart';
import 'package:dsa_app/algorithms/greedy.dart';
import 'package:dsa_app/algorithms/iteration.dart';
import 'package:dsa_app/constants/color.dart';
import 'package:flutter/material.dart';

class Conta extends StatelessWidget {
  const Conta({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Common Algorithm Design Techniques\n",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Padding(padding: EdgeInsets.all(20),
        child: Text(
          "There are several algorithm design techniques that are commonly used to solve problems. Some of the most popular ones are:",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white60,
          ),
        ),
        ),
        Material(
  elevation: 10,
  borderRadius: BorderRadius.circular(6),
  color: Colors.transparent,
  child: 
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          decoration: BoxDecoration(
            color: customcolor.bglight1,
            borderRadius: BorderRadius.circular(6),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.timelapse,
                    title: 'Complexity of Algorithms',
                    subtitle: 'Understanding time and space complexity',
                    page: Complexity(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.functions,
                    title: 'Asymptotic Notation',
                    subtitle: 'Big-O, Omega, and Theta notations',
                    page: Asymptotic(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.analytics,
                    title: 'Writing of Algorithms',
                    subtitle: 'Methods for evaluating algorithm efficiency',
                    page: Analysis(),
                  ),
                
                ],
              ),
            ),
          ),
        ),
        ),
          SizedBox(height: 10),
                        Padding(padding: EdgeInsets.all(20),child: 
Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Text(
                    'Algorithm Paradigms',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('An algorithm paradigm (or algorithm design technique) is a general approach or strategy used to solve computational problems. Each paradigm provides a structured way to think about and implement algorithms based on specific problem characteristics.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                    ),
                  )
            ]
)
          ),
                  SizedBox(height: 10),
                  Material(
  elevation: 10,
  borderRadius: BorderRadius.circular(6),
  color: Colors.transparent,
  child: 
                  Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.5,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
          ),
          decoration: BoxDecoration(
            color: Colors.grey[850],
            
            borderRadius: BorderRadius.circular(6),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                     
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.local_offer, // Greedy icon
                    title: 'Greedy Algorithms',
                    subtitle: 'Make locally optimal choices at each step',
                    page: Greedy(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.timeline, // Dynamic Programming icon
                    title: 'Dynamic Programming',
                    subtitle: 'Break problems into overlapping subproblems',
                    page: Dynamic(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.call_split, // Divide & Conquer icon
                    title: 'Divide & Conquer',
                    subtitle: 'Recursively break problems into smaller subproblems',
                    page: Devide(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.repeat, // Recursive icon
                    title: 'Recursive Algorithms',
                    subtitle: 'Solve problems by calling smaller instances of itself',
                    page: Iteration(),
                  ),
                ],
              ),
            ),
          ),
        ),
                  ),
                  SizedBox(height: 30)

      ],
    );
  }

  Widget _buildAlgorithmTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget page,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}