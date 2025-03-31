import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/queu/he1.dart';
import 'package:flutter/material.dart';

class Heap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Heap', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('What is Heap?'),
            _buildText(
              'A Heap is a complete binary tree that follows the heap property:\n'
              '1. **Max Heap**: The parent node is always greater than or equal to its children.\n'
              '2. **Min Heap**: The parent node is always smaller than or equal to its children.\n\n'
              'Heaps are primarily used in **priority queues** and **Heap Sort**.',
            ),
            SizedBox(height: 15,),
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
Text(' Example of Heap Operation',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('he.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            _buildSectionTitle('Max Heap Example:'),
            _buildCodeBlock(
              '''
       50
      /  \\
    30    40
   /  \\   /
  10  20 15
              ''',
            ),
            _buildSectionTitle('Min Heap Example:'),
            _buildCodeBlock(
              '''
       10
      /  \\
    30    20
   /  \\   /
  50   40 15
              ''',
            ),
            SizedBox(height: 15,),
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
Text('Max Heap and Min Heap Algorithm  ',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('maxmin.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            _buildSectionTitle('Heap Operations'),
           SizedBox(height: 15,),
           const He1(),
            _buildSectionTitle('Heap Sort Algorithm'),
            _buildText(
              '**Steps:**\n'
              '1. Convert the array into a **Max Heap**.\n'
              '2. Swap the first (largest) element with the last.\n'
              '3. Remove the last element and heapify the root.\n'
              '4. Repeat until all elements are sorted.',
            ),
            _buildSectionTitle('Time Complexity:'),
            _buildText(
              '- **Best Case:** O(N log N)\n'
              '- **Worst Case:** O(N log N)\n'
              '- **Average Case:** O(N log N)',
            ),
            _buildSectionTitle('Applications of Heap'),
            _buildText(
              '- **Priority Queues** (Task Scheduling, Dijkstra’s Algorithm).\n'
              '- **Heap Sort** (Sorting large datasets efficiently).\n'
              '- **Graph Algorithms** (Prim’s and Dijkstra’s Algorithm).',
            ),
          ],
        ),
      ),
    );
  }

  // Widget for section title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
      ),
    );
  }

  // Widget for body text
  Widget _buildText(String content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        content,
        style: TextStyle(fontSize: 14, color: Colors.white70),
      ),
    );
  }

  // Widget for code block
  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 5, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: TextStyle(fontSize: 16, fontFamily: 'monospace', color: Colors.white),
      ),
    );
  }
}
