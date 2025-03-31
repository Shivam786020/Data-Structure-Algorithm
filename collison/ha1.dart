import 'package:dsa_app/collison/buck.dart';
import 'package:dsa_app/collison/open.dart';
import 'package:dsa_app/collison/separ.dart';
import 'package:dsa_app/constants/color.dart';



import 'package:flutter/material.dart';

class Ha1 extends StatelessWidget {
  const Ha1({super.key});

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
                  title: 'Open Addressing',
                  subtitle: 'Open Addressing is a technique in which all keys are stored in the ',
                  page: Open(), // Replace with your Array page
                ),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Separate Chaining',
                    subtitle: 'Separate Chaining is a technique in which each key has its own',
                    page: Separ(),
                  ),
                _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Bucket Hashing',
                    subtitle: 'Bucket Hashing is a technique in which multiple keys are stored',
                    page: Buck(),
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