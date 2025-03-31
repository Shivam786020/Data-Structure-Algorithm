import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Prim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Prim\'s Algorithm', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Prim\'s Algorithm?',
              content: 'Prim\'s algorithm is a greedy algorithm that finds a minimum spanning tree (MST) for a weighted undirected graph. It starts from an arbitrary vertex and grows the MST by adding the cheapest edge from the tree to a vertex not yet in the tree.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Concepts
            _buildSection(
              title: 'Key Concepts',
              content: '''
• Works on connected, undirected, weighted graphs
• Maintains two sets: vertices included in MST and vertices not yet included
• At each step, adds the minimum weight edge that connects the two sets
• Uses a priority queue (min-heap) to efficiently select the next edge
• Time complexity: O(E log V) with binary heap''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Pseudocode Section
            _buildSection(
              title: 'Pseudocode',
              content: '''
1. Initialize a priority queue with all vertices and ∞ key values
2. Set key value of start vertex to 0
3. While queue is not empty:
   a. Extract vertex u with minimum key
   b. For each adjacent vertex v of u:
      i. If v is in queue and weight(u,v) < key[v]:
         - Update key[v] = weight(u,v)
         - Set parent[v] = u
4. Return MST from parent array''',
              icon: Icons.code,
            ),
            
            SizedBox(height: 25),
            
            // Java Implementation
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
    private int V;
    private List<List<Node>> adj;
    
    class Node {
        int vertex;
        int weight;
        Node(int vertex, int weight) {
            this.vertex = vertex;
            this.weight = weight;
        }
    }
    
    public Graph(int V) {
        this.V = V;
        adj = new ArrayList<>(V);
        for (int i = 0; i < V; i++)
            adj.add(new ArrayList<>());
    }
    
    public void addEdge(int u, int v, int weight) {
        adj.get(u).add(new Node(v, weight));
        adj.get(v).add(new Node(u, weight)); // Undirected graph
    }
    
    public void primMST() {
        PriorityQueue<Node> pq = new PriorityQueue<>(
            Comparator.comparingInt(node -> node.weight)
        );
        
        int[] parent = new int[V];
        int[] key = new int[V];
        boolean[] inMST = new boolean[V];
        
        Arrays.fill(key, Integer.MAX_VALUE);
        key[0] = 0;
        pq.add(new Node(0, 0));
        
        while (!pq.isEmpty()) {
            int u = pq.poll().vertex;
            inMST[u] = true;
            
            for (Node node : adj.get(u)) {
                int v = node.vertex;
                int weight = node.weight;
                
                if (!inMST[v] && weight < key[v]) {
                    key[v] = weight;
                    parent[v] = u;
                    pq.add(new Node(v, key[v]));
                }
            }
        }
        
        printMST(parent);
    }
    
    private void printMST(int[] parent) {
        System.out.println("Edge \tWeight");
        for (int i = 1; i < V; i++)
            System.out.println(parent[i] + " - " + i + "\t" + key[i]);
    }
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
Consider this weighted graph with 5 vertices (0-4):

Edges:
0-1: 2
0-3: 6
1-2: 3
1-3: 8
1-4: 5
2-4: 7
3-4: 9

Step-by-step execution starting from vertex 0:
1. Start: Add 0 to MST (key=0)
2. Process 0: Update neighbors 1(2), 3(6)
3. Select 1 (smallest key): Add to MST
4. Process 1: Update 2(3), 4(5)
5. Select 2: Add to MST
6. Process 2: No updates (7 > 5 for vertex 4)
7. Select 4: Add to MST
8. Process 4: No updates
9. Select 3: Add to MST

Final MST contains:
0-1(2), 1-2(3), 1-4(5), 0-3(6)''',
              icon: Icons.account_tree,
            ),
            
            SizedBox(height: 25),
              Center(child: 
  Container(
              height: 350,
              decoration: BoxDecoration(
                
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
Text('Animated Example of Prim\'s Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('prim.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: '''
• Time Complexity:
  - O(E log V) with binary heap
  - O(E + V log V) with Fibonacci heap (more efficient)
• Space Complexity: O(V + E)
  - Storage for adjacency list
  - Priority queue storage
  - Parent and key arrays''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Real-World Applications',
              content: '''
• Network design (cable, electrical, hydraulic systems)
• Cluster analysis
• Image segmentation
• Approximation algorithms for NP-hard problems
• Road network planning''',
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