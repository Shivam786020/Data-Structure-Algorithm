import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Arr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Array Stack Implementation', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Array-based Stack',
              content: '''
An array-based stack uses a fixed-size array to implement stack operations. 

Key Characteristics:
• Fixed capacity (size must be declared upfront)
• Efficient O(1) push/pop operations
• Uses a 'top' pointer to track the stack top
• Throws stack overflow/underflow exceptions

Visual Representation:
Index: 0   1   2   3   4
      [A, B, C, _, _] 
      top=2 (points to C)''',
              icon: Icons.view_array,
            ),
            SizedBox(height: 10,),
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
Text(' Example Array Implementation',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('as.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Implementation
            _buildSection(
              title: 'Complete Java Implementation',
              content: 'Array-based stack with push and pop:',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
public class ArrayStack {
    private int maxSize;
    private int[] stackArray;
    private int top;
    
    // Constructor
    public ArrayStack(int size) {
        maxSize = size;
        stackArray = new int[maxSize];
        top = -1; // Stack is initially empty
    }
    
    /**
     * Push operation - adds element to top of stack
     * @param value The element to be pushed
     * @throws StackOverflowError if stack is full
     */
    public void push(int value) {
        if (isFull()) {
            throw new StackOverflowError("Stack is full");
        }
        stackArray[++top] = value; // Increment top then insert
    }
    
    /**
     * Pop operation - removes and returns top element
     * @return The popped element
     * @throws EmptyStackException if stack is empty
     */
    public int pop() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return stackArray[top--]; // Return top element then decrement
    }
    
    // Helper methods
    public boolean isEmpty() {
        return (top == -1);
    }
    
    public boolean isFull() {
        return (top == maxSize - 1);
    }
    
    public int peek() {
        if (isEmpty()) {
            throw new EmptyStackException();
        }
        return stackArray[top];
    }
    
    public int size() {
        return top + 1;
    }
}'''),

            // Push Operation
            _buildSection(
              title: 'Push Operation Explained',
              content: '''
Time Complexity: O(1) - Constant time

Steps:
1. Check if stack is full (overflow condition)
2. Increment top pointer
3. Insert new element at top position

Visualization:
Before push(5):
Index: 0   1   2
      [A, B, C] 
      top=2

After push(5):
Index: 0   1   2   3
      [A, B, C, 5] 
      top=3''',
              icon: Icons.arrow_upward,
            ),

            // Pop Operation
            _buildSection(
              title: 'Pop Operation Explained',
              content: '''
Time Complexity: O(1) - Constant time

Steps:
1. Check if stack is empty (underflow condition)
2. Get element at top position
3. Decrement top pointer
4. Return the element

Visualization:
Before pop():
Index: 0   1   2   3
      [A, B, C, 5] 
      top=3

After pop() returns 5:
Index: 0   1   2   3
      [A, B, C, _] 
      top=2''',
              icon: Icons.arrow_downward,
            ),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the ArrayStack class:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        ArrayStack stack = new ArrayStack(5);
        
        // Push elements
        stack.push(10);
        stack.push(20);
        stack.push(30);
        
        System.out.println("Top element: " + stack.peek()); // 30
        System.out.println("Stack size: " + stack.size());  // 3
        
        // Pop elements
        System.out.println("Popped: " + stack.pop()); // 30
        System.out.println("Popped: " + stack.pop()); // 20
        
        // Check empty
        System.out.println("Is empty? " + stack.isEmpty()); // false
        
        // Clear stack
        stack.pop();
        System.out.println("Is empty? " + stack.isEmpty()); // true
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
                  DataCell(Text('Push', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Pop', style: TextStyle(color: Colors.white))),
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
                ]
        )
              ]
      ),
    
    
            // Advantages/Disadvantages
           
            
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