import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/stack/fu1.dart';
import 'package:dsa_app/stack/fu2.dart';
import 'package:flutter/material.dart';

class Stackk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Stack Data Structure', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Stack Fundamentals',
              content: '''
A stack is a linear data structure that follows the LIFO (Last In First Out) principle. 

Key Properties:
• Insertion and deletion happen at one end (called TOP)
• Last element added is the first to be removed
• Fundamental operations: push, pop, peek
• Dynamic size (can grow/shrink as needed)

Real-world Analogies:
• Stack of plates
• Pile of books
• Browser back button
• Undo/Redo functionality

Visual Representation:
       TOP
       [ ]
       [ ]
       [ ]
       [ ]
       [ ]
       BOTTOM''',
              icon: Icons.layers,
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
Text(' Example Stack',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('st.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Core Operations
            _buildSection(
              title: 'Stack Operations',
              content: 'Essential stack manipulation methods:',
              icon: Icons.build,
            ),
            
            // Push Operation
            _buildSubSection('1. Push (Insert) - O(1)'),
Text('The push operation adds a new element to the top of the stack. It involves the following steps:',
style: TextStyle(color: Colors.white,fontSize: 14,),),
SizedBox(height: 10,),
            _buildCodeBlock('''
public void push(int item) {
    if (isFull()) {
        System.out.println("Stack Overflow");
        return;
    }
    top = top + 1;
    stack[top] = item;
}'''),
            
            // Pop Operation
            _buildSubSection('2. Pop (Remove) - O(1)'),
            Text('The pop operation removes the top element from the stack. It involves the following steps:',
style: TextStyle(color: Colors.white,fontSize: 14,),),
SizedBox(height: 10,),
            _buildCodeBlock('''
public int pop() {
    if (isEmpty()) {
        System.out.println("Stack Underflow");
        return Integer.MIN_VALUE;
    }
    int item = stack[top];
    top = top - 1;
    return item;
}'''),
            
            // Peek Operation
            _buildSubSection('3. Peek (View Top) - O(1)'),
            Text('The peek operation returns the top element without removing it. It involves the following steps:',
style: TextStyle(color: Colors.white,fontSize: 14,),),
SizedBox(height: 10,),
            _buildCodeBlock('''
public int peek() {
    if (isEmpty()) {
        System.out.println("Stack is empty");
        return Integer.MIN_VALUE;
    }
    return stack[top];
}'''),

            // Implementation Options
            _buildSection(
              title: 'Implementation Choices',
              content: 'Two common ways to implement a stack:',
              icon: Icons.settings,
            ),
            SizedBox(height: 10,),
            const Fu1(),
            // Complexity Analysis
            _buildSection(
              title: 'Time Complexity',
              content: 'Performance of stack operations:',
              icon: Icons.timer,
            ),
            _buildComplexityTable(),

            // Applications
            _buildSection(
              title: 'Common Applications',
              content: '''
• Function call management (call stack)
• Expression evaluation and syntax parsing
• Undo mechanisms in text editors
• Back/Forward navigation in browsers
• Memory management
• Balanced parenthesis checking
• Algorithm implementations (DFS, Tower of Hanoi)''',
              icon: Icons.apps,
              
            ),
            SizedBox(height: 10,),
const Fu2(),
            // Advantages/Disadvantages
            _buildSection(
              title: 'Pros and Cons',
              content: '',
              icon: Icons.compare,
            ),
            _buildComparisonTable(
              advantages: [
                'Efficient O(1) operations',
                'Simple to implement',
                'Exact memory usage (no waste)',
                'Fast access to top element'
              ],
              disadvantages: [
                'Limited access (only top element)',
                'Fixed size for array implementation',
                'No efficient search operation',
                'Can overflow (array implementation)'
              ],
            ),

            // Complete Example
            _buildSection(
              title: 'Complete Usage Example',
              content: 'How to use the ArrayStack class:',
              icon: Icons.play_circle_fill,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        ArrayStack stack = new ArrayStack(5);
        
        stack.push(10);  // [10]
        stack.push(20);  // [10, 20]
        stack.push(30);  // [10, 20, 30]
        
        System.out.println(stack.peek()); // 30
        
        stack.pop();     // [10, 20]
        stack.pop();     // [10]
        
        System.out.println(stack.isEmpty()); // false
        
        stack.pop();     // []
        System.out.println(stack.isEmpty()); // true
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
          _buildComplexityRow('Push', 'O(1)', 'O(1)'),
          _buildComplexityRow('Pop', 'O(1)', 'O(1)'),
          _buildComplexityRow('Peek', 'O(1)', 'O(1)'),
          _buildComplexityRow('Search', 'O(n)', 'O(1)'),
          _buildComplexityRow('Access by Index', 'O(n)', 'O(1)'),
          _buildComplexityRow('IsEmpty', 'O(1)', 'O(1)'),
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