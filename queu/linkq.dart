import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Linkq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Queue Using Linked List', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Linked List Queue',
              content: '''
A queue implemented using linked list nodes with dynamic size.

Key Features:
• Uses nodes with data and next pointer
• Front pointer points to first node
• Rear pointer points to last node
• Dynamic size (grows as needed)
• No fixed capacity limitation

Operations:
1. Enqueue: Add element at rear
2. Dequeue: Remove element from front
3. Peek: View front element
4. isEmpty check''',
              icon: Icons.queue,
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
Text(' Example Queue Linked List',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('llq.webp',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Node Structure
            _buildSection(
              title: 'Node Class',
              content: 'Basic building block of linked list queue:',
              icon: Icons.account_tree,
            ),
            _buildCodeBlock('''
class Node {
    int data;
    Node next;
    
    public Node(int data) {
        this.data = data;
        this.next = null;
    }
}'''),

            // Queue Implementation
            _buildSection(
              title: 'LinkedListQueue Class',
              content: 'Complete linked list queue implementation:',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
public class LinkedListQueue {
    private Node front, rear;
    
    public LinkedListQueue() {
        this.front = this.rear = null;
    }
    
    /**
     * Enqueue operation - adds element to rear
     * @param item The element to add
     */
    public void enqueue(int item) {
        Node newNode = new Node(item);
        
        if (rear == null) {
            front = rear = newNode;
            return;
        }
        
        rear.next = newNode;
        rear = newNode;
    }
    
    /**
     * Dequeue operation - removes and returns front element
     * @return The removed element
     * @throws NoSuchElementException if queue is empty
     */
    public int dequeue() {
        if (isEmpty()) {
            throw new NoSuchElementException("Queue is empty");
        }
        
        int item = front.data;
        front = front.next;
        
        if (front == null) {
            rear = null;
        }
        
        return item;
    }
    
    // Peek at front element without removing
    public int peek() {
        if (isEmpty()) {
            throw new NoSuchElementException("Queue is empty");
        }
        return front.data;
    }
    
    // Check if queue is empty
    public boolean isEmpty() {
        return front == null;
    }
    
    // Print queue elements
    public void display() {
        Node current = front;
        while (current != null) {
            System.out.print(current.data + " ");
            current = current.next;
        }
        System.out.println();
    }
}'''),

            // Enqueue Operation
            _buildSection(
              title: 'Enqueue Operation',
              content: '''
Adds an element to the rear of the queue.

Steps:
1. Create new node with the given data
2. If queue is empty, set both front and rear to new node
3. Otherwise, link current rear node to new node
4. Update rear pointer to new node

Time Complexity: O(1) - Constant time

Visualization:
Initial: Front → [A] → [B] → [C] ← Rear
After enqueue(D): Front → [A] → [B] → [C] → [D] ← Rear''',
              icon: Icons.input,
            ),

            // Dequeue Operation
            _buildSection(
              title: 'Dequeue Operation',
              content: '''
Removes and returns the front element of the queue.

Steps:
1. Check if queue is empty (throw exception if empty)
2. Store front node's data
3. Move front pointer to next node
4. If front becomes null, set rear to null (queue is now empty)
5. Return the stored data

Time Complexity: O(1) - Constant time

Visualization:
Initial: Front → [A] → [B] → [C] → [D] ← Rear
After dequeue(): Front → [B] → [C] → [D] ← Rear''',
              icon: Icons.output,
            ),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the LinkedListQueue class:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        LinkedListQueue queue = new LinkedListQueue();
        
        // Enqueue elements
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        
        System.out.println("Front element: " + queue.peek()); // 10
        queue.display(); // Prints: 10 20 30
        
        // Dequeue elements
        System.out.println("Dequeued: " + queue.dequeue()); // 10
        System.out.println("Dequeued: " + queue.dequeue()); // 20
        
        // Check empty
        System.out.println("Is empty? " + queue.isEmpty()); // false
        
        // Clear queue
        queue.dequeue();
        System.out.println("Is empty? " + queue.isEmpty()); // true
    }
}'''),

            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: 'Performance characteristics:',
              icon: Icons.timer,
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Operation', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Time', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Space', style: TextStyle(color: Colors.white))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Enqueue', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Dequeue', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Peek', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Search', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
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