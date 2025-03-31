import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Linked List Implementation', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Node Structure
            _buildSection(
              title: 'Node Class',
              content: 'Basic building block of linked list:',
              icon: Icons.account_tree,
            ),
            SizedBox(height: 15),
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
                    Image.asset('sl.webp', height: 270, width: 350)
                  ]
                ),
              ),
            ),
            SizedBox(height: 15),
            _buildCodeBlock('''
class Node {
    int data;
    Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}'''),

            // LinkedList Class
            _buildSection(
              title: 'LinkedList Class',
              content: 'Core implementation with head pointer:',
              icon: Icons.list,
            ),
            _buildCodeBlock('''
public class LinkedList {
    Node head;
    
    // Insert at beginning
    public void insertFirst(int data) {
        Node newNode = new Node(data);
        newNode.next = head;
        head = newNode;
    }'''),

            // Push/Insert Operation Theory
            _buildSection(
              title: 'Insert Operation (Push)',
              content: '''
The insertFirst() method adds a new node at the beginning of the linked list (similar to push operation in stack).

Steps:
1. Create a new node with the given data
2. Set the new node's next pointer to current head
3. Update the head pointer to point to the new node

Time Complexity: O(1) - Constant time operation

Visualization:
Before insertion:
HEAD → [A] → [B] → NULL

After insertFirst(X):
HEAD → [X] → [A] → [B] → NULL''',
              icon: Icons.arrow_upward,
            ),

            _buildCodeBlock('''
    // Insert at end
    public void insertLast(int data) {
        Node newNode = new Node(data);
        
        if (head == null) {
            head = newNode;
            return;
        }
        
        Node current = head;
        while (current.next != null) {
            current = current.next;
        }
        current.next = newNode;
    }'''),

            _buildCodeBlock('''
    // Insert after specific node
    public void insertAfter(Node prevNode, int data) {
        if (prevNode == null) {
            System.out.println("Previous node cannot be null");
            return;
        }
        
        Node newNode = new Node(data);
        newNode.next = prevNode.next;
        prevNode.next = newNode;
    }'''),

            _buildCodeBlock('''
    // Delete by key (Pop operation)
    public void deleteByKey(int key) {
        Node current = head, prev = null;
        
        if (current != null && current.data == key) {
            head = current.next;
            return;
        }
        
        while (current != null && current.data != key) {
            prev = current;
            current = current.next;
        }
        
        if (current == null) return;
        
        prev.next = current.next;
    }'''),

            // Pop/Delete Operation Theory
            _buildSection(
              title: 'Delete Operation (Pop)',
              content: '''
The deleteByKey() method removes a node with specific data (similar to pop operation in stack when deleting from head).

Steps to delete from head (special case):
1. Check if head node contains the key
2. If yes, move head pointer to next node
3. The old head node is now unreachable and will be garbage collected

Steps to delete from middle/end:
1. Traverse the list while keeping track of previous node
2. When node with key is found:
   a. Set previous node's next to current node's next
   b. Bypass the node to be deleted
3. If node not found, return without changes

Time Complexity: O(n) - Linear time in worst case

Visualization:
Before deletion of B:
HEAD → [A] → [B] → [C] → NULL

After deleteByKey(B):
HEAD → [A] → [C] → NULL''',
              icon: Icons.arrow_downward,
            ),

            _buildCodeBlock('''
    // Delete at position
    public void deleteAtPosition(int position) {
        if (head == null) return;
        
        Node current = head;
        
        if (position == 0) {
            head = current.next;
            return;
        }
        
        for (int i = 0; current != null && i < position - 1; i++) {
            current = current.next;
        }
        
        if (current == null || current.next == null) return;
        
        current.next = current.next.next;
    }
    
    // Search
    public boolean search(int key) {
        Node current = head;
        while (current != null) {
            if (current.data == key)
                return true;
            current = current.next;
        }
        return false;
    }
    
    // Print list
    public void printList() {
        Node current = head;
        while (current != null) {
            System.out.print(current.data + " ");
            current = current.next;
        }
        System.out.println();
    }
}'''),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the LinkedList class:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        
        // Insert operations (Push)
        list.insertFirst(10);  // List: 10
        list.insertLast(20);   // List: 10 20
        list.insertFirst(5);   // List: 5 10 20
        
        // Insert after specific node
        list.insertAfter(list.head.next, 15); // List: 5 10 15 20
        
        // Delete operations (Pop)
        list.deleteByKey(10);  // List: 5 15 20
        list.deleteAtPosition(1); // List: 5 20
        
        // Search
        System.out.println("Found 20: " + list.search(20));
        
        // Print
        list.printList(); // Output: 5 20
    }
}'''),

            // Complexity Analysis
            _buildSection(
              title: 'Operation Complexities',
              content: 'Time complexities of each operation:',
              icon: Icons.timer,
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Operation', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Time', style: TextStyle(color: Colors.white))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Insert at head (Push)', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Delete from head (Pop)', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Insert at tail', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Delete by key', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Search', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
              ],
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