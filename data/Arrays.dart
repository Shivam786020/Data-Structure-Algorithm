import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/arry/alar.dart';
import 'package:dsa_app/arry/ope.dart';
import 'package:flutter/material.dart';

class Arrays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Arrays: Complete Guide', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Introduction to Arrays',
              content: '''
Arrays are fundamental data structures that store elements of the same type in contiguous memory locations. They provide O(1) random access to elements using indices, making them one of the most efficient data structures for indexed operations.

Key Characteristics:
• Fixed size (static arrays) or dynamic size
• Homogeneous elements (same data type)
• Contiguous memory allocation
• Zero-based or one-based indexing

Real-world Analogies:
1. A parking lot where each space is numbered
2. A bookcase where each shelf is labeled
3. An egg carton with fixed compartments''',
              icon: Icons.storage,
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
Text('Array Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('arr1.webp',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // 1D Arrays with Detailed Example
            _buildSection(
              title: '1D Arrays: Deep Dive',
              content: '''
A one-dimensional array is the simplest form of array that represents a linear collection of elements.

Example:
Consider an array representing daily temperatures for a week:
Index:    [0]   [1]   [2]   [3]   [4]   [5]   [6]
Value:   [72,   75,   68,   79,   74,   71,   69]

Memory Allocation:
Each element occupies adjacent memory locations:
Address: 1000 1004 1008 1012 1016 1020 1024
Value:    72    75    68    79    74    71    69

Operations and Complexities:

1. Access (temperature[3]):
   - Direct calculation: base_address + (index × size)
   - Time: O(1)
   - Example: temperature[3] = 79 (immediate access)

2. Search (find 74):
   - Linear search: O(n) worst case
   - Binary search (if sorted): O(log n)
   - Example: Must check each element until found

3. Insertion (add 77 at index 2):
   - Requires shifting all subsequent elements
   - Time: O(n)
   - Example: [72, 75, 77, 68, 79, 74, 71, 69]

4. Deletion (remove at index 4):
   - Requires shifting all subsequent elements back
   - Time: O(n)
   - Example: [72, 75, 77, 68, 74, 71, 69]''',
              icon: Icons.view_array,
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
Text('1D Array Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('arro.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // 2D Arrays with Detailed Example
            _buildSection(
              title: '2D Arrays: Complete Explanation',
              content: '''
Two-dimensional arrays represent tabular data with rows and columns, essential for matrices, images, and grid-based systems.

Example - Classroom Seating Chart:
Row 0: [A, B, C, D]
Row 1: [E, F, G, H]
Row 2: [I, J, K, L]

Memory Layout Options:

1. Row-major Order (used in C, Java, Dart):
   Stores row elements contiguously:
   [A, B, C, D, E, F, G, H, I, J, K, L]
   
   Address calculation:
   address = base + (i * cols + j) * size

2. Column-major Order (used in Fortran, MATLAB):
   Stores column elements contiguously:
   [A, E, I, B, F, J, C, G, K, D, H, L]
   
   Address calculation:
   address = base + (j * rows + i) * size

Operations and Complexities:

1. Access (seatingChart[1][2]):
   - Time: O(1)
   - Example: Returns 'G'

2. Traversal:
   - Time: O(rows × cols)
   - Example: Print all seats row by row

3. Row/Column Operations:
   - Sum a row: O(cols)
   - Sum a column: O(rows)''',
              icon: Icons.grid_on,
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
Text('2D Array Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('roc.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Sparse Matrices with Detailed Example
            _buildSection(
              title: 'Sparse Matrices: In-Depth',
              content: '''
Sparse matrices are 2D arrays where most elements are zero, commonly used in scientific computing and graph algorithms.

Example - Weather Station Network:
Original 5x5 Matrix (mostly zeros):
[ 0, 0, 0, 0, 0 ]
[ 0, 0, 72, 0, 0 ]
[ 0, 0, 0, 0, 68 ]
[ 0, 71, 0, 0, 0 ]
[ 0, 0, 0, 0, 0 ]

Storage Formats:

1. Coordinate Format (COO):
   List of (row, col, value) tuples:
   [(1,2,72), (2,4,68), (3,1,71)]

2. Compressed Sparse Row (CSR):
   - Values: [72, 68, 71]
   - Column indices: [2, 4, 1]
   - Row pointers: [0, 1, 2, 3]

Memory Savings:
• Original: 25 elements × 4 bytes = 100 bytes
• COO: 3 tuples × 12 bytes = 36 bytes (64% savings)

Operations:
• Matrix-vector multiplication becomes more efficient
• Specialized algorithms skip zero elements''',
              icon: Icons.grid_4x4,
            ),

            // Array Algorithms with Detailed Examples
            _buildSection(
              title: 'Essential Array Algorithms',
              content: '''
1. Binary Search (O(log n)):
   Example: Finding a word in dictionary
   Steps:
   - Start with sorted array [2, 5, 8, 12, 16, 23, 38, 56, 72, 91]
   - Search for 23:
     1. Compare middle element (16) - too small
     2. Search right half [23, 38, 56, 72, 91]
     3. Compare new middle (56) - too large
     4. Search left portion [23, 38]
     5. Find 23 at index 5

2. Kadane's Algorithm (O(n)):
   Example: Maximum subarray sum
   Array: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
   Process:
   - Track current and max sums
   - Current subarray: [4, -1, 2, 1] gives sum 6
   - No larger contiguous sum exists

3. Dutch National Flag (O(n)):
   Example: Sorting [2,0,2,1,1,0] to [0,0,1,1,2,2]
   Process:
   - Three pointers: low, mid, high
   - Swap elements to group 0s, 1s, and 2s

4. Sliding Window (O(n)):
   Example: Find max sum of 3 consecutive elements
   Array: [4, 2, 1, 7, 8, 1, 2, 8, 1, 0]
   Process:
   - Window 1: 4+2+1 = 7
   - Window 2: 2+1+7 = 10
   - Window 3: 1+7+8 = 16 (max found)
   - Continue sliding window right''',
              icon: Icons.psychology,
            ),
_buildSection(title: 'Array Operations',
 content: '''
There are 3 Types of Array Operations:

1. Traversal: Visiting each element in the array
2. Deletion: Removing an element from the array
3. Insertion: Adding an element to the array
''', icon: Icons.merge_type),
SizedBox(height: 10,),
const Alar(),
            // Implementation Examples

             _buildSection(
              title: 'Algorithms in Arrays',
              content: 'Various algorithms can be implemented using arrays:',
              icon: Icons.code,
            ),
SizedBox(height: 10,),
const Ope(),

            _buildSection(
              title: 'Practical Implementations',
              content: 'Complete Dart code examples for array operations:',
              icon: Icons.code,
            ),
            _buildCodeBlock(
              'Binary Search Implementation',
              '''
int binarySearch(List<int> arr, int target) {
  int left = 0;
  int right = arr.length - 1;
  
  while (left <= right) {
    int mid = left + (right - left) ~/ 2;
    if (arr[mid] == target) {
      return mid;
    } else if (arr[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1; // Not found
}''',
            ),
            _buildCodeBlock(
              '2D Array Matrix Multiplication',
              '''
List<List<int>> matrixMultiply(List<List<int>> a, List<List<int>> b) {
  int aRows = a.length;
  int aCols = a[0].length;
  int bCols = b[0].length;
  
  List<List<int>> result = List.generate(aRows, (_) => List.filled(bCols, 0));
  
  for (int i = 0; i < aRows; i++) {
    for (int j = 0; j < bCols; j++) {
      for (int k = 0; k < aCols; k++) {
        result[i][j] += a[i][k] * b[k][j];
      }
    }
  }
  return result;
}''',
            ),
            _buildCodeBlock(
              'Sparse Matrix Representation',
              '''
class SparseMatrix {
  List<int> values = [];
  List<int> colIndices = [];
  List<int> rowPointers = [];
  int rows, cols;

  SparseMatrix(this.rows, this.cols);

  void fromDense(List<List<int>> matrix) {
    rowPointers.add(0);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (matrix[i][j] != 0) {
          values.add(matrix[i][j]);
          colIndices.add(j);
        }
      }
      rowPointers.add(values.length);
    }
  }
}''',
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
        SizedBox(height: 20),
        Row(
          children: [
            Icon(icon, color: Colors.blueAccent, size: 28),
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
        SizedBox(height: 15),
        Text(
          content,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeBlock(String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SelectableText(
            code,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}