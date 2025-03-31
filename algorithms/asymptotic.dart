import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Asymptotic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Asymptotic Notation', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(' What is Asymptotic Notation?'),
            _buildText(
                'Asymptotic notation is a mathematical representation to analyze the running time '
                'and space complexity of an algorithm when the input size becomes very large (n → ∞). '
                'It helps in understanding the worst-case, best-case, and average-case scenarios of an algorithm.'),

            SizedBox(height: 20),
            _buildSectionTitle('1. Big O Notation (O) – Worst Case Complexity'),
            _buildText(
                'Big O notation represents the upper bound of an algorithm’s running time. '
                'It tells us the worst-case scenario, meaning the maximum amount of time '
                'an algorithm will take to complete execution.'),
            _buildText('Common Complexities:'),
            _buildComplexityList([
              'O(1) - Constant Time',
              'O(log n) - Logarithmic Time',
              'O(n) - Linear Time',
              'O(n log n) - Log-Linear Time',
              'O(n²) - Quadratic Time',
              'O(2ⁿ) - Exponential Time',
            ]),
            _buildImage('oh.png'), // Add appropriate image path

            SizedBox(height: 20),
            _buildSectionTitle(' 2. Omega Notation (Ω) – Best Case Complexity'),
            _buildText(
                'Omega (Ω) notation represents the lower bound of an algorithm’s running time. '
                'It defines the best-case scenario, meaning the minimum time an algorithm will take '
                'to execute for a given input.'),
            _buildText('Common Complexities:'),
            _buildComplexityList([
              'Ω(1) - Best case in constant time',
              'Ω(log n) - Best case in logarithmic time',
              'Ω(n) - Best case in linear time',
            ]),
            _buildImage('omega.png'), // Add appropriate image path

            SizedBox(height: 20),
            _buildSectionTitle(' 3. Theta Notation (Θ) – Average Case Complexity'),
            _buildText(
                'Theta (Θ) notation defines the tight bound on an algorithm’s running time. '
                'It provides a range where the actual running time will always fall.'),
            _buildText('Common Complexities:'),
            _buildComplexityList([
              'Θ(1) - Constant time complexity',
              'Θ(n) - Linear time complexity',
              'Θ(n log n) - Log-linear complexity',
            ]),
            _buildImage('theta.png'), // Add appropriate image path
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.white70),
      ),
    );
  }

  Widget _buildComplexityList(List<String> complexities) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: complexities.map((complexity) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Icon(Icons.check_circle, size: 16, color: Colors.blue),
              SizedBox(width: 8),
              Text(
                complexity,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildImage(String assetPath) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Image.asset(assetPath, height: 400, fit: BoxFit.contain),
    );
  }
}
