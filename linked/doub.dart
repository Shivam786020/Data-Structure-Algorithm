import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Doub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Doubly Linked List', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Theory of Doubly Linked List',
              content: '''
A doubly linked list is an advanced version of a linked list where each node contains:
1. Data - stores the actual value
2. Next - pointer to the next node
3. Prev - pointer to the previous node

Characteristics:
• Bidirectional traversal (forward/backward)
• More flexible than singly linked list
• Requires extra memory for prev pointer
• Operations are slightly more complex
• First node's prev = NULL
• Last node's next = NULL

Visual Representation:
NULL ⇄ [Data|Prev|Next] ⇄ [Data|Prev|Next] ⇄ ... ⇄ NULL''',
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
Text(' Example Doubly Linked List',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('dl.PNG',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Node Structure
            _buildSection(
              title: 'Node Structure',
              content: 'Each node contains three parts:',
              icon: Icons.account_tree,
            ),
            _buildCodeBlock('''
class Node {
    int data;       // Stores the value
    Node prev;      // Reference to previous node
    Node next;      // Reference to next node
    
    // Constructor
    public Node(int data) {
        this.data = data;
        this.prev = null;
        this.next = null;
    }
}'''),

            // Insertion Operations
            _buildSection(
              title: '1. Insertion Operations',
              content: 'Four main insertion methods:',
              icon: Icons.add_circle,
            ),
            
            // Insert at Head
            _buildSubSection('1.1 Insert at Head'),
            _buildCodeBlock('''
public void insertAtHead(int data) {
    Node newNode = new Node(data);
    
    if (head == null) {
        head = tail = newNode;
        return;
    }
    
    newNode.next = head;
    head.prev = newNode;
    head = newNode;
    // Time Complexity: O(1)
}'''),
            
            // Insert at Tail
            _buildSubSection('1.2 Insert at Tail'),
            _buildCodeBlock('''
public void insertAtTail(int data) {
    Node newNode = new Node(data);
    
    if (tail == null) {
        head = tail = newNode;
        return;
    }
    
    tail.next = newNode;
    newNode.prev = tail;
    tail = newNode;
    // Time Complexity: O(1)
}'''),
            
            // Insert After Node
            _buildSubSection('1.3 Insert After Specific Node'),
            _buildCodeBlock('''
public void insertAfter(Node prevNode, int data) {
    if (prevNode == null) {
        System.out.println("Previous node cannot be null");
        return;
    }
    
    Node newNode = new Node(data);
    newNode.next = prevNode.next;
    newNode.prev = prevNode;
    
    if (prevNode.next != null) {
        prevNode.next.prev = newNode;
    } else {
        tail = newNode; // Update tail if inserting at end
    }
    
    prevNode.next = newNode;
    // Time Complexity: O(1)
}'''),

            // Insert Before Node
            _buildSubSection('1.4 Insert Before Specific Node'),
            _buildCodeBlock('''
public void insertBefore(Node nextNode, int data) {
    if (nextNode == null) {
        System.out.println("Next node cannot be null");
        return;
    }
    
    Node newNode = new Node(data);
    newNode.prev = nextNode.prev;
    newNode.next = nextNode;
    
    if (nextNode.prev != null) {
        nextNode.prev.next = newNode;
    } else {
        head = newNode; // Update head if inserting at start
    }
    
    nextNode.prev = newNode;
    // Time Complexity: O(1)
}'''),

            // Deletion Operations
            _buildSection(
              title: '2. Deletion Operations',
              content: 'Three main deletion methods:',
              icon: Icons.remove_circle,
            ),
            
            // Delete from Head
            _buildSubSection('2.1 Delete from Head'),
            _buildCodeBlock('''
public void deleteFromHead() {
    if (head == null) return;
    
    if (head == tail) {
        head = tail = null;
        return;
    }
    
    head = head.next;
    head.prev = null;
    // Time Complexity: O(1)
}'''),
            
            // Delete from Tail
            _buildSubSection('2.2 Delete from Tail'),
            _buildCodeBlock('''
public void deleteFromTail() {
    if (tail == null) return;
    
    if (head == tail) {
        head = tail = null;
        return;
    }
    
    tail = tail.prev;
    tail.next = null;
    // Time Complexity: O(1)
}'''),
            
            // Delete Specific Node
            _buildSubSection('2.3 Delete Specific Node'),
            _buildCodeBlock('''
public void deleteNode(Node node) {
    if (node == null) return;
    
    if (node == head) {
        deleteFromHead();
        return;
    }
    
    if (node == tail) {
        deleteFromTail();
        return;
    }
    
    node.prev.next = node.next;
    node.next.prev = node.prev;
    // Time Complexity: O(1)
}'''),

            // Traversal Operations
            _buildSection(
              title: '3. Traversal Operations',
              content: 'Forward and backward traversal:',
              icon: Icons.compare_arrows,
            ),
            
            // Forward Traversal
            _buildSubSection('3.1 Forward Traversal (Head to Tail)'),
            _buildCodeBlock('''
public void printForward() {
    Node current = head;
    while (current != null) {
        System.out.print(current.data + " ");
        current = current.next;
    }
    System.out.println();
    // Time Complexity: O(n)
}'''),
            
            // Backward Traversal
            _buildSubSection('3.2 Backward Traversal (Tail to Head)'),
            _buildCodeBlock('''
public void printBackward() {
    Node current = tail;
    while (current != null) {
        System.out.print(current.data + " ");
        current = current.prev;
    }
    System.out.println();
    // Time Complexity: O(n)
}'''),

            // Complete Implementation
            _buildSection(
              title: 'Complete Java Implementation',
              content: 'All operations combined in one class:',
              icon: Icons.integration_instructions,
            ),
            _buildCodeBlock('''
public class DoublyLinkedList {
    Node head, tail;
    
    // Node class
    class Node {
        int data;
        Node prev, next;
        
        public Node(int data) {
            this.data = data;
        }
    }
    
    // Insertion methods
    public void insertAtHead(int data) { /* shown above */ }
    public void insertAtTail(int data) { /* shown above */ }
    public void insertAfter(Node prevNode, int data) { /* shown above */ }
    public void insertBefore(Node nextNode, int data) { /* shown above */ }
    
    // Deletion methods
    public void deleteFromHead() { /* shown above */ }
    public void deleteFromTail() { /* shown above */ }
    public void deleteNode(Node node) { /* shown above */ }
    
    // Traversal methods
    public void printForward() { /* shown above */ }
    public void printBackward() { /* shown above */ }
    
    // Utility methods
    public boolean isEmpty() {
        return head == null;
    }
}'''),

            // Advantages/Disadvantages
            _buildSection(
              title: '4. Advantages vs Disadvantages',
              content: '',
              icon: Icons.compare,
            ),
            _buildComparisonTable(
              advantages: [
                'Bidirectional traversal',
                'Easier node removal',
                'More efficient reverse operations',
                'Can traverse back from any node'
              ],
              disadvantages: [
                'Extra memory for prev pointer',
                'More complex implementation',
                'Slightly slower insertions/deletions',
                'More pointer operations to maintain'
              ],
            ),

            // Applications
            _buildSection(
              title: '5. Real-world Applications',
              content: '''
• Browser history (forward/back navigation)
• Music/video playlists with previous/next
• Undo/Redo functionality in software
• Navigation systems (alternative routes)
• Blockchain technology
• Image viewers with next/previous''',
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
          // Header
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
          // Rows
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
}