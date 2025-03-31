import 'package:dsa_app/constants/color.dart';
import 'package:dsa_app/sorting/bubble.dart';
import 'package:dsa_app/sorting/insert.dart';
import 'package:dsa_app/sorting/merge.dart';
import 'package:dsa_app/sorting/quick.dart';
import 'package:dsa_app/sorting/select.dart';
import 'package:flutter/material.dart';

class Fun3 extends StatelessWidget {
  const Fun3({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      child: Container(
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
                  title: 'Bubble Sort',
                  subtitle: 'Repeatedly swaps adjacent elements if in wrong order',
                  page: Bubble(),
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.arrow_right,
                  title: 'Insertion Sort',
                  subtitle: 'Builds sorted array one item at a time',
                  page: Insert(),
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.arrow_right,
                  title: 'Selection Sort',
                  subtitle: 'Repeatedly selects smallest element from unsorted part',
                  page: Select(),
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.arrow_right,
                  title: 'Merge Sort',
                  subtitle: 'Divide and conquer algorithm with O(n log n) complexity',
                  page: Merge(),
                ),
                Divider(color: Colors.white54, height: 1),
                _buildAlgorithmTile(
                  context,
                  icon: Icons.arrow_right,
                  title: 'Quick Sort',
                  subtitle: 'Divide and conquer with pivot element',
                  page: Quick(),
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
                      fontSize: 12,
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