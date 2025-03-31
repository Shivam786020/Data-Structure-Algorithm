import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Bred extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Breadth-First Search (BFS)', 
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
                title: 'BFS Fundamentals',
                content: '''
Breadth-First Search (BFS) is a graph traversal algorithm that systematically explores all vertices of a graph in level-order, making it ideal for finding shortest paths in unweighted graphs.

Key Characteristics:
• Queue-based (FIFO) traversal
• Level-order exploration (visits all neighbors before moving deeper)
• Guaranteed shortest path in unweighted graphs
• Complete algorithm (finds solution if exists)
• Time Complexity: O(V + E) where V=vertices, E=edges
• Space Complexity: O(V) in worst case

Mathematical Formulation:
For graph G = (V, E) and starting vertex s:
1. Initialize distance d[s] = 0
2. ∀u ∈ V - {s}, d[u] = ∞
3. While queue Q ≠ ∅:
   - u = Dequeue(Q)
   - For each neighbor v of u:
     if d[v] == ∞:
       d[v] = d[u] + 1
       Enqueue(Q, v)''',
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
Text('Breadth First Search Example ',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('bfs.jpg',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Algorithm Steps
              _buildSection(
                title: 'BFS Algorithm Steps',
                content: 'Detailed step-by-step process:',
                icon: Icons.list_alt,
              ),
              _buildAlgorithmStep('1. Initialization:', subpoints: [
                '• Create empty queue',
                '• Initialize visited array (size V)',
                '• Mark start node as visited',
                '• Enqueue start node'
              ]),
              _buildAlgorithmStep('2. Main Loop:', subpoints: [
                'While queue not empty:',
                '  • Dequeue vertex u',
                '  • Process u (print/store)',
                '  • For each neighbor v of u:',
                '    - If v not visited:',
                '      • Mark v visited',
                '      • Enqueue v',
                '      • Record parent/distance'
              ]),
              _buildAlgorithmStep('3. Termination:', subpoints: [
                '• Queue becomes empty',
                '• All reachable nodes processed',
                '• Unvisited nodes indicate disconnected components'
              ]),

              // Visualization
             

              // Implementation
              _buildSection(
                title: 'BFS Implementation',
                content: 'Multi-language implementations:',
                icon: Icons.code,
              ),
              _buildImplementationTabs(),

              // Complexity Analysis
              _buildComplexitySection(),

              // BFS vs DFS Comparison
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
                Text('Breadth-First Search',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A fundamental algorithm for exploring graphs level by level, guaranteeing the shortest path in unweighted graphs.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Graph Traversal'),
                _buildTag('Shortest Path'),
                _buildTag('O(V+E) Complexity'),
                _buildTag('Queue-based'),
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
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
          ],
        ),
        SizedBox(height: 12),
        Text(content,
          style: TextStyle(
            fontSize: 15,
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
// Java BFS using adjacency list
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
    
    void BFS(int s) {
        boolean[] visited = new boolean[V];
        LinkedList<Integer> queue = new LinkedList<>();
        
        visited[s] = true;
        queue.add(s);
        
        while (!queue.isEmpty()) {
            s = queue.poll();
            System.out.print(s + " ");
            
            for (int n : adj[s]) {
                if (!visited[n]) {
                    visited[n] = true;
                    queue.add(n);
                }
            }
        }
    }
}'''),
                _buildCodeBlock('''
# Python BFS implementation
from collections import deque

class Graph:
    def __init__(self, vertices):
        self.adj = {v: [] for v in range(vertices)}
    
    def add_edge(self, v, w):
        self.adj[v].append(w)
    
    def bfs(self, s):
        visited = [False] * len(self.adj)
        queue = deque([s])
        visited[s] = True
        
        while queue:
            v = queue.popleft()
            print(v, end=" ")
            
            for neighbor in self.adj[v]:
                if not visited[neighbor]:
                    visited[neighbor] = True
                    queue.append(neighbor)
'''),
                _buildCodeBlock('''
// C++ BFS implementation
#include <iostream>
#include <queue>
#include <vector>
using namespace std;

void bfs(vector<vector<int>>& graph, int start) {
    vector<bool> visited(graph.size(), false);
    queue<int> q;
    
    visited[start] = true;
    q.push(start);
    
    while (!q.empty()) {
        int v = q.front();
        q.pop();
        cout << v << " ";
        
        for (int neighbor : graph[v]) {
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                q.push(neighbor);
            }
        }
    }
}'''),
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
      content: 'Detailed performance characteristics:',
      icon: Icons.timer,
    );
  }

  Widget _buildComparisonSection() {
    return _buildSection(
      title: 'BFS vs DFS',
      content: 'Key differences between the two traversal methods:',
      icon: Icons.compare,
    );
  }

  Widget _buildApplicationsSection() {
    return _buildSection(
      title: 'Practical Applications',
      content: 'Real-world uses of BFS:',
      icon: Icons.apps,
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