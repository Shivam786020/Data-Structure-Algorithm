import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Complexity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Algorithm Complexity', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            Text(
              'Understanding Algorithm Complexity',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
            ),
            Text('Complexity is a measure of how well an algorithm scales with input size. It helps us understand how the algorithm will perform as the input size grows.', style: TextStyle(fontSize: 14, color: Colors.white70)),
            // Time Complexity Section
            SizedBox(height: 10),
            Text('It is mainly divided into two types:',
             style: TextStyle(fontSize: 18, color: Colors.blueAccent)),
            SizedBox(height: 5),
            Text('1. Time Complexity', style: TextStyle(fontSize: 18, color: Colors.white)),
            SizedBox(height: 3),
            Text('2. Space Complexity', style: TextStyle(fontSize: 18, color: Colors.white)),
            _buildComplexitySection(
              title: 'Time Complexity',
              definition: 'Measures the amount of time an algorithm takes to complete as a function of the input size. It estimates how the runtime grows when the input size increases.',
              bigOExplanation: '''
• O(1) - Constant Time: Operations that take the same time regardless of input size
• O(n) - Linear Time: Runtime grows proportionally with input size
• O(log n) - Logarithmic Time: Runtime grows logarithmically with input size
• O(n²) - Quadratic Time: Runtime grows with the square of input size''',
              exampleCode: '''
/// O(1) - Constant Time

int getFirstElement(List<int> list) {
  return list[0]; // Single operation
}

/// O(n) - Linear Time

bool linearSearch(List<int> list, int target) {
  for (int num in list) { // Iterates through all elements
    if (num == target) return true;
  }
  return false;
}

/// O(n²) - Quadratic Time

void bubbleSort(List<int> list) {
  for (int i = 0; i < list.length; i++) { // Nested loops
    for (int j = 0; j < list.length - 1; j++) {
      if (list[j] > list[j+1]) {
        // Swap elements
        int temp = list[j];
        list[j] = list[j+1];
        list[j+1] = temp;
      }
    }
  }
}''',
              icon: Icons.timer,
            ),

            SizedBox(height: 30),

            // Space Complexity Section
            _buildComplexitySection(
              title: 'Space Complexity',
              definition: 'Measures the amount of memory space an algorithm needs relative to the input size. It includes both auxiliary space and input space.',
              bigOExplanation: '''
• O(1) - Constant Space: Uses fixed amount of memory
• O(n) - Linear Space: Memory usage grows with input size
• O(log n) - Logarithmic Space: Memory grows logarithmically
• O(n²) - Quadratic Space: Memory grows with square of input size''',
              exampleCode: '''
/// O(1) - Constant Space

int sum(int a, int b) {
  return a + b; // Only uses fixed variables
}

/// O(n) - Linear Space

List<int> copyList(List<int> original) {
  List<int> newList = []; // Grows with input size
  for (int num in original) {
    newList.add(num);
  }
  return newList;
}

/// O(n²) - Quadratic Space

List<List<int>> createMatrix(int n) {
  List<List<int>> matrix = [];
  for (int i = 0; i < n; i++) {
    matrix.add(List.filled(n, 0)); // n x n matrix
  }
  return matrix;
}''',
              icon: Icons.memory,
            ),

            SizedBox(height: 30),

            // Complexity Comparison
            Text(
              'Complexity Comparison Chart',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: [
                DataColumn(label: Text('Notation', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Name', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Input=10', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Input=100', style: TextStyle(color: Colors.white))),
              ],
              rows: [
                _buildDataRow('O(1)', 'Constant', '1', '1', Colors.green),
                _buildDataRow('O(log n)', 'Logarithmic', '1', '2', Colors.lightGreen),
                _buildDataRow('O(n)', 'Linear', '10', '100', Colors.yellow),
                _buildDataRow('O(n log n)', 'Linearithmic', '10', '200', Colors.orange),
                _buildDataRow('O(n²)', 'Quadratic', '100', '10,000', Colors.red),
                _buildDataRow('O(2ⁿ)', 'Exponential', '1,024', '1.26e+30', Colors.purple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComplexitySection({
    required String title,
    required String definition,
    required String bigOExplanation,
    required String exampleCode,
    required IconData icon,
  }) {
    return Card(
      elevation: 5,
      color: Colors.grey[900],
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blueAccent, size: 28),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Definition:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              definition,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 15),
            Text(
              'Common Big-O Cases:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              bigOExplanation,
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 15),
            Text(
              'Example Code:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                exampleCode,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'monospace',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow(String notation, String name, String input10, String input100, Color color) {
    return DataRow(
      cells: [
        DataCell(Text(notation, style: TextStyle(color: color, fontWeight: FontWeight.bold))),
        DataCell(Text(name, style: TextStyle(color: Colors.white70))),
        DataCell(Text(input10, style: TextStyle(color: Colors.white70))),
        DataCell(Text(input100, style: TextStyle(color: Colors.white70))),
      ],
    );
  }
}