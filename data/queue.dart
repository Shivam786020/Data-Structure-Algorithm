import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/queu/qu1.dart';
import 'package:flutter/material.dart';

class Queue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Queue Data Structure', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Queue Fundamentals',
              content: '''
A queue is a linear data structure that follows the FIFO (First In First Out) principle.

Key Properties:
• Elements are added at the rear (enqueue)
• Elements are removed from the front (dequeue)
• Two main operations: enqueue and dequeue
• Dynamic size (can grow/shrink as needed)
• Has both front and rear pointers

Real-world Analogies:
• People waiting in line
• Printer job queue
• Ticket counter line''',
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
Text(' Example Queue',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('qq.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Types of Queues
            _buildSection(
              title: 'Types of Queues',
              content: '''
1. Simple Queue:
   - Basic FIFO structure
   - Standard enqueue/dequeue operations

2. Circular Queue:
   - Rear connects back to front
   - Efficient space utilization
   - Fixed size

3. Priority Queue:
   - Elements have priority values
   - Higher priority elements dequeued first
   - Can be implemented with heaps

4. Double Ended Queue (Deque):
   - Allows insertion/removal from both ends
   - More flexible than standard queue''',
              icon: Icons.list,
            ),

            // Queue Operations
            _buildSection(
              title: 'Queue Manipulation Operations',
              content: 'Essential queue operations:',
              icon: Icons.build,
            ),
            
            // Enqueue
            _buildSubSection('1. Enqueue (Insert) - O(1)'),
            Text('Adds an element to the rear of the queue', 
              style: TextStyle(color: Colors.white70, fontSize: 16)),
            
            // Dequeue
            _buildSubSection('2. Dequeue (Remove) - O(1)'),
            Text('Removes and returns the front element', 
              style: TextStyle(color: Colors.white70, fontSize: 16)),
            
            // Front/Peek
            _buildSubSection('3. Front/Peek - O(1)'),
            Text('Returns the front element without removing it', 
              style: TextStyle(color: Colors.white70, fontSize: 16)),
            
            // IsEmpty
            _buildSubSection('4. IsEmpty - O(1)'),
            Text('Checks if the queue is empty', 
              style: TextStyle(color: Colors.white70, fontSize: 16)),
            
            // IsFull
            _buildSubSection('5. IsFull - O(1)'),
            Text('Checks if the queue is full (for fixed-size implementations)', 
              style: TextStyle(color: Colors.white70, fontSize: 16)),

            // Implementation
            _buildSection(
              title: 'Queue Implementation',
              content: 'Queue are implement by Two Ways',
              icon: Icons.code,
            ),
            SizedBox(height: 15,),
            const Qu1(),

            // Complexity Analysis
            _buildSection(
              title: 'Time Complexity',
              content: 'Performance of queue operations:',
              icon: Icons.timer,
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Operation', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Array', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Linked List', style: TextStyle(color: Colors.white))),
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
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
              ],
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
        
        queue.enqueue(10);
        queue.enqueue(20);
        queue.enqueue(30);
        
        System.out.println(queue.peek()); // 10
        System.out.println(queue.dequeue()); // 10
        System.out.println(queue.dequeue()); // 20
        
        queue.enqueue(40);
        System.out.println(queue.size()); // 2
    }
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