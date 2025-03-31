import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Merge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Merge Sort', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Merge Sort Overview',
              content: '''
Merge Sort is a divide-and-conquer algorithm that recursively divides the input array into two halves, sorts each half, and then merges them back together. It's one of the most efficient comparison-based sorting algorithms.

Key Characteristics:
• Stable sort (maintains relative order of equal elements)
• Not in-place (requires O(n) additional space)
• Consistent O(n log n) time complexity
• Well-suited for large datasets and external sorting
• Parallelizable (can be optimized for multi-threading)''',
              icon: Icons.sort,
            ),

            // Algorithm Explanation
            _buildSection(
              title: 'How Merge Sort Works',
              content: '''
1. Divide: Split the unsorted array into two subarrays of about equal size
2. Conquer: Recursively sort each subarray
3. Combine: Merge the two sorted subarrays back into one sorted array

Example Sorting [38, 27, 43, 3, 9, 82, 10]:

Initial Array: [38, 27, 43, 3, 9, 82, 10]

Divide:
[38, 27, 43, 3] and [9, 82, 10]

Recursive Sort:
[3, 27, 38, 43] and [9, 10, 82]

Merge:
Compare 3 and 9 → Take 3
Compare 27 and 9 → Take 9
Compare 27 and 10 → Take 10
Compare 27 and 82 → Take 27
Compare 38 and 82 → Take 38
Compare 43 and 82 → Take 43
Take remaining 82
Final: [3, 9, 10, 27, 38, 43, 82]''',
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
Text('Animated Example of Merge Sort Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('merge.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Pseudocode
            _buildSection(
              title: 'Merge Sort Pseudocode',
              content: '''
procedure mergeSort(A : list of sortable items)
    if length(A) ≤ 1 then
        return A
    end if
    
    // Divide
    middle = length(A) / 2
    left = A[0..middle-1]
    right = A[middle..length(A)-1]
    
    // Conquer
    left = mergeSort(left)
    right = mergeSort(right)
    
    // Combine
    return merge(left, right)
end procedure

procedure merge(left, right)
    result = empty list
    while left not empty and right not empty do
        if first(left) ≤ first(right) then
            append first(left) to result
            left = rest(left)
        else
            append first(right) to result
            right = rest(right)
        end if
    end while
    
    // Append remaining elements
    append remaining left to result
    append remaining right to result
    
    return result
end procedure''',
              icon: Icons.code,
            ),

            // Dart Implementation
            _buildSection(
              title: ' Implementation',
              content: 'Complete implementation of Merge Sort in Dart:',
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
                    'List<int> mergeSort(List<int> arr) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  if (arr.length <= 1) return arr; // Base case',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  // Divide',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int mid = arr.length ~/ 2;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> left = arr.sublist(0, mid);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> right = arr.sublist(mid);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  // Conquer (recursively sort subarrays)',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  left = mergeSort(left);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  right = mergeSort(right);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  // Combine (merge sorted subarrays)',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return merge(left, right);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'List<int> merge(List<int> left, List<int> right) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> result = [];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int i = 0, j = 0;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  // Compare elements from both subarrays',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  while (i < left.length && j < right.length) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (left[i] <= right[j]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      result.add(left[i++]);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    } else {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      result.add(right[j++]);',
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
                  SizedBox(height: 5),
                  Text(
                    '  // Append remaining elements',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  while (i < left.length) result.add(left[i++]);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  while (j < right.length) result.add(right[j++]);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return result;',
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
                    '  List<int> numbers = [38, 27, 43, 3, 9, 82, 10];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  numbers = mergeSort(numbers);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  print(numbers); // [3, 9, 10, 27, 38, 43, 82]',
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
• Worst-case: O(n log n) - Consistent performance
• Best-case: O(n log n) - Even for already sorted input
• Average-case: O(n log n) - For any random data

Space Complexity: O(n) - Requires auxiliary space for merging

Key Points:
• Recursive implementation uses O(log n) stack space
• Can be implemented iteratively to reduce stack usage
• Merge operation is O(n) time and space''',
              icon: Icons.timer,
            ),

            // Visual Example
            _buildSection(
              title: 'Step-by-Step Visualization',
              content: '''
Initial Array: [38, 27, 43, 3, 9, 82, 10]

Divide:
[38, 27, 43, 3] and [9, 82, 10]

Recursive Sort Left:
[38, 27] and [43, 3] → [27, 38] and [3, 43] → Merge to [3, 27, 38, 43]

Recursive Sort Right:
[9, 82] and [10] → [9, 82] and [10] → Merge to [9, 10, 82]

Final Merge:
Compare 3 and 9 → Take 3
Compare 27 and 9 → Take 9
Compare 27 and 10 → Take 10
Compare 27 and 82 → Take 27
Compare 38 and 82 → Take 38
Compare 43 and 82 → Take 43
Take remaining 82
Result: [3, 9, 10, 27, 38, 43, 82]''',
              icon: Icons.animation,
            ),

            // When to Use
            _buildSection(
              title: 'When to Use Merge Sort',
              content: '''
Merge Sort is ideal for:
1. Large datasets where O(n log n) performance is needed
2. When stable sorting is required
3. Sorting linked lists (efficient merge operation)
4. External sorting (when data doesn't fit in memory)
5. Parallel computing environments

For smaller datasets or when space is constrained, consider:
• QuickSort (average O(n log n), in-place)
• HeapSort (in-place O(n log n))
• InsertionSort (for very small n)

Real-world Applications:
1. Database sorting operations
2. External sorting of large files
3. Inversion count problems
4. Used as the base for TimSort (Python, Java default sort)''',
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