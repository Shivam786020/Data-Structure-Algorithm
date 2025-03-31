import 'package:dsa_app/constants/color.dart';
import 'package:dsa_app/oopsjava/unit1.dart';
import 'package:dsa_app/oopsjava/unit2.dart';
import 'package:dsa_app/oopsjava/unit4.dart';
import 'package:dsa_app/oopsjava/unit5.dart';
import 'package:dsa_app/oopsjava/unti3.dart';


import 'package:flutter/material.dart';

class Ja extends StatelessWidget {
  const Ja({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
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
                  icon: Icons.arrow_right,
                  title: 'Unit 1',
                  subtitle: 'Intro, OOP, and Java,Packages, and Interfaces',
                  page: Unit1(), // Replace with your Array page
                ),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Unit 2',
                    subtitle: 'Exceptions, and Multithreading,Input and Output',
                    page: Unit2(),
                  ),
                    _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Unit 3',
                    subtitle: 'Java New Features',
                    page: Unti3(),
                  ),
                    _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Unit 4',
                    subtitle: 'Java Collections Framework',
                    page: Unit4(),
                  ),
                    _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Unit 5',
                    subtitle: 'Spring Framework,Spring Boot',
                    page: Unit5(),
                  ),
                ],
              ),
            ),
          ),
        ),
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