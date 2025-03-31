import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Depth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Depth-First Search (DFS)', 
               style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
        elevation: 0,
      ),
      endDrawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section
              _buildHeroSection(),

              // Theory Section
              _buildSection(
                title: 'DFS Fundamentals',
                content: '''
Depth-First Search (DFS) is a graph traversal algorithm that explores as far as possible along each branch before backtracking, making it ideal for topological sorting, pathfinding, and solving puzzles.

Key Characteristics:
• Stack-based (LIFO) traversal (recursive or explicit stack)
• Explores one path completely before backtracking
• Better for deep graph exploration
• Time Complexity: O(V + E) where V=vertices, E=edges
• Space Complexity: O(V) in worst case (better than BFS for deep graphs)

Variations:
• Pre-order: Process node before children
• In-order: Process left, node, right (for binary trees)
• Post-order: Process children before node
• Reverse Post-order: Useful for topological sort''',
                icon: Icons.search,
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
Text('Depth First Search Example ',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('dfs.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Algorithm Steps
              _buildSection(
                title: 'DFS Algorithm Steps',
                content: 'Detailed step-by-step process:',
                icon: Icons.list_alt,
              ),
              _buildAlgorithmStep('1. Initialization:', subpoints: [
                '• Create empty stack (or use recursion)',
                '• Initialize visited array (size V)',
                '• Mark start node as visited',
                '• Push start node to stack'
              ]),
              _buildAlgorithmStep('2. Main Loop:', subpoints: [
                'While stack not empty:',
                '  • Pop vertex u from stack',
                '  • Process u (print/store)',
                '  • For each neighbor v of u:',
                '    - If v not visited:',
                '      • Mark v visited',
                '      • Push v to stack',
                '      • Record parent/distance (if needed)'
              ]),
              _buildAlgorithmStep('3. Termination:', subpoints: [
                '• Stack becomes empty',
                '• All reachable nodes processed',
                '• Unvisited nodes indicate disconnected components'
              ]),

              // Visualization
          

              // Implementation
              _buildSection(
                title: 'DFS Implementation',
                content: 'Multi-language implementations:',
                icon: Icons.code,
              ),
              _buildImplementationTabs(),

              // Complexity Analysis
              _buildComplexitySection(),

              // DFS vs BFS Comparison
              _buildComparisonSection(),

              // Applications
              _buildApplicationsSection(),

              // Common Problems
              

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ============= Helper Methods =============
  Widget _buildHeroSection() {
    return Card(
      color: Colors.blueGrey[900],
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_tree, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('Depth-First Search',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('An algorithm for exploring graphs by going as deep as possible before backtracking, useful for pathfinding, topological sorting, and solving puzzles.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Graph Traversal'),
                _buildTag('Backtracking'),
                _buildTag('O(V+E) Complexity'),
                _buildTag('Stack-based'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Chip(
      label: Text(text, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blueGrey[800],
      shape: StadiumBorder(),
    );
  }

  Widget _buildSection({required String title, required String content, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Row(
          children: [
            Icon(icon, color: Colors.orangeAccent, size: 28),
            SizedBox(width: 10),
            Text(title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
          ],
        ),
        SizedBox(height: 12),
        Text(content,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            height: 1.6,
          )),
      ],
    );
  }

  Widget _buildAlgorithmStep(String text, {List<String>? subpoints}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.arrow_right, size: 28, color: Colors.orangeAccent),
              SizedBox(width: 8),
              Expanded(
                child: Text(text,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  )),
              ),
            ],
          ),
          if (subpoints != null) 
            Padding(
              padding: EdgeInsets.only(left: 32, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subpoints.map((point) => 
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(point,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        height: 1.4,
                      )),
                  )).toList(),
              ),
            ),
        ],
      ),
    );
  }



  Widget _buildImplementationTabs() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.orangeAccent,
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Java'),
              Tab(text: 'Python'),
              Tab(text: 'C++'),
            ],
          ),
          Container(
            height: 350,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey[800]!),
                left: BorderSide(color: Colors.grey[800]!),
                right: BorderSide(color: Colors.grey[800]!),
              ),
            ),
            child: TabBarView(
              children: [
                _buildCodeBlock('''
// Java DFS using adjacency list (iterative)
import java.util.*;

class Graph {
    private int V;
    private LinkedList<Integer> adj[];
    
    Graph(int v) {
        V = v;
        adj = new LinkedList[v];
        for (int i = 0; i < v; ++i)
            adj[i] = new LinkedList();
    }
    
    void addEdge(int v, int w) { 
        adj[v].add(w); 
    }
    
    void DFS(int s) {
        boolean[] visited = new boolean[V];
        Stack<Integer> stack = new Stack<>();
        
        stack.push(s);
        
        while (!stack.empty()) {
            s = stack.pop();
            
            if (!visited[s]) {
                visited[s] = true;
                System.out.print(s + " ");
                
                // Push neighbors in reverse order for left-to-right traversal
                Collections.reverse(adj[s]);
                for (int n : adj[s]) {
                    if (!visited[n]) {
                        stack.push(n);
                    }
                }
                Collections.reverse(adj[s]);
            }
        }
    }
}'''),
                _buildCodeBlock('''
# Python DFS implementation (recursive)
def dfs(graph, node, visited=None):
    if visited is None:
        visited = set()
    visited.add(node)
    print(node, end=" ")
    
    for neighbor in graph[node]:
        if neighbor not in visited:
            dfs(graph, neighbor, visited)

# Example usage:
graph = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F'],
    'D': [],
    'E': [],
    'F': []
}
print("DFS Traversal:")
dfs(graph, 'A')  # Output: A B D E C F
'''),
                _buildCodeBlock('''
// C++ DFS implementation (iterative)
#include <iostream>
#include <stack>
#include <vector>
using namespace std;

void dfs(vector<vector<int>>& graph, int start) {
    vector<bool> visited(graph.size(), false);
    stack<int> s;
    
    s.push(start);
    
    while (!s.empty()) {
        int v = s.top();
        s.pop();
        
        if (!visited[v]) {
            visited[v] = true;
            cout << v << " ";
            
            // Push neighbors in reverse order
            for (auto it = graph[v].rbegin(); it != graph[v].rend(); ++it) {
                if (!visited[*it]) {
                    s.push(*it);
                }
            }
        }
    }
}
'''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComplexitySection() {
    return _buildSection(
      title: 'Complexity Analysis',
      content: '''
Time Complexity:
• O(V + E) for adjacency list representation
• O(V²) for adjacency matrix representation

Space Complexity:
• O(V) for visited tracking
• O(V) for recursion stack (worst case)
• Generally more space-efficient than BFS for deep graphs''',
      icon: Icons.timer,
    );
  }

Widget _buildComparisonSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildSection(
        title: 'DFS vs BFS',
        content: 'Key differences between the two traversal methods:',
        icon: Icons.compare,
      ),
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: DataTable(
          columns: [
            DataColumn(label: Text('Feature', style: TextStyle(color: Colors.white))),
            DataColumn(label: Text('DFS', style: TextStyle(color: Colors.orange))),
            DataColumn(label: Text('BFS', style: TextStyle(color: Colors.blue))),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Traversal Order', style: TextStyle(color: Colors.white))),
              DataCell(Text('Depth-first', style: TextStyle(color: Colors.orange))),
              DataCell(Text('Breadth-first', style: TextStyle(color: Colors.blue))),
            ]),
            DataRow(cells: [
              DataCell(Text('Data Structure', style: TextStyle(color: Colors.white))),
              DataCell(Text('Stack', style: TextStyle(color: Colors.orange))),
              DataCell(Text('Queue', style: TextStyle(color: Colors.blue))),
            ]),
            DataRow(cells: [
              DataCell(Text('Space Complexity', style: TextStyle(color: Colors.white))),
              DataCell(Text('O(V)', style: TextStyle(color: Colors.orange))),
              DataCell(Text('O(V)', style: TextStyle(color: Colors.blue))),
            ]),
            DataRow(cells: [
              DataCell(Text('Shortest Path', style: TextStyle(color: Colors.white))),
              DataCell(Text('No guarantee', style: TextStyle(color: Colors.orange))),
              DataCell(Text('Guaranteed (unweighted)', style: TextStyle(color: Colors.blue))),
            ]),
          ],
        ),
      ),
    ],
  );
}

Widget _buildApplicationsSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _buildSection(
        title: 'Practical Applications',
        content: 'Real-world uses of DFS:',
        icon: Icons.apps,
      ),
      Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 20),
        child: Column(
          children: [
            _buildApplicationPoint('Topological sorting'),
            _buildApplicationPoint('Solving mazes and puzzles'),
            _buildApplicationPoint('Finding strongly connected components'),
            _buildApplicationPoint('Path finding (when all paths needed)'),
            _buildApplicationPoint('Cycle detection in graphs'),
            _buildApplicationPoint('Generating mazes and puzzles'),
          ],
        ),
      ),
    ],
  );
}


 

  Widget _buildApplicationPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, size: 16, color: Colors.green),
          SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(color: Colors.white70))),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[900],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SelectableText(
          code,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoMono',
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}