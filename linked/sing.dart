import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Sing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Singly Linked List', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Theory of Singly Linked List',
              content: '''
A singly linked list is a linear data structure where each element (called a node) contains:
1. Data - stores the actual value
2. Next - reference (pointer) to the next node

Characteristics:
• Dynamic size (grows/shrinks as needed)
• Sequential access (no random access)
• Memory efficient for insertions/deletions
• Requires O(n) time for search operations
• First node is called HEAD (entry point)
• Last node points to NULL (termination)

Visual Representation:
[HEAD]→[Data|Next]→[Data|Next]→...→[Data|NULL]''',
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
Text(' Example Singly Linked List',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('ss.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Node Structure
            _buildSection(
              title: 'Node Structure',
              content: 'Each node contains:',
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
              content: 'Three ways to insert nodes:',
              icon: Icons.add_circle,
            ),
            
            // Insert at Beginning
            _buildSubSection('1.1 Insert at Beginning (HEAD)'),
            _buildCodeBlock('''
public void insertAtStart(int data) {
    Node newNode = new Node(data);
    newNode.next = head;  // New node points to current head
    head = newNode;       // Update head to new node
    // Time Complexity: O(1)
}'''),
            
            // Insert at End
            _buildSubSection('1.2 Insert at End (TAIL)'),
            _buildCodeBlock('''
public void insertAtEnd(int data) {
    Node newNode = new Node(data);
    
    if (head == null) {   // If list is empty
        head = newNode;
        return;
    }
    
    Node last = head;
    while (last.next != null) {  // Traverse to last node
        last = last.next;
    }
    last.next = newNode;  // Link new node to end
    // Time Complexity: O(n)
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
    newNode.next = prevNode.next;  // New node points to next node
    prevNode.next = newNode;       // Previous node points to new node
    // Time Complexity: O(1)
}'''),

            // Deletion Operations
            _buildSection(
              title: '2. Deletion Operations',
              content: 'Two ways to delete nodes:',
              icon: Icons.remove_circle,
            ),
            
            // Delete by Value
            _buildSubSection('2.1 Delete by Value'),
            _buildCodeBlock('''
public void deleteNode(int key) {
    Node temp = head, prev = null;
    
    // If head node itself holds the key
    if (temp != null && temp.data == key) {
        head = temp.next;  // Change head
        return;
    }
    
    // Search for the key to be deleted
    while (temp != null && temp.data != key) {
        prev = temp;
        temp = temp.next;
    }
    
    if (temp == null) return;  // Key not found
    
    prev.next = temp.next;  // Unlink the node
    // Time Complexity: O(n)
}'''),
            
            // Delete at Position
            _buildSubSection('2.2 Delete at Specific Position'),
            _buildCodeBlock('''
public void deleteAtPosition(int position) {
    if (head == null) return;
    
    Node temp = head;
    
    // If head needs to be removed
    if (position == 0) {
        head = temp.next;
        return;
    }
    
    // Find previous node of the node to be deleted
    for (int i = 0; temp != null && i < position - 1; i++) {
        temp = temp.next;
    }
    
    if (temp == null || temp.next == null) return;
    
    temp.next = temp.next.next;  // Unlink the node
    // Time Complexity: O(n)
}'''),

            // Search Operation
            _buildSection(
              title: '3. Search Operation',
              content: 'Check if a value exists in the list',
              icon: Icons.search,
            ),
            _buildCodeBlock('''
public boolean search(int key) {
    Node current = head;
    while (current != null) {
        if (current.data == key)
            return true;
        current = current.next;
    }
    return false;
    // Time Complexity: O(n)
}'''),

            // Utility Operations
            _buildSection(
              title: '4. Utility Operations',
              content: 'Common helper methods',
              icon: Icons.build,
            ),
            
            // Get Length
            _buildSubSection('4.1 Get List Length'),
            _buildCodeBlock('''
public int getLength() {
    int count = 0;
    Node current = head;
    while (current != null) {
        count++;
        current = current.next;
    }
    return count;
    // Time Complexity: O(n)
}'''),
            
            // Print List
            _buildSubSection('4.2 Print Entire List'),
            _buildCodeBlock('''
public void printList() {
    Node current = head;
    while (current != null) {
        System.out.print(current.data + " ");
        current = current.next;
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
class LinkedList {
    Node head;
    
    // Insertion methods
    public void insertAtStart(int data) { /* shown above */ }
    public void insertAtEnd(int data) { /* shown above */ }
    public void insertAfter(Node prevNode, int data) { /* shown above */ }
    
    // Deletion methods
    public void deleteNode(int key) { /* shown above */ }
    public void deleteAtPosition(int position) { /* shown above */ }
    
    // Utility methods
    public boolean search(int key) { /* shown above */ }
    public int getLength() { /* shown above */ }
    public void printList() { /* shown above */ }
}'''),
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
}