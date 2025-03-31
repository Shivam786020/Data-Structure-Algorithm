import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Backtrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Backtracking Algorithms', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Backtracking?',
              content: 'Backtracking is a systematic way to iterate through all possible configurations of a search space. It builds candidates incrementally and abandons a candidate ("backtracks") as soon as it determines the candidate cannot possibly lead to a valid solution.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Characteristics
            _buildSection(
              title: 'Key Characteristics',
              content: '''
1. **Incremental Approach**: Builds solutions step-by-step
2. **Pruning**: Eliminates invalid paths early
3. **Recursive Nature**: Naturally implemented with recursion
4. **State Space Tree**: Visualizes all possible states
5. **Depth-First Search**: Explores each path completely before backtracking''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Example Problem
            _buildSection(
              title: 'Classic Example: N-Queens Problem',
              content: '''
Place N chess queens on an N×N chessboard so that no two queens threaten each other.

**4-Queens Solution**:
_ Q _ _
_ _ _ Q
Q _ _ _
_ _ Q _

**Backtracking Steps**:
1. Place queen in first row
2. Move to next row, place where safe
3. If no safe spot, backtrack to previous row
4. Repeat until all queens placed''',
              icon: Icons.grid_on,
            ),
            
            SizedBox(height: 25),
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
                 Image.asset('back.png',height: 290,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Algorithm Steps
            _buildSection(
              title: 'Backtracking Template',
              content: '''
1. **Choose**: Make a choice at current step
2. **Constraints**: Check if choice meets conditions
3. **Recurse**: Move to next decision point
4. **Backtrack**: Undo choice if it leads to dead end
5. **Base Case**: When solution is complete''',
              icon: Icons.account_tree,
            ),
            
            // N-Queens Implementation
            Text(
              'N-Queens Implementation',
              style: TextStyle(
                fontSize: 20,
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
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List<List<String>> solveNQueens(int n) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<List<String>> solutions = [];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> queens = List.filled(n, -1); // queen positions',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  void backtrack(int row) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (row == n) { // Base case: all queens placed',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      solutions.add(_generateBoard(queens, n));',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      return;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (int col = 0; col < n; col++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      if (_isSafe(row, col, queens)) {',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        queens[row] = col; // Place queen',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        backtrack(row + 1); // Recurse next row',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        queens[row] = -1; // Backtrack',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  backtrack(0); // Start from first row',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return solutions;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'bool _isSafe(int row, int col, List<int> queens) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  for (int i = 0; i < row; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // Check same column or diagonal',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (queens[i] == col || (row - i).abs() == (col - queens[i]).abs()) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      return false;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return true;',
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
            
            // Complexity
            _buildSection(
              title: 'Time & Space Complexity',
              content: '''
• **Time Complexity**: O(N!) in worst case
  - But pruning reduces this significantly
• **Space Complexity**: O(N) for recursion stack
  - Plus O(N²) to store solutions''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Common Backtracking Problems',
              content: '''
1. **Sudoku Solver**: Fill grid following rules
2. **Permutations/Combinations**: Generate all possibilities
3. **Subset Sum**: Find subsets that sum to target
4. **Maze Solving**: Find path from start to end
5. **Graph Coloring**: Assign colors with constraints''',
              icon: Icons.apps,
            ),
            
            SizedBox(height: 25),
            
            // Visualization
            _buildSection(
              title: 'Backtracking Visualization',
              content: '''
Imagine a decision tree where:
- Each level represents a decision point
- Branches represent possible choices
- We explore depth-first until we hit:
  - Solution (leaf node) → Save it
  - Dead end → Backtrack to previous node''',
              icon: Icons.insights,
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
}