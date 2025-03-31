import 'package:dsa_app/constants/color.dart';
import 'package:dsa_app/data/graphs.dart';
import 'package:dsa_app/data/hashtable.dart';
import 'package:dsa_app/data/heap.dart';
import 'package:dsa_app/data/linked.dart';
import 'package:dsa_app/data/queue.dart';
import 'package:dsa_app/data/stack.dart';
import 'package:dsa_app/data/tree.dart';
import 'package:flutter/material.dart';

class funct1 extends StatelessWidget {
  const funct1({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7, // Increased height
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
                  icon: Icons.link,
                  title: 'Linked List',
                  subtitle: 'Consists of nodes linked together',
                  page: Linked(), // Replace with your Array page
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.vertical_align_center,
                  title: 'Stack',
                  subtitle: 'LIFO (Last-In-First-Out) data structure',
                  page: Stackk(), // Replace with your Stack page
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.queue,
                  title: 'Queue',
                  subtitle: 'FIFO (First-In-First-Out) data structure',
                  page: Queue(), // Replace with your Queue page
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.architecture,
                  title: 'Heap',
                  subtitle: 'Complete binary tree with heap property',
                  page: Heap(), // Replace with your Heap page
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.account_tree,
                  title: 'Tree',
                  subtitle: 'Hierarchical data structure with nodes',
                  page: Tree(), // Replace with your Tree page
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.grain,
                  title: 'Graph',
                  subtitle: 'Nodes connected by edges',
                  page: Graphs(), // Replace with your Graph page
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.table_chart,
                  title: 'Hash Table',
                  subtitle: 'Key-value pairs with fast lookup',
                  page: Hashtable(), // Replace with your HashTable page
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