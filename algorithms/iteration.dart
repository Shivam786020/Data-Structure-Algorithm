import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Iteration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Iteration vs Recursion', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'Iteration vs Recursion',
              content: 'Two fundamental approaches for repetitive operations in programming, each with distinct characteristics and use cases.',
              icon: Icons.compare,
            ),
            
            // Comparison Table
            DataTable(
              columns: [
                DataColumn(label: Text('Aspect', style: TextStyle(color: Colors.white)),),
                DataColumn(label: Text('Iteration', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Recursion', style: TextStyle(color: Colors.white))),
              ],
              rows: [
                _buildTableRow('Definition', 'Uses loops (for, while)', 'Calls itself'),
                _buildTableRow('Memory', 'Generally less memory', 'Uses call stack (more memory)'),
                _buildTableRow('Speed', 'Usually faster', 'Slower due to function calls'),
                _buildTableRow('Readability', 'Straightforward', 'Elegant for recursive problems'),
                _buildTableRow('Termination', 'Loop condition', 'Base case'),
                _buildTableRow('Use Cases', 'Simple repetition', 'Divide-and-conquer, tree/graph traversal'),
              ],
            ),
            
            SizedBox(height: 25),
            
            // Iteration Section
            _buildSection(
              title: 'Iteration (Loops)',
              content: 'Repeats a block of code using loop constructs until a condition is met.',
              icon: Icons.loop,
            ),
            
            // Iterative Factorial Example
            Text(
              'Iterative Factorial (n!)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'int factorialIterative(int n) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int result = 1;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  for (int i = 1; i <= n; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    result *= i;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return result;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Recursion Section
            _buildSection(
              title: 'Recursion',
              content: 'A function that calls itself directly or indirectly, breaking problems into smaller subproblems.',
              icon: Icons.call_split,
            ),
            
            // Recursive Factorial Example
            Text(
              'Recursive Factorial (n!)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'int factorialRecursive(int n) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  // Base case',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  if (n == 0 || n == 1) return 1;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  // Recursive case',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return n * factorialRecursive(n - 1);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
          
            SizedBox(height: 25),
            
            // When to Use Each
            _buildSection(
              title: 'When to Use Each Approach',
              content: '''
**Use Iteration When**:
• Performance is critical
• Memory usage needs to be minimized
• Problem is naturally iterative (e.g., array processing)
• Risk of stack overflow with recursion

**Use Recursion When**:
• Problem can be divided into similar subproblems
• Working with recursive data structures (trees, graphs)
• Solution is more readable/understandable recursively
• Language supports tail call optimization''',
              icon: Icons.help,
            ),
            
            SizedBox(height: 25),
            
            // Fibonacci Comparison
            _buildSection(
              title: 'Fibonacci Sequence Comparison',
              content: 'Both approaches can solve the same problems, but with different tradeoffs:',
              icon: Icons.compare_arrows,
            ),
            
            // Fibonacci Iterative
            Text(
              'Iterative Fibonacci',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'int fibIterative(int n) {\n'
                '  if (n <= 1) return n;\n'
                '  int a = 0, b = 1;\n'
                '  for (int i = 2; i <= n; i++) {\n'
                '    int c = a + b;\n'
                '    a = b;\n'
                '    b = c;\n'
                '  }\n'
                '  return b;\n'
                '}',
                style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
              ),
            ),
            
            SizedBox(height: 15),
            
            // Fibonacci Recursive
            Text(
              'Recursive Fibonacci',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'int fibRecursive(int n) {\n'
                '  if (n <= 1) return n;\n'
                '  return fibRecursive(n-1) + fibRecursive(n-2);\n'
                '}',
                style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
              ),
            ),
            
            SizedBox(height: 25),
            
            // Key Differences
            _buildSection(
              title: 'Key Differences',
              content: '''
1. **Stack Usage**: Recursion uses call stack, iteration doesn't
2. **Code Size**: Recursive code is often shorter
3. **Performance**: Iteration avoids function call overhead
4. **State**: Iteration maintains state in variables, recursion in parameters
5. **Debugging**: Iteration is often easier to debug''',
              icon: Icons.difference,
            ),
          
          ])
      )
      
    );
  }

  Widget _buildSection({required String title, required String content, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

  DataRow _buildTableRow(String aspect, String iteration, String recursion) {
    return DataRow(
      cells: [
        DataCell(Text(aspect, style: TextStyle(color: Colors.white))),
        DataCell(Text(iteration, style: TextStyle(color: Colors.white))),
        DataCell(Text(recursion, style: TextStyle(color: Colors.white))),
      ],
    );
  }
}