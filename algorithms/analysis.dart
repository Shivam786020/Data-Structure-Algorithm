import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('How to Write Algorithms', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            Text(
              'Writing Effective Algorithms',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            SizedBox(height: 15),
            Text(
              'An algorithm is a step-by-step procedure to solve a problem. Good algorithms are:',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletPoint('Clear and unambiguous'),
                  _buildBulletPoint('Efficient in time and space'),
                  _buildBulletPoint('Correct for all possible inputs'),
                  _buildBulletPoint('Well-structured and maintainable'),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Step-by-Step Guide
            Text(
              'Steps to Write an Algorithm:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            SizedBox(height: 15),
            _buildAlgorithmStep(1, 'Understand the problem completely'),
            _buildAlgorithmStep(2, 'Identify inputs and expected outputs'),
            _buildAlgorithmStep(3, 'Break down into smaller subproblems'),
            _buildAlgorithmStep(4, 'Choose appropriate data structures'),
            _buildAlgorithmStep(5, 'Write step-by-step procedure'),
            _buildAlgorithmStep(6, 'Analyze time and space complexity'),
            _buildAlgorithmStep(7, 'Test with various cases'),
            SizedBox(height: 30),

            // Example Section
            Text(
              'Example: Linear Search Algorithm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            SizedBox(height: 15),
            
            // Pseudo Code
            Text(
              'Pseudo Code:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '1. Start from the first element\n'
                '2. Compare target with current element\n'
                '3. If match, return current index\n'
                '4. If no match, move to next element\n'
                '5. If end of list reached, return -1',
                style: TextStyle(fontSize: 14, fontFamily: 'monospace',color: Colors.black),
              ),
            ),
            SizedBox(height: 20),
            
            // Actual Code Example
            Text(
              'Java Implementation:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'int linearSearch(int[] arr, int target) {\n'
                '    for (int i = 0; i < arr.length; i++) {\n'
                '        if (arr[i] == target) {\n'
                '            return i;\n'
                '        }\n'
                '    }\n'
                '    return -1;\n'
                '}',
                style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'monospace'),
              ),
            ),
            SizedBox(height: 30),
Text('Hence, many solution algorithm can be derived for a given'
            'problem.The next step is to analyze those proposed solution algorithms and implementation the best suitable solution',
            style: TextStyle(fontFamily: 'monospace',color: Colors.white70,fontSize: 14),),
            SizedBox(height: 10,),
            // Image Placeholder - Replace with your actual image
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Image.asset('linear.jpg',height: 350,width:350,)
              ),
            ),
            SizedBox(height: 20),
            
            Text(
              'Fig 1. Linear Search Algorithm Visualization',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Complexity Analysis
            Text(
              'Complexity Analysis:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70,fontFamily: 'Times'),
            ),
            SizedBox(height: 15),
            Text(
              'Time Complexity: O(n) - Linear time\n'
              'Space Complexity: O(1) - Constant space',
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for bullet points
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: 16,color: Colors.white)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 16,color: Colors.white70))),
        ],
      ),
    );
  }

  // Helper method for algorithm steps
  Widget _buildAlgorithmStep(int number, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(number.toString(), 
                style: TextStyle(color: Colors.white, fontSize: 14)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 16,color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}