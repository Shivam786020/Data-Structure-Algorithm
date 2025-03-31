import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Circu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Circular Linked List', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Theory of Circular Linked List',
              content: '''
A circular linked list is a variation where:
• The last node points back to the first node (instead of NULL)
• Can be singly or doubly circular
• No real "end" - forms a continuous loop

Characteristics:
• Continuous circular traversal possible
• Useful for round-robin scheduling
• No need for NULL checks during traversal
• Can start traversal from any node
• More complex insertion/deletion operations

Types:
1. Singly Circular: Last → First (single direction)
2. Doubly Circular: Last ⇄ First (both directions)

Visual Representation:
[HEAD] → [Data|Next] → [Data|Next] → ... → [HEAD]''',
              icon: Icons.lightbulb_outline,
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
Text(' Example Circular Linked List',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('cc.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Node Structure
            _buildSection(
              title: 'Node Structure (Singly Circular)',
              content: 'Basic node structure:',
              icon: Icons.account_tree,
            ),
            _buildCodeBlock('''
class Node {
    int data;       // Stores the value
    Node next;      // Reference to next node
    
    // Constructor
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}'''),

            // Insertion Operations
            _buildSection(
              title: '1. Insertion Operations',
              content: 'Key insertion methods:',
              icon: Icons.add_circle,
            ),
            
            // Insert at Head
            _buildSubSection('1.1 Insert at Head (O(1))'),
            _buildCodeBlock('''
public void insertAtHead(int data) {
    Node newNode = new Node(data);
    
    if (head == null) {
        head = newNode;
        head.next = head; // Circular reference
        return;
    }
    
    Node last = head;
    while (last.next != head) {
        last = last.next;
    }
    
    newNode.next = head;
    head = newNode;
    last.next = head; // Maintain circularity
}'''),
            
            // Insert at Tail
            _buildSubSection('1.2 Insert at Tail (O(n))'),
            _buildCodeBlock('''
public void insertAtTail(int data) {
    Node newNode = new Node(data);
    
    if (head == null) {
        head = newNode;
        head.next = head;
        return;
    }
    
    Node last = head;
    while (last.next != head) {
        last = last.next;
    }
    
    last.next = newNode;
    newNode.next = head; // Point back to head
}'''),

            // Deletion Operations
            _buildSection(
              title: '2. Deletion Operations',
              content: 'Key deletion methods:',
              icon: Icons.remove_circle,
            ),
            
            // Delete Head
            _buildSubSection('2.1 Delete Head (O(n))'),
            _buildCodeBlock('''
public void deleteHead() {
    if (head == null) return;
    
    // Single node case
    if (head.next == head) {
        head = null;
        return;
    }
    
    Node last = head;
    while (last.next != head) {
        last = last.next;
    }
    
    head = head.next;
    last.next = head; // Update last node's reference
}'''),
            
            // Delete Tail
            _buildSubSection('2.2 Delete Tail (O(n))'),
            _buildCodeBlock('''
public void deleteTail() {
    if (head == null) return;
    
    // Single node case
    if (head.next == head) {
        head = null;
        return;
    }
    
    Node secondLast = head;
    while (secondLast.next.next != head) {
        secondLast = secondLast.next;
    }
    
    secondLast.next = head; // Point to head
}'''),

            // Traversal Operation
            _buildSection(
              title: '3. Traversal Operation',
              content: 'Print all elements (O(n))',
              icon: Icons.compare_arrows,
            ),
            _buildCodeBlock('''
public void printList() {
    if (head == null) return;
    
    Node current = head;
    do {
        System.out.print(current.data + " ");
        current = current.next;
    } while (current != head);
    
    System.out.println();
}'''),

            // Complete Implementation
            _buildSection(
              title: 'Complete Java Implementation',
              content: 'All operations combined:',
              icon: Icons.integration_instructions,
            ),
            _buildCodeBlock('''
public class CircularLinkedList {
    Node head;
    
    class Node {
        int data;
        Node next;
        
        public Node(int data) {
            this.data = data;
        }
    }
    
    // Insertion methods
    public void insertAtHead(int data) { /* shown above */ }
    public void insertAtTail(int data) { /* shown above */ }
    
    // Deletion methods
    public void deleteHead() { /* shown above */ }
    public void deleteTail() { /* shown above */ }
    
    // Utility methods
    public void printList() { /* shown above */ }
    public boolean isEmpty() {
        return head == null;
    }
}'''),

            // Complexity Analysis
            _buildSection(
              title: '4. Time Complexity Analysis',
              content: 'Performance of operations:',
              icon: Icons.timer,
            ),
            _buildComplexityTable(),

            // Advantages/Disadvantages
            _buildSection(
              title: '5. Advantages vs Disadvantages',
              content: '',
              icon: Icons.compare,
            ),
            _buildComparisonTable(
              advantages: [
                'Continuous traversal possible',
                'Efficient for round-robin algorithms',
                'No NULL checks needed during traversal',
                'Can model circular relationships'
              ],
              disadvantages: [
                'More complex implementation',
                'Risk of infinite loops if not handled properly',
                'Higher memory usage (no NULL terminators)',
                'Some operations require full traversal'
              ],
            ),

            // Applications
            _buildSection(
              title: '6. Real-world Applications',
              content: '''
• Operating system scheduling (round-robin)
• Multiplayer game turn management
• Music/video playlists with repeat functionality
• Resource allocation in networking
• Fibonacci heap implementation
• Browser history with circular navigation''',
              icon: Icons.apps,
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

  Widget _buildSubSection(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SelectableText(
        code,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildComparisonTable({required List<String> advantages, required List<String> disadvantages}) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Advantages',
                    style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Disadvantages',
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < advantages.length || i < disadvantages.length; i++)
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      i < advantages.length ? '• ${advantages[i]}' : '',
                      style: TextStyle(color: Colors.greenAccent[200]),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      i < disadvantages.length ? '• ${disadvantages[i]}' : '',
                      style: TextStyle(color: Colors.redAccent[200]),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildComplexityTable() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'Operation',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Time Complexity',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Space Complexity',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          _buildComplexityRow('Insert at Head', 'O(n)', 'O(1)'),
          _buildComplexityRow('Insert at Tail', 'O(n)', 'O(1)'),
          _buildComplexityRow('Delete Head', 'O(n)', 'O(1)'),
          _buildComplexityRow('Delete Tail', 'O(n)', 'O(1)'),
          _buildComplexityRow('Search', 'O(n)', 'O(1)'),
          _buildComplexityRow('Traversal', 'O(n)', 'O(1)'),
        ],
      ),
    );
  }

  Widget _buildComplexityRow(String operation, String time, String space) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(operation,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          ),
          Expanded(
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.amber),
            ),
          ),
          Expanded(
            child: Text(
              space,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          ),
        ],
      ),
    );
  }
}