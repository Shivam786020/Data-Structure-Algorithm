import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Quick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Quick Sort', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Quick Sort Overview',
              content: '''
Quick Sort is a highly efficient divide-and-conquer sorting algorithm that works by selecting a 'pivot' element and partitioning the array around the pivot. It's one of the fastest general-purpose sorting algorithms in practice.

Key Characteristics:
• Average-case O(n log n) time complexity
• In-place sorting (O(log n) stack space)
• Not stable (may change order of equal elements)
• Cache-efficient (good locality of reference)
• Can be 2-3x faster than Merge Sort in practice''',
              icon: Icons.sort,
            ),

            // Algorithm Explanation
            _buildSection(
              title: 'How Quick Sort Works',
              content: '''
1. Choose a pivot element from the array
2. Partition: Rearrange elements so that:
   - Elements < pivot come before it
   - Elements > pivot come after it
3. Recursively apply to the subarrays
4. Base case: Arrays of size 0 or 1 are already sorted

Example Sorting [10, 80, 30, 90, 40, 50, 70]:

Initial Array: [10, 80, 30, 90, 40, 50, 70]

Pass 1 (Pivot=70):
Partition: [10, 30, 40, 50] 70 [80, 90]

Pass 2 (Left):
Pivot=50 → [10, 30, 40] 50 → Already sorted

Pass 2 (Right):
Pivot=90 → 80 90 → Already sorted

Final: [10, 30, 40, 50, 70, 80, 90]''',
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
                 Image.asset('quick.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Pseudocode
            _buildSection(
              title: 'Quick Sort Pseudocode',
              content: '''
procedure quickSort(A : list of sortable items, low, high)
    if low < high then
        // Partition the array
        p := partition(A, low, high)
        
        // Recursively sort subarrays
        quickSort(A, low, p - 1)
        quickSort(A, p + 1, high)
    end if
end procedure

procedure partition(A, low, high)
    // Choose pivot (here using last element)
    pivot := A[high]
    
    // Index of smaller element
    i := low - 1
    
    for j := low to high - 1 do
        if A[j] < pivot then
            i := i + 1
            swap A[i] and A[j]
        end if
    end for
    
    // Place pivot in correct position
    swap A[i + 1] and A[high]
    return i + 1
end procedure''',
              icon: Icons.code,
            ),

            // Dart Implementation
            _buildSection(
              title: ' Implementation',
              content: 'Complete implementation of Quick Sort in Dart:',
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
                    'void quickSort(List<int> arr, int low, int high) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  if (low < high) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // Partition index',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    int pi = partition(arr, low, high);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '    // Recursively sort subarrays',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    quickSort(arr, low, pi - 1);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    quickSort(arr, pi + 1, high);',
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
                    'int partition(List<int> arr, int low, int high) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  // Choose pivot (last element)',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int pivot = arr[high];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int i = low - 1; // Index of smaller element',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  for (int j = low; j < high; j++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // If current element is smaller than pivot',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (arr[j] < pivot) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      i++;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      // Swap arr[i] and arr[j]',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      int temp = arr[i];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      arr[i] = arr[j];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      arr[j] = temp;',
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
                    '  // Swap arr[i+1] and pivot',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int temp = arr[i + 1];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  arr[i + 1] = arr[high];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  arr[high] = temp;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return i + 1;',
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
                    '  List<int> numbers = [10, 80, 30, 90, 40, 50, 70];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  quickSort(numbers, 0, numbers.length - 1);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  print(numbers); // [10, 30, 40, 50, 70, 80, 90]',
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
• Best-case: O(n log n) - Good pivot selection
• Average-case: O(n log n) - For random data
• Worst-case: O(n²) - When pivot is smallest/largest element

Space Complexity: O(log n) - Stack space for recursion

Optimization Techniques:
1. Median-of-three pivot selection
2. Insertion sort for small subarrays
3. Tail recursion elimination
4. Three-way partitioning for duplicate keys
5. Randomized quicksort to avoid worst-case''',
              icon: Icons.timer,
            ),

            // Visual Example
            _buildSection(
              title: 'Step-by-Step Visualization',
              content: '''
Initial Array: [10, 80, 30, 90, 40, 50, 70]

Pass 1 (Pivot=70):
Partition: [10, 30, 40, 50] 70 [80, 90]

Pass 2 (Left):
Pivot=50 → [10, 30, 40] 50 → Already sorted

Pass 2 (Right):
Pivot=90 → 80 90 → Already sorted

Final: [10, 30, 40, 50, 70, 80, 90]

Partitioning Process (First Pass):
Initial: [10, 80, 30, 90, 40, 50, 70] (pivot=70)
- 10 < 70 → swap with self (i=0)
- 80 > 70 → no swap
- 30 < 70 → swap with 80 → [10, 30, 80, 90, 40, 50, 70] (i=1)
- 90 > 70 → no swap
- 40 < 70 → swap with 80 → [10, 30, 40, 90, 80, 50, 70] (i=2)
- 50 < 70 → swap with 90 → [10, 30, 40, 50, 80, 90, 70] (i=3)
Final swap pivot with arr[i+1] → [10, 30, 40, 50, 70, 90, 80]''',
              icon: Icons.animation,
            ),

            // When to Use
            _buildSection(
              title: 'When to Use Quick Sort',
              content: '''
Quick Sort is ideal for:
1. General-purpose sorting of large datasets
2. When average-case performance matters more than worst-case
3. In-memory sorting (not suitable for external sorting)
4. When cache performance is important
5. Situations where in-place sorting is preferred

For scenarios requiring stable sorting or guaranteed O(n log n), consider:
• Merge Sort (stable, consistent performance)
• Heap Sort (in-place with O(n log n) worst-case)
• TimSort (hybrid optimized for real-world data)

Real-world Applications:
1. Default sorting in many languages/frameworks
2. Used in UNIX qsort function
3. Database query optimization
4. Numerical computations and statistical operations''',
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