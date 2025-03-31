import 'package:dsa_app/constants/color.dart';
import 'package:dsa_app/greedy/dij.dart';
import 'package:dsa_app/greedy/huff.dart';
import 'package:dsa_app/greedy/krus.dart';
import 'package:dsa_app/greedy/prim.dart';
import 'package:flutter/material.dart';

class Func extends StatelessWidget {
  const Func({super.key});

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
                    icon: Icons.play_arrow,
                    title: 'Dijkstra\s Shortest Path Algorithm',
                    subtitle: 'One algorithm for finding the shortest',
                    page: Dij(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.play_arrow,
                    title: 'Krushkal Minimum Spanning Tree',
                    subtitle: 'Krushkal algorithm to find the minimum cost ',
                    page: Krus(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.play_arrow,
                    title: 'Prim\'s Minimum Spanning Tree',
                    subtitle: 'Prim algorithm to find minimum cost',
                    page: Prim(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.play_arrow,
                    title: 'Huffman',
                    subtitle: 'Huffman coding is a Technique of compressing ',
                    page: Huff(),
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