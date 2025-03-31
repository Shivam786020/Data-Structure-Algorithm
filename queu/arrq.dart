import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Arrq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Queue Using Array', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Array-based Queue',
              content: '''
A queue implemented using an array with fixed capacity.

Key Components:
• Array to store elements
• Front pointer (index of first element)
• Rear pointer (index of last element)
• Size/capacity tracking

Operations:
1. Enqueue: Add element at rear
2. Dequeue: Remove element from front
3. Peek: View front element
4. isFull/isEmpty checks''',
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
Text(' Example Queue Using Array',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('aaq.webp',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Implementation
            _buildSection(
              title: 'Java Implementation',
              content: 'Complete array-based queue:',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
public class ArrayQueue {
    private int maxSize;
    private int[] queueArray;
    private int front;
    private int rear;
    private int currentSize;
    
    // Constructor
    public ArrayQueue(int size) {
        maxSize = size;
        queueArray = new int[maxSize];
        front = 0;
        rear = -1;
        currentSize = 0;
    }
    
    /**
     * Enqueue operation - adds element to rear
     * @param item The element to add
     * @throws IllegalStateException if queue is full
     */
    public void enqueue(int item) {
        if (isFull()) {
            throw new IllegalStateException("Queue is full");
        }
        rear = (rear + 1) % maxSize; // Circular increment
        queueArray[rear] = item;
        currentSize++;
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
        int item = queueArray[front];
        front = (front + 1) % maxSize; // Circular increment
        currentSize--;
        return item;
    }
    
    // Peek at front element without removing
    public int peek() {
        if (isEmpty()) {
            throw new NoSuchElementException("Queue is empty");
        }
        return queueArray[front];
    }
    
    // Check if queue is empty
    public boolean isEmpty() {
        return currentSize == 0;
    }
    
    // Check if queue is full
    public boolean isFull() {
        return currentSize == maxSize;
    }
    
    // Get current size
    public int size() {
        return currentSize;
    }
}'''),

            // Enqueue Operation
            _buildSection(
              title: 'Enqueue Operation',
              content: '''
Adds an element to the rear of the queue.

Steps:
1. Check if queue is full (throw exception if full)
2. Increment rear pointer (with circular wrap-around)
3. Insert new element at rear position
4. Increment current size

Time Complexity: O(1) - Constant time

Visualization:
Initial: [A, B, C, _, _] (front=0, rear=2)
After enqueue(D): [A, B, C, D, _] (front=0, rear=3)''',
              icon: Icons.input,
            ),

            // Dequeue Operation
            _buildSection(
              title: 'Dequeue Operation',
              content: '''
Removes and returns the front element of the queue.

Steps:
1. Check if queue is empty (throw exception if empty)
2. Get element at front position
3. Increment front pointer (with circular wrap-around)
4. Decrement current size
5. Return the element

Time Complexity: O(1) - Constant time

Visualization:
Initial: [A, B, C, D, _] (front=0, rear=3)
After dequeue(): [_, B, C, D, _] (front=1, rear=3)''',
              icon: Icons.output,
            ),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the ArrayQueue class:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        ArrayQueue queue = new ArrayQueue(5);
        
        // Enqueue elements
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        
        System.out.println("Front element: " + queue.peek()); // 10
        System.out.println("Queue size: " + queue.size());    // 3
        
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