import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Bubble Sort', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Bubble Sort Overview',
              content: '''
Bubble Sort is a simple comparison-based sorting algorithm that repeatedly steps through the list, compares adjacent elements and swaps them if they are in the wrong order. The pass through the list is repeated until the list is sorted.

Key Characteristics:
• Simple to understand and implement
• In-place sorting (requires only O(1) additional space)
• Stable sort (maintains relative order of equal elements)
• Adaptive (can detect already sorted lists)''',
              icon: Icons.sort,
            ),

            // Algorithm Explanation
            _buildSection(
              title: 'How Bubble Sort Works',
              content: '''
1. Starting from the first element, compare each pair of adjacent elements
2. If they are in the wrong order (ascending/descending), swap them
3. After each pass, the largest unsorted element "bubbles up" to its correct position
4. Repeat the process for the remaining elements
5. The algorithm stops when no more swaps are needed in a complete pass

Example Sorting [5, 1, 4, 2, 8]:

Initial Array: [5, 1, 4, 2, 8]

First Pass:
(5,1) → Swap → [1, 5, 4, 2, 8]
(5,4) → Swap → [1, 4, 5, 2, 8]
(5,2) → Swap → [1, 4, 2, 5, 8]
(5,8) → No swap → [1, 4, 2, 5, 8]

Second Pass:
(1,4) → No swap
(4,2) → Swap → [1, 2, 4, 5, 8]
(4,5) → No swap
(5,8) → No swap

Third Pass:
No swaps needed → Array is sorted''',
              icon: Icons.bubble_chart,
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
Text('Animated Example of Bubble Sort Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('bubb.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Pseudocode
            _buildSection(
              title: 'Bubble Sort Pseudocode',
              content: '''
procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        swapped := false
        for i := 1 to n-1 inclusive do
            if A[i-1] > A[i] then
                swap(A[i-1], A[i])
                swapped := true
            end if
        end for
        n := n - 1
    until not swapped
end procedure''',
              icon: Icons.code,
            ),

            // Dart Implementation
            _buildSection(
              title: ' Implementation',
              content: 'Complete implementation of Bubble Sort in Dart:',
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
                    'void bubbleSort(List<int> arr) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int n = arr.length;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  bool swapped;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  do {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    swapped = false;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (int i = 1; i < n; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      if (arr[i - 1] > arr[i]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        // Swap elements',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        int temp = arr[i - 1];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        arr[i - 1] = arr[i];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        arr[i] = temp;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        swapped = true;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    n--; // Largest element is in correct position',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  } while (swapped); // Continue until no swaps',
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
                    '  List<int> numbers = [5, 1, 4, 2, 8];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  bubbleSort(numbers);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  print(numbers); // [1, 2, 4, 5, 8]',
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
• Worst-case: O(n²) - When array is reverse sorted
• Best-case: O(n) - When array is already sorted (optimized version)
• Average-case: O(n²)

Space Complexity: O(1) - In-place sorting

Optimizations:
1. Early termination if no swaps occur
2. Reduce inner loop range after each pass
3. Cocktail Shaker Sort (bidirectional bubble sort)''',
              icon: Icons.timer,
            ),

            // Visual Example
            _buildSection(
              title: 'Visual Example',
              content: '''
Initial: [5, 1, 4, 2, 8]

Pass 1:
[5,1] → Swap → [1,5,4,2,8]
[5,4] → Swap → [1,4,5,2,8]
[5,2] → Swap → [1,4,2,5,8]
[5,8] → No swap → [1,4,2,5,8]

Pass 2:
[1,4] → No swap
[4,2] → Swap → [1,2,4,5,8]
[4,5] → No swap
[5,8] → No swap

Pass 3:
No swaps → Sorting complete''',
              icon: Icons.visibility,
            ),

            // When to Use
            _buildSection(
              title: 'When to Use Bubble Sort',
              content: '''
Bubble Sort is mainly used for:
1. Educational purposes (simple to understand)
2. Small datasets (n < 100)
3. Nearly sorted data (adaptive version works well)
4. When simplicity is more important than efficiency

For larger datasets, consider:
• QuickSort (average O(n log n))
• MergeSort (stable O(n log n))
• HeapSort (in-place O(n log n))''',
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