import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Dij extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Dijkstra\'s Algorithm', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Dijkstra\'s Algorithm?',
              content: 'Dijkstra\'s algorithm is a greedy algorithm that finds the shortest paths between nodes in a graph with non-negative edge weights. It was conceived by computer scientist Edsger W. Dijkstra in 1956.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Concepts
            _buildSection(
              title: 'Key Concepts',
              content: '''
• Works on weighted graphs with non-negative edges
• Uses a priority queue to select the next node
• Maintains a distance table (shortest known distance to each node)
• Updates neighbor distances when a shorter path is found
• Guaranteed to find the shortest path in graphs without negative edges''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Pseudocode Section
            _buildSection(
              title: 'Pseudocode',
              content: '''
1. Initialize distances: set source distance to 0, others to ∞
2. Create a priority queue with all nodes
3. While queue is not empty:
   a. Extract node with minimum distance (u)
   b. For each neighbor v of u:
      i. Calculate alternative path = dist[u] + edge(u,v)
      ii. If alternative path < dist[v]:
          - Update dist[v] = alternative path
          - Update previous node for v
4. Return distance and previous node tables''',
              icon: Icons.code,
            ),
            
            SizedBox(height: 25),
            
            // Dart Implementation
            Text(
              'Java Implementation',
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
                    '// Graph representation using adjacency list',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '''class Graph {
  final int vertices;
  final List<List<Edge>> adjList;

  Graph(this.vertices) : adjList = List.generate(vertices, (_) => []);

  void addEdge(int src, int dest, int weight) {
    adjList[src].add(Edge(dest, weight));
    // For undirected graph:
    // adjList[dest].add(Edge(src, weight));
  }
}

class Edge {
  final int dest, weight;
  Edge(this.dest, this.weight);
}

// Dijkstra's Algorithm Implementation
Map<int, int> dijkstra(Graph graph, int source) {
  final distances = Map<int, int>.fromIterable(
    Iterable.generate(graph.vertices),
    key: (v) => v,
    value: (v) => v == source ? 0 : double.maxFinite.toInt()
  );

  final priorityQueue = PriorityQueue<int>(
    (a, b) => distances[a]!.compareTo(distances[b]!)
  )..add(source);

  while (priorityQueue.isNotEmpty) {
    final u = priorityQueue.removeFirst();
    
    for (final edge in graph.adjList[u]) {
      final alt = distances[u]! + edge.weight;
      if (alt < distances[edge.dest]!) {
        distances[edge.dest] = alt;
        priorityQueue.add(edge.dest);
      }
    }
  }

  return distances;
}''',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Example Visualization
            _buildSection(
              title: 'Example Walkthrough',
              content: '''
Consider this weighted graph (A=0, B=1, C=2, D=3):

A --6--> B --2--> D
|       /       /
1     3       1
|   /       /
v v       v
C --5--> E

Step-by-step execution from source A:
1. Start: A(0), others ∞
2. Process A: Update B(6), C(1)
3. Process C (smallest distance): Update B(4), E(6)
4. Process B: Update D(6)
5. Process D: Update E(7)
6. Process E: No updates

Final shortest distances:
A: 0, B: 4, C: 1, D: 6, E: 6''',
              icon: Icons.account_tree,
            ),
            SizedBox(height: 20,),
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
Text('Animated Example of Dijkstra/s Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('dij.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 25),
            
            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: '''
• Time Complexity: O(E log V) with priority queue
  - Each edge processed once (O(E))
  - Priority queue operations take O(log V) each
• Space Complexity: O(V)
  - Distance table storage
  - Priority queue storage''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Real-World Applications',
              content: '''
• GPS navigation systems
• Network routing protocols (OSPF, IS-IS)
• Traffic information systems
• Flight itinerary planning
• Robotics path planning''',
              icon: Icons.public,
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

// Note: You'll need to import 'package:collection/collection.dart' for PriorityQueue