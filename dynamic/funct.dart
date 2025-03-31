import 'package:dsa_app/constants/color.dart';
import 'package:dsa_app/dynamic/bellman.dart';
import 'package:dsa_app/dynamic/coin.dart';
import 'package:dsa_app/dynamic/knapsack.dart';
import 'package:dsa_app/dynamic/longest.dart';

import 'package:flutter/material.dart';

class Funct extends StatelessWidget {
  const Funct({super.key});

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
                    title: '0-1 Knapsack',
                    subtitle: 'In this dynamic programming we have a items',
                    page: Knapsack(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.play_arrow,
                    title: 'Bellman Ford',
                    subtitle: ' Bellmon ford algorithm helps us to find ',
                    page: Bellman(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.play_arrow,
                    title: 'Coin Change',
                    subtitle: 'In the coin change problem ,we are basically ',
                    page: Coin(),
                  ),
                  Divider(color: Colors.white54, height: 1),
                  _buildAlgorithmTile(
                    context,
                    icon: Icons.play_arrow,
                    title: 'Longest Common Subsequences',
                    subtitle: 'The longest common subsequences(LCS) is  ',
                    page: Longest(),
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