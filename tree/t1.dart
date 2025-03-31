import 'package:dsa_app/constants/color.dart';

import 'package:dsa_app/tree/avl.dart';
import 'package:dsa_app/tree/bina.dart';
import 'package:dsa_app/tree/biser.dart';
import 'package:dsa_app/tree/mulw.dart';


import 'package:flutter/material.dart';

class T1 extends StatelessWidget {
  const T1({super.key});

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
                  title: 'Binary Tree',
                  subtitle: 'Binary Tree is a tree data structure in which each node has at most two children.',
                  page: Bina(), // Replace with your Array page
                ),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Binary Search Tree',
                    subtitle: 'Binary Search Tree is a binary tree in which each node has a value greater than all values in its left subtree and less than all values in its right subtree.',
                    page: Biser(),
                  ),
                    _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'Multiway Search Tree',
                    subtitle: 'Multiway Search Tree is a tree data structure in which each node can have more than two children.',
                    page: Mulw(),
                  ),
                    _buildAlgorithmTile(
                    context,
                    icon: Icons.arrow_right,
                    title: 'AVL Tree',
                    subtitle: 'AVL tree is a self-balancing binary search tree where the difference in heights between left and right subtrees is at most one.',
                    page: Avl(),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                   
                  ],
                )
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