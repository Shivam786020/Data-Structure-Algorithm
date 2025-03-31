import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Bellman extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Bellman-Ford Algorithm', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Bellman-Ford?',
              content: 'An algorithm that computes shortest paths from a single source vertex to all other vertices in a weighted digraph. Unlike Dijkstra\'s, it works with negative edge weights and can detect negative cycles.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Characteristics
            _buildSection(
              title: 'Key Characteristics',
              content: '''
1. Handles negative weight edges
2. Detects negative weight cycles
3. Slower than Dijkstra's (O(VE) time)
4. Works for directed graphs (undirected needs conversion)
5. Relaxes all edges repeatedly''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Algorithm Steps
            _buildSection(
              title: 'Algorithm Steps',
              content: '''
1. Initialize distances from source to all vertices as ∞, except source (0)
2. Relax all edges |V|-1 times
3. Check for negative cycles by attempting one more relaxation
4. If any distance can still be improved, negative cycle exists''',
              icon: Icons.account_tree,
            ),
            
            // Example Graph
            Text(
              'Example Graph',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'Edges:',
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(height: 5),
                  Text('A → B (weight: -1)', style: TextStyle(color: Colors.white)),
                  Text('A → C (weight: 4)', style: TextStyle(color: Colors.white)),
                  Text('B → C (weight: 3)', style: TextStyle(color: Colors.white)),
                  Text('B → D (weight: 2)', style: TextStyle(color: Colors.white)),
                  Text('B → E (weight: 2)', style: TextStyle(color: Colors.white)),
                  Text('D → B (weight: 1)', style: TextStyle(color: Colors.white)),
                  Text('D → C (weight: 5)', style: TextStyle(color: Colors.white)),
                  Text('E → D (weight: -3)', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Code Implementation
            Text(
              'Bellman-Ford Implementation',
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
                    'class Edge {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int src, dest, weight;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  Edge(this.src, this.dest, this.weight);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'void bellmanFord(List<Edge> edges, int V, int src) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> dist = List.filled(V, double.maxFinite.toInt());',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  dist[src] = 0;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  // Relax all edges V-1 times',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  for (int i = 1; i < V; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (Edge edge in edges) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      if (dist[edge.src] != double.maxFinite.toInt() && ',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '          dist[edge.src] + edge.weight < dist[edge.dest]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        dist[edge.dest] = dist[edge.src] + edge.weight;',
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
                    '  // Check for negative cycles',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  for (Edge edge in edges) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (dist[edge.src] != double.maxFinite.toInt() && ',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        dist[edge.src] + edge.weight < dist[edge.dest]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      print("Graph contains negative weight cycle");',
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
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  printResults(dist, V);',
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
• **Time Complexity**: O(V*E) 
  - V-1 relaxations of all E edges
  - One more pass to detect negative cycles
• **Space Complexity**: O(V) for distance array''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Applications',
              content: '''
• Routing protocols in computer networks
• Currency arbitrage detection
• Traffic-aware navigation systems
• Negative cycle detection in financial networks
• Distance-vector routing protocols (like RIP)''',
              icon: Icons.apps,
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