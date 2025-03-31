import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Topo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Topological Sorting', 
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
                title: 'Topological Sort Fundamentals',
                content: '''
Topological sorting is a linear ordering of vertices in a Directed Acyclic Graph (DAG) where for every directed edge u → v, vertex u comes before v in the ordering.

Key Characteristics:
• Only possible for Directed Acyclic Graphs (DAGs)
• Not unique - a DAG can have multiple topological orders
• Time Complexity: O(V + E) where V=vertices, E=edges
• Space Complexity: O(V)
• Applications in task scheduling, dependency resolution

Properties:
• A DAG has at least one topological ordering
• If the graph has cycles, no topological order exists
• The first vertex in topological order is always a vertex with in-degree 0
• The last vertex is always a vertex with out-degree 0''',
                icon: Icons.sort,
              ),

              // Algorithm Steps
              _buildSection(
                title: 'Topological Sort Algorithm',
                content: 'Kahn\'s Algorithm (BFS-based approach):',
                icon: Icons.list_alt,
              ),
              _buildAlgorithmStep('1. Initialization:', subpoints: [
                '• Calculate in-degree for all vertices',
                '• Initialize queue with all vertices having in-degree 0',
                '• Initialize empty result list'
              ]),
              _buildAlgorithmStep('2. Main Loop:', subpoints: [
                'While queue is not empty:',
                '  • Dequeue vertex u and add to result',
                '  • For each neighbor v of u:',
                '    - Decrement v\'s in-degree',
                '    - If in-degree becomes 0, enqueue v'
              ]),
              _buildAlgorithmStep('3. Termination:', subpoints: [
                '• If result contains all vertices: valid topological order',
                '• Else: graph contains at least one cycle'
              ]),

              // Visualization
             
              // Implementation
              _buildSection(
                title: 'Implementation',
                content: 'Multi-language implementations:',
                icon: Icons.code,
              ),
              _buildImplementationTabs(),

              // Complexity Analysis
              _buildComplexitySection(),

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
                Icon(Icons.linear_scale, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('Topological Sorting',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A linear ordering of vertices in a DAG where for every directed edge u → v, u comes before v in the ordering. Essential for dependency resolution.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('DAG'),
                _buildTag('Dependency Ordering'),
                _buildTag('O(V+E) Complexity'),
                _buildTag('Task Scheduling'),
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
      length: 2,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.orangeAccent,
            labelColor: Colors.orangeAccent,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Kahn\'s Algorithm (BFS)'),
              Tab(text: 'DFS Approach'),
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
// Kahn's Algorithm (BFS approach)
List<Integer> topologicalSort(int V, List<List<Integer>> adj) {
    int[] inDegree = new int[V];
    List<Integer> result = new ArrayList<>();
    Queue<Integer> queue = new LinkedList<>();
    
    // Calculate in-degree
    for (int u = 0; u < V; u++) {
        for (int v : adj[u]) {
            inDegree[v]++;
        }
    }
    
    // Enqueue vertices with 0 in-degree
    for (int i = 0; i < V; i++) {
        if (inDegree[i] == 0) {
            queue.add(i);
        }
    }
    
    // Process queue
    while (!queue.isEmpty()) {
        int u = queue.poll();
        result.add(u);
        
        for (int v : adj[u]) {
            if (--inDegree[v] == 0) {
                queue.add(v);
            }
        }
    }
    
    // Check for cycle
    if (result.size() != V) {
        System.out.println("Graph contains cycle!");
        return new ArrayList<>();
    }
    
    return result;
}'''),
                _buildCodeBlock('''
// DFS Approach for Topological Sort
void topologicalSortDFS(int v, boolean[] visited, 
                       Stack<Integer> stack, 
                       List<List<Integer>> adj) {
    visited[v] = true;
    
    for (int u : adj[v]) {
        if (!visited[u]) {
            topologicalSortDFS(u, visited, stack, adj);
        }
    }
    
    stack.push(v);
}

List<Integer> topologicalSort(int V, List<List<Integer>> adj) {
    Stack<Integer> stack = new Stack<>();
    boolean[] visited = new boolean[V];
    
    for (int i = 0; i < V; i++) {
        if (!visited[i]) {
            topologicalSortDFS(i, visited, stack, adj);
        }
    }
    
    List<Integer> result = new ArrayList<>();
    while (!stack.isEmpty()) {
        result.add(stack.pop());
    }
    
    return result;
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
      content: '''
Time Complexity:
• O(V + E) for both Kahn's and DFS approaches
• Each vertex and edge is processed exactly once

Space Complexity:
• O(V) for storing in-degree array (Kahn's)
• O(V) for recursion stack (DFS)
• O(V) for result storage

Note: Kahn's algorithm can detect cycles during the process, while DFS requires additional checks.''',
      icon: Icons.timer,
    );
  }

  Widget _buildApplicationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSection(
          title: 'Applications',
          content: 'Practical uses of topological sorting:',
          icon: Icons.apps,
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              _buildApplicationPoint('Task scheduling with dependencies'),
              _buildApplicationPoint('Course prerequisite structures'),
              _buildApplicationPoint('Build system dependency resolution'),
              _buildApplicationPoint('Event processing pipelines'),
              _buildApplicationPoint('Instruction scheduling in compilers'),
              _buildApplicationPoint('Data serialization'),
            ],
          ),
        ),
      ],
    );
  }

  



  Widget _buildApplicationPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
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