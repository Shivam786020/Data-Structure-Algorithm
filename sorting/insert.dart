import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Insert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Insertion Sort', style: TextStyle(color: Colors.white)),
      ),
      
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Insertion Sort Overview',
              content: '''
Insertion Sort is a simple, stable, in-place comparison-based sorting algorithm that builds the final sorted array one element at a time. It works similarly to how you might sort playing cards in your hands.

Key Characteristics:
• Efficient for small datasets and nearly sorted data
• Adaptive (performance improves with partially sorted input)
• Stable (maintains relative order of equal elements)
• In-place (requires only O(1) additional space)
• Online (can sort as it receives elements)''',
              icon: Icons.sort,
            ),

            // Algorithm Explanation
            _buildSection(
              title: 'How Insertion Sort Works',
              content: '''
1. Start with the second element (consider first element as sorted)
2. Compare the current element with the previous elements
3. Shift all larger elements one position up to make space
4. Insert the current element in its correct position
5. Repeat until the entire array is sorted

Example Sorting [12, 11, 13, 5, 6]:

Initial Array: [12, 11, 13, 5, 6]

Pass 1: [12] is sorted, insert 11 → [11, 12, 13, 5, 6]
Pass 2: [11, 12] sorted, insert 13 → [11, 12, 13, 5, 6] (no shift)
Pass 3: [11, 12, 13] sorted, insert 5 → [5, 11, 12, 13, 6]
Pass 4: [5, 11, 12, 13] sorted, insert 6 → [5, 6, 11, 12, 13]''',
              icon: Icons.compare_arrows,
            ),
            SizedBox(height: 10,),
Center(child: 
  Container(
              height: 300,
              decoration: BoxDecoration(
                
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
Text('Animated Example of Insertion Sort Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('insert.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Pseudocode
            _buildSection(
              title: 'Insertion Sort Pseudocode',
              content: '''
procedure insertionSort(A : list of sortable items)
    for i = 1 to length(A) - 1 do
        key = A[i]
        j = i - 1
        while j >= 0 and A[j] > key do
            A[j + 1] = A[j]
            j = j - 1
        end while
        A[j + 1] = key
    end for
end procedure''',
              icon: Icons.code,
            ),

            // Dart Implementation
            _buildSection(
              title: 'Implementation',
              content: 'Complete implementation of Insertion Sort in Dart:',
              icon: Icons.developer_mode,
            ),
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
                    'void insertionSort(List<int> arr) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  for (int i = 1; i < arr.length; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    int key = arr[i]; // Current element to be inserted',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    int j = i - 1;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // Shift elements greater than key to the right',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    while (j >= 0 && arr[j] > key) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      arr[j + 1] = arr[j];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      j--;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // Insert the key in its correct position',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    arr[j + 1] = key;',
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
                    '// Usage example:',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    'void main() {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> numbers = [12, 11, 13, 5, 6];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  insertionSort(numbers);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  print(numbers); // [5, 6, 11, 12, 13]',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),

            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: '''
Time Complexity:
• Worst-case: O(n²) - When array is reverse sorted (maximum comparisons and shifts)
• Best-case: O(n) - When array is already sorted (only n-1 comparisons)
• Average-case: O(n²) - For random data

Space Complexity: O(1) - In-place sorting (only requires constant additional space)

Optimizations:
1. Binary Insertion Sort (uses binary search to find insertion point)
2. Shell Sort (generalization of insertion sort with gaps)
3. Hybrid approaches with other algorithms''',
              icon: Icons.timer,
            ),

            // Visual Example
            _buildSection(
              title: 'Step-by-Step Visualization',
              content: '''
Initial: [12, 11, 13, 5, 6]

Pass 1 (i=1):
Key=11, Compare with 12 → Shift 12 → Insert 11
Result: [11, 12, 13, 5, 6]

Pass 2 (i=2):
Key=13, Compare with 12 → No shift needed
Result: [11, 12, 13, 5, 6]

Pass 3 (i=3):
Key=5, Compare with 13,12,11 → Shift all → Insert 5
Result: [5, 11, 12, 13, 6]

Pass 4 (i=4):
Key=6, Compare with 13,12,11,5 → Shift 13,12,11 → Insert 6
Final: [5, 6, 11, 12, 13]''',
              icon: Icons.animation,
            ),

            // When to Use
            _buildSection(
              title: 'When to Use Insertion Sort',
              content: '''
Insertion Sort is ideal for:
1. Small datasets (n < 100)
2. Nearly sorted data (adaptive nature makes it efficient)
3. Online sorting (data coming in streams)
4. Stable sorting requirements
5. Simple implementation needs

For larger datasets, consider:
• QuickSort (average O(n log n))
• MergeSort (stable O(n log n))
• TimSort (hybrid optimized for real-world data)

Real-world Applications:
1. Sorting playing cards
2. Small file sorting
3. As the base case in recursive sorts
4. In hybrid algorithms like TimSort''',
              icon: Icons.help,
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
        SizedBox(height: 25),
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