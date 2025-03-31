import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Heaope extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Heap Operations', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Heap Operations (Pseudocode)'),
            _buildOperationTitle('1. Insert Operation'),
            _buildPseudoCode(
              '''
function insert(heap, value):
    1. Add value at the end of the heap
    2. Perform Heapify-Up (Bubble Up)
        - Compare with parent node
        - Swap if necessary
        - Repeat until heap property is restored
              ''',
            ),
            _buildOperationTitle('2. Delete Operation (Remove Root)'),
            _buildPseudoCode(
              '''
function deleteRoot(heap):
    1. Swap root with last element
    2. Remove last element (previous root)
    3. Perform Heapify-Down (Bubble Down)
        - Compare with the larger (or smaller) child
        - Swap if necessary
        - Repeat until heap property is restored
              ''',
            ),
            _buildOperationTitle('3. Heapify Operation'),
            _buildPseudoCode(
              '''
function heapify(array, index):
    1. Compare node at index with its left and right children
    2. Swap with the larger (Max Heap) or smaller (Min Heap) child if needed
    3. Recursively call heapify on the affected subtree
              ''',
            ),
            _buildOperationTitle('4. Build Heap from Array'),
            _buildPseudoCode(
              '''
function buildHeap(array):
    1. Start from last non-leaf node (N/2)
    2. Apply Heapify for each node in reverse level order
              ''',
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

  // Widget for operation title
  Widget _buildOperationTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: 14,  color: Colors.white70),
      ),
    );
  }

  // Widget for pseudocode block
  Widget _buildPseudoCode(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        code,
        style: TextStyle(fontSize: 14, fontFamily: 'monospace', color: Colors.white),
      ),
    );
  }
}
