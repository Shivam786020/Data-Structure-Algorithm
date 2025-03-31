import 'package:flutter/material.dart';

class Oper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Array Operations', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'Array Operations Overview',
              content: '''
Arrays support fundamental operations that manipulate their contents. Understanding these operations is crucial for efficient algorithm design. The three core operations are:

1. Traversal: Accessing each element
2. Insertion: Adding new elements
3. Deletion: Removing existing elements

Each operation has different time complexities and memory implications depending on the array implementation (static vs dynamic).''',
              icon: Icons.list,
            ),

            // Traversal Section
            _buildSection(
              title: '1. Traversal (O(n) Time)',
              content: '''
Traversal means visiting each element of the array exactly once. This is fundamental for operations like printing, searching, or applying transformations.

Example:
Consider an array of student grades: [85, 92, 78, 90, 88]

Visualization:
Index:   0   1   2   3   4
Value: 85  92  78  90  88

Traversal Process:
1. Start at index 0 (85)
2. Move to index 1 (92)
3. Continue until index 4 (88)

Dart Implementation:''',
              icon: Icons.traffic,
            ),
            _buildCodeBlock(
              '''
void traverse(List<int> arr) {
  for (int i = 0; i < arr.length; i++) {
    print('Element at index \$i: \${arr[i]}');
    // Can perform operations on each element here
  }
}

// Usage:
traverse([85, 92, 78, 90, 88]);''',
            ),
            Text(
              'Output:',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            _buildCodeBlock(
              '''Element at index 0: 85
Element at index 1: 92
Element at index 2: 78
Element at index 3: 90
Element at index 4: 88''',
              isOutput: true,
            ),

            // Insertion Section
            _buildSection(
              title: '2. Insertion (O(n) Worst Case)',
              content: '''
Insertion adds a new element at a specific position. In static arrays, this may require creating a new larger array and copying elements.

Complexity Cases:
• End insertion: O(1) for dynamic arrays
• Middle insertion: O(n) due to shifting
• Beginning insertion: O(n) due to shifting

Example:
Original array: [10, 20, 30, 40, 50]
Insert 25 at index 2

Step-by-Step:
1. Shift elements from index 2 onward right
   [10, 20, _, 30, 40, 50]
2. Insert new element at index 2
   [10, 20, 25, 30, 40, 50]

 Implementation:''',
              icon: Icons.add_circle,
            ),
            _buildCodeBlock(
              '''
List<int> insert(List<int> arr, int index, int value) {
  // Create new array with increased size
  List<int> newArr = List.from(arr);
  
  // Shift elements to the right
  for (int i = newArr.length - 1; i > index; i--) {
    newArr[i] = newArr[i - 1];
  }
  
  // Insert new value
  newArr[index] = value;
  
  return newArr;
}

// Usage:
final updated = insert([10, 20, 30, 40, 50], 2, 25);
print(updated); // [10, 20, 25, 30, 40, 50]''',
            ),
            SizedBox(height: 10),
            Text(
              'Memory Impact:',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            _buildMemoryVisualization(
              before: ['10', '20', '30', '40', '50'],
              after: ['10', '20', '25', '30', '40', '50'],
              changedIndex: 2,
            ),

            // Deletion Section
            _buildSection(
              title: '3. Deletion (O(n) Worst Case)',
              content: '''
Deletion removes an element from a specific position, requiring shifting of subsequent elements to fill the gap.

Complexity Cases:
• End deletion: O(1) for dynamic arrays
• Middle deletion: O(n) due to shifting
• Beginning deletion: O(n) due to shifting

Example:
Original array: [10, 20, 25, 30, 40, 50]
Delete element at index 3 (value 30)

Step-by-Step:
1. Remove element at index 3
   [10, 20, 25, _, 40, 50]
2. Shift elements left to fill gap
   [10, 20, 25, 40, 50]

 Implementation:''',
              icon: Icons.remove_circle,
            ),
            _buildCodeBlock(
              '''
List<int> delete(List<int> arr, int index) {
  // Create new array
  List<int> newArr = List.from(arr);
  
  // Shift elements to the left
  for (int i = index; i < newArr.length - 1; i++) {
    newArr[i] = newArr[i + 1];
  }
  
  // Remove last element
  newArr.removeLast();
  
  return newArr;
}

// Usage:
final updated = delete([10, 20, 25, 30, 40, 50], 3);
print(updated); // [10, 20, 25, 40, 50]''',
            ),
            SizedBox(height: 10),
            Text(
              'Memory Impact:',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            _buildMemoryVisualization(
              before: ['10', '20', '25', '30', '40', '50'],
              after: ['10', '20', '25', '40', '50'],
              changedIndex: 3,
              isDeletion: true,
            ),

            // Comparison Section
            _buildSection(
              title: 'Operation Comparison',
              content: '''
| Operation  | Time Complexity | Space Complexity | Notes                          |
|------------|-----------------|------------------|--------------------------------|
| Traversal  | O(n)            | O(1)             | Must visit each element        |
| Insertion  | O(n)            | O(n)             | Worst case at beginning        |
| Deletion   | O(n)            | O(n)             | Worst case at beginning        |
| Access     | O(1)            | O(1)             | Direct index access            |

Key Observations:
1. Arrays excel at random access but suffer for insertions/deletions
2. Dynamic arrays (like Dart Lists) handle resizing automatically
3. Frequent insertions/deletions may warrant linked lists instead''',
              icon: Icons.compare,
            ),

            // Practical Tips
            _buildSection(
              title: 'Practical Tips',
              content: '''
1. For frequent insertions at end, use Dart's List.add() (O(1) amortized)
2. When inserting/deleting in middle, consider:
   - Using a different data structure if performance critical
   - Batching operations to minimize shifts
3. Pre-allocate capacity when possible: List<int>(100)
4. Use List.insert() and List.removeAt() for convenience
5. Remember that each shift operation requires memory writes''',
              icon: Icons.lightbulb,
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

  Widget _buildCodeBlock(String code, {bool isOutput = false}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10, bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isOutput ? Colors.grey[800] : Colors.black,
        borderRadius: BorderRadius.circular(8),
        border: isOutput ? Border.all(color: Colors.grey) : null,
      ),
      child: SelectableText(
        code,
        style: TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
          color: isOutput ? Colors.white70 : Colors.white,
        ),
      ),
    );
  }

  Widget _buildMemoryVisualization({
    required List<String> before,
    required List<String> after,
    required int changedIndex,
    bool isDeletion = false,
  }) {
    return Column(
      children: [
        Text('Before:', style: TextStyle(color: Colors.white70)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: before.asMap().entries.map((entry) {
            final index = entry.key;
            final value = entry.value;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: index == changedIndex ? Colors.red[300] : Colors.blue[800],
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 15),
        Icon(isDeletion ? Icons.remove : Icons.add, color: Colors.white),
        SizedBox(height: 15),
        Text('After:', style: TextStyle(color: Colors.white70)),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: after.asMap().entries.map((entry) {
            final index = entry.key;
            final value = entry.value;
            final isNew = isDeletion 
                ? (index >= changedIndex && before.length > after.length)
                : (index == changedIndex);
            
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isNew ? Colors.green[300] : Colors.blue[800],
                border: Border.all(color: Colors.white54),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                value,
                style: TextStyle(color: Colors.white),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}