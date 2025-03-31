import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/sorting/fun3.dart';
import 'package:flutter/material.dart';

class Sort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Sorting Algorithms', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'What is Sorting?',
              content: '''
Sorting is the process of arranging data in a particular order (ascending or descending). It's a fundamental operation in computer science used to:
• Optimize search operations (binary search)
• Prepare data for analysis
• Organize information for human readability
• Improve efficiency of other algorithms

Key Characteristics:
• In-place vs Out-of-place
• Stable vs Unstable
• Adaptive vs Non-adaptive
• Comparison-based vs Non-comparison-based''',
              icon: Icons.sort,
            ),

            // Classification
            _buildSection(
              title: 'Classification of Sorting Algorithms',
              content: '''
1. By Complexity:
   - O(n²): Bubble, Selection, Insertion
   - O(n log n): Merge, Quick, Heap
   - O(n): Counting, Radix, Bucket

2. By Memory Usage:
   - In-place: Bubble, Selection, Insertion, Quick
   - Out-of-place: Merge, Counting, Bucket

3. By Stability:
   - Stable: Bubble, Insertion, Merge, Counting
   - Unstable: Selection, Quick, Heap

4. By Method:
   - Comparison-based: Bubble, Quick, Merge
   - Non-comparison: Counting, Radix''',
              icon: Icons.category,
            ),
_buildSection(title: 'Types of Sorting', content: '', icon: Icons.category),
SizedBox(height: 10,),
const Fun3(),
            // Bubble Sort
            
            // Non-Comparison Sorts
            _buildSection(
              title: 'Non-Comparison Sorts',
              content: '''
1. Counting Sort (O(n+k)):
   - Works by counting occurrences of each element
   - Suitable for small integer ranges
   
2. Radix Sort (O(nk)):
   - Sorts digit by digit from least to most significant
   - Can sort strings with fixed length
   
3. Bucket Sort (O(n²) worst, O(n) average):
   - Distributes elements into buckets
   - Each bucket is sorted individually''',
              icon: Icons.filter_9_plus,
            ),

            // Comparison Table
            DataTable(
              columns: [
                DataColumn(label: Text('Algorithm', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Best', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Average', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Worst', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Space', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Stable', style: TextStyle(color: Colors.white))),
              ],
            
              rows: [
                _buildComparisonRow('Bubble', 'O(n)', 'O(n²)', 'O(n²)', 'O(1)', 'Yes'),
                _buildComparisonRow('Selection', 'O(n²)', 'O(n²)', 'O(n²)', 'O(1)', 'No'),
                _buildComparisonRow('Insertion', 'O(n)', 'O(n²)', 'O(n²)', 'O(1)', 'Yes'),
                _buildComparisonRow('Merge', 'O(n log n)', 'O(n log n)', 'O(n log n)', 'O(n)', 'Yes'),
                _buildComparisonRow('Quick', 'O(n log n)', 'O(n log n)', 'O(n²)', 'O(log n)', 'No'),
                _buildComparisonRow('Heap', 'O(n log n)', 'O(n log n)', 'O(n log n)', 'O(1)', 'No'),
                _buildComparisonRow('Counting', 'O(n+k)', 'O(n+k)', 'O(n+k)', 'O(k)', 'Yes'),
              ],
            ),
      
            SizedBox(height: 25),
            
            // When to Use
            _buildSection(
              title: 'When to Use Which Sort?',
              content: '''
• Small datasets: Insertion/Bubble (simple implementation)
• Medium datasets: Quick/Merge (good average performance)
• Large datasets: Merge/Heap (consistent O(n log n))
• Known small range: Counting/Radix (linear time)
• Nearly sorted data: Insertion (adaptive)
• External sorting: Merge (works well with disk I/O)''',
              icon: Icons.help,
            ),
      
          ]  
      )
      )
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


  DataRow _buildComparisonRow(String name, String best, String avg, String worst, String space, String stable) {
    return DataRow(
      cells: [
        DataCell(Text(name, style: TextStyle(color: Colors.white))),
        DataCell(Text(best, style: TextStyle(color: Colors.white))),
        DataCell(Text(avg, style: TextStyle(color: Colors.white))),
        DataCell(Text(worst, style: TextStyle(color: Colors.white))),
        DataCell(Text(space, style: TextStyle(color: Colors.white))),
        DataCell(Text(stable, style: TextStyle(color: Colors.white))),
      ],
    );
  }
}