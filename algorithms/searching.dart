import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Searching Algorithms', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Searching Algorithms',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Searching algorithms are methods to find an element in a data structure. The two fundamental types are:',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            SizedBox(height: 30),

            // Linear Search Section
            _buildAlgorithmSection(
              title: '1. Linear Search',
              description: 'Linear Search is a simple searching algorithm that checks each element in a list sequentially from the start to the end until it finds the target value.',
              complexity: 'Time: O(n) | Space: O(1)',
              pseudoCode: '''
1. Start from the first element
2. Compare target with current element
3. If match, return index
4. If no match, move to next element
5. If end reached, return -1''',
              code: '''
int linearSearch(List<int> arr, int target) {
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == target) {
      return i;
    }
  }
  return -1;
}''',
            ),
            SizedBox(height: 30),

            // Binary Search Section
            _buildAlgorithmSection(
              title: '2. Binary Search',
              description: 'Efficiently searches a sorted array by repeatedly dividing the search interval in half.',
              complexity: 'Time: O(log n) | Space: O(1)',
              pseudoCode: '''
1. Set low = 0, high = length - 1
2. While low <= high:
   a. mid = low + (high - low) ~/ 2
   b. If arr[mid] == target, return mid
   c. If arr[mid] < target, low = mid + 1
   d. Else high = mid - 1
3. Return -1 if not found''',
              code: '''
int binarySearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;
  
  while (low <= high) {
    int mid = low + (high - low) ~/ 2;
    
    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }
  return -1;
}''',
            ),
            SizedBox(height: 30),

            // Comparison Section
            
           
              
            
          ],
        ),
      ),
    );
  }

  Widget _buildAlgorithmSection({
    required String title,
    required String description,
    required String complexity,
    required String pseudoCode,
    required String code,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
        SizedBox(height: 8),
        Text(description, style: TextStyle(fontSize: 14, color: Colors.white70)),
        SizedBox(height: 8),
        Text(complexity, style: TextStyle(fontSize: 14, color: Colors.green)),
        SizedBox(height: 15),
        
        Text('Pseudo Code:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(pseudoCode, style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'monospace')),
        ),
        SizedBox(height: 15),
        
        Text('Java Implementation:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(code, style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'monospace')),
        ),
      ],
    );
  
}
}