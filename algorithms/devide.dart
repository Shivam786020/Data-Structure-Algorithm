import 'package:flutter/material.dart';

class Devide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Divide & Conquer', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Divide & Conquer?',
              content: 'A powerful algorithm design paradigm that recursively breaks down a problem into two or more subproblems of the same or related type, until they become simple enough to be solved directly. The solutions to the subproblems are then combined to give a solution to the original problem.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Three Steps
            _buildSection(
              title: 'The Three Steps',
              content: '''
1. **Divide**: Break the problem into smaller subproblems
2. **Conquer**: Solve the subproblems recursively
3. **Combine**: Merge the solutions to solve the original problem''',
              icon: Icons.account_tree,
            ),
            
            SizedBox(height: 25),
            
            // Visualization
            _buildSection(
              title: 'Visualization',
              content: '''
Original Problem
    ↓
[DIVIDE] → Subproblem 1   Subproblem 2
    ↓            ↓             ↓
[CONQUER] → Solution 1   Solution 2
    ↓
[COMBINE] → Final Solution''',
              icon: Icons.insights,
            ),
            
            SizedBox(height: 25),
            Center(child: 
  Container(
              height: 402,
              decoration: BoxDecoration(
                
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                 Image.asset('divide.webp',height: 400,width:340,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Classic Examples
            _buildSection(
              title: 'Classic Examples',
              content: '''
• Merge Sort
• Quick Sort
• Binary Search
• Strassen's Matrix Multiplication
• Closest Pair of Points
• Fast Fourier Transform (FFT)''',
              icon: Icons.list,
            ),
            
            SizedBox(height: 25),
            
            // Merge Sort Implementation
            Text(
              'Merge Sort Implementation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'void mergeSort(List<int> arr, int left, int right) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  if (left < right) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // 1. DIVIDE: Find the middle point',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    int mid = left + (right - left) ~/ 2;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '    // 2. CONQUER: Sort first and second halves',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    mergeSort(arr, left, mid);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    mergeSort(arr, mid + 1, right);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '    // 3. COMBINE: Merge the sorted halves',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    merge(arr, left, mid, right);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'void merge(List<int> arr, int left, int mid, int right) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  // Implementation of merging two sorted subarrays',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  // ...',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Binary Search Implementation
            Text(
              'Binary Search Implementation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'int binarySearch(List<int> arr, int left, int right, int target) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  if (right >= left) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // 1. DIVIDE: Find middle point',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    int mid = left + (right - left) ~/ 2;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '    // If element is present at middle',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (arr[mid] == target) return mid;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '    // 2. CONQUER: Search in left or right half',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (arr[mid] > target) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      return binarySearch(arr, left, mid - 1, target);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    return binarySearch(arr, mid + 1, right, target);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return -1; // Not found',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: '''
• **Time Complexity**: Typically follows the Master Theorem
  - Merge Sort: O(n log n)
  - Binary Search: O(log n)
  - Quick Sort: O(n²) worst case, O(n log n) average
  
• **Space Complexity**:
  - Merge Sort: O(n) auxiliary space
  - Binary Search: O(1) iterative, O(log n) recursive stack''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // When to Use
            _buildSection(
              title: 'When to Use Divide & Conquer',
              content: '''
1. Problem can be divided into similar subproblems
2. Subproblems can be solved independently
3. Combining solutions is straightforward
4. Problem has optimal substructure
5. Brute force solution is too slow''',
              icon: Icons.help,
            ),
            
            SizedBox(height: 25),
            
            // Advantages vs Disadvantages
            _buildSection(
              title: 'Advantages vs Disadvantages',
              content: '''
**Advantages**:
• Often more efficient than brute force
• Naturally parallelizable
• Elegant solutions for complex problems

**Disadvantages**:
• Recursion overhead
• May require more memory
• Not always the most efficient approach''',
              icon: Icons.compare,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blueAccent),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}