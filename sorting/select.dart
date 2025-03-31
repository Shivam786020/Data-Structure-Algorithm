import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Selection Sort', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Selection Sort Overview',
              content: '''
Selection Sort is an in-place comparison-based sorting algorithm that divides the input list into two parts: the sorted part and the unsorted part. It repeatedly selects the smallest (or largest) element from the unsorted part and moves it to the sorted part.

Key Characteristics:
• Simple implementation
• In-place sorting (requires only O(1) additional space)
• Not stable (may change relative order of equal elements)
• Performs same number of comparisons regardless of input order''',
              icon: Icons.sort,
            ),

            // Algorithm Explanation
            _buildSection(
              title: 'How Selection Sort Works',
              content: '''
1. Divide the array into sorted (left) and unsorted (right) parts
2. Find the minimum element in the unsorted part
3. Swap it with the leftmost element of unsorted part
4. Move the boundary between sorted and unsorted parts one element to the right
5. Repeat until the entire array is sorted

Example Sorting [64, 25, 12, 22, 11]:

Initial Array: [64, 25, 12, 22, 11]

Pass 1: Find min (11) → Swap with 64 → [11, 25, 12, 22, 64]
Pass 2: Find min in unsorted (12) → Swap with 25 → [11, 12, 25, 22, 64]
Pass 3: Find min in unsorted (22) → Swap with 25 → [11, 12, 22, 25, 64]
Pass 4: Find min in unsorted (25) → Already in place → [11, 12, 22, 25, 64]''',
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
Text('Animated Example of Selection Sort Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('select.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Pseudocode
            _buildSection(
              title: 'Selection Sort Pseudocode',
              content: '''
procedure selectionSort(A : list of sortable items)
    n := length(A)
    for i = 0 to n-2 do
        minIndex := i
        for j = i+1 to n-1 do
            if A[j] < A[minIndex] then
                minIndex := j
            end if
        end for
        if minIndex != i then
            swap(A[i], A[minIndex])
        end if
    end for
end procedure''',
              icon: Icons.code,
            ),

            // Dart Implementation
            _buildSection(
              title: ' Implementation',
              content: 'Complete implementation of Selection Sort in Dart:',
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
                    'void selectionSort(List<int> arr) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  for (int i = 0; i < arr.length - 1; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    int minIndex = i;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // Find minimum in unsorted array',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (int j = i + 1; j < arr.length; j++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      if (arr[j] < arr[minIndex]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        minIndex = j;',
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
                    '    // Swap if needed',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (minIndex != i) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      int temp = arr[i];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      arr[i] = arr[minIndex];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      arr[minIndex] = temp;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
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
                    '  List<int> numbers = [64, 25, 12, 22, 11];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  selectionSort(numbers);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  print(numbers); // [11, 12, 22, 25, 64]',
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
• Worst-case: O(n²) - Always performs n(n-1)/2 comparisons
• Best-case: O(n²) - Even if array is sorted, same comparisons
• Average-case: O(n²) - For random data

Space Complexity: O(1) - In-place sorting (only requires constant additional space)

Key Points:
• Always performs O(n) swaps (minimum possible)
• Not adaptive (performance doesn't improve with partially sorted input)
• Not stable (may change order of equal elements)''',
              icon: Icons.timer,
            ),

            // Visual Example
            _buildSection(
              title: 'Step-by-Step Visualization',
              content: '''
Initial: [64, 25, 12, 22, 11]

Pass 1:
Find min (11 at index 4) → Swap with 64 → [11, 25, 12, 22, 64]

Pass 2:
Find min in unsorted (12 at index 2) → Swap with 25 → [11, 12, 25, 22, 64]

Pass 3:
Find min in unsorted (22 at index 3) → Swap with 25 → [11, 12, 22, 25, 64]

Pass 4:
Find min in unsorted (25 at index 3) → Already in place → [11, 12, 22, 25, 64]''',
              icon: Icons.animation,
            ),

            // When to Use
            _buildSection(
              title: 'When to Use Selection Sort',
              content: '''
Selection Sort is suitable for:
1. Small datasets (n < 100)
2. When memory writes are expensive (only O(n) swaps)
3. Simple implementation requirements
4. When stability is not required

For larger datasets, consider:
• QuickSort (average O(n log n))
• MergeSort (stable O(n log n))
• HeapSort (in-place O(n log n))

Real-world Applications:
1. Sorting small lists where simplicity is more important than efficiency
2. Situations with expensive write operations (like flash memory)
3. As a teaching tool for sorting algorithms''',
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