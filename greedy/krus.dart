import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Krus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Kruskal\'s Algorithm', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Kruskal\'s Algorithm?',
              content: 'Kruskal\'s algorithm is a greedy algorithm that finds a minimum spanning tree (MST) for a connected, weighted graph. It works by sorting all edges from lowest to highest weight, then adding them to the MST if they don\'t form a cycle.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Concepts
            _buildSection(
              title: 'Key Concepts',
              content: '''
• Works on undirected, connected, weighted graphs
• Uses Union-Find (Disjoint Set) data structure to detect cycles
• Always selects the smallest available edge
• Produces a minimum spanning tree with (V-1) edges
• Time complexity: O(E log E) or O(E log V)''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Pseudocode Section
            _buildSection(
              title: 'Pseudocode',
              content: '''
1. Sort all edges in non-decreasing order of weight
2. Initialize Union-Find structure
3. For each edge in sorted order:
   a. If adding the edge doesn't form a cycle:
      i. Add it to the MST
      ii. Union the two sets
4. Stop when we have (V-1) edges in MST''',
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
                    '// Edge class to represent weighted edges',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '''class Edge implements Comparable<Edge> {
    int src, dest, weight;
    
    public Edge(int src, int dest, int weight) {
        this.src = src;
        this.dest = dest;
        this.weight = weight;
    }
    
    @Override
    public int compareTo(Edge other) {
        return this.weight - other.weight;
    }
}

// Union-Find (Disjoint Set) implementation
class UnionFind {
    private int[] parent;
    private int[] rank;
    
    public UnionFind(int size) {
        parent = new int[size];
        rank = new int[size];
        for (int i = 0; i < size; i++) {
            parent[i] = i;
        }
    }
    
    public int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]); // Path compression
        }
        return parent[x];
    }
    
    public void union(int x, int y) {
        int rootX = find(x);
        int rootY = find(y);
        
        if (rootX != rootY) {
            // Union by rank
            if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX;
            } else if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY;
            } else {
                parent[rootY] = rootX;
                rank[rootX]++;
            }
        }
    }
}

// Kruskal's Algorithm Implementation
public List<Edge> kruskalMST(List<Edge> edges, int vertices) {
    List<Edge> result = new ArrayList<>();
    Collections.sort(edges);
    UnionFind uf = new UnionFind(vertices);
    
    for (Edge edge : edges) {
        if (result.size() == vertices - 1) break;
        
        int rootSrc = uf.find(edge.src);
        int rootDest = uf.find(edge.dest);
        
        if (rootSrc != rootDest) {
            result.add(edge);
            uf.union(rootSrc, rootDest);
        }
    }
    
    return result;
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
Consider this weighted graph with 4 vertices (A=0, B=1, C=2, D=3):

Edges:
A-B: 10
A-C: 6
A-D: 5
B-D: 15
C-D: 4

Step-by-step execution:
1. Sort edges: C-D(4), A-D(5), A-C(6), A-B(10), B-D(15)
2. Add C-D (no cycle)
3. Add A-D (no cycle)
4. Skip A-C (forms cycle A-D-C-A)
5. Add A-B (no cycle)
6. Stop (3 edges = V-1)

Final MST contains:
C-D(4), A-D(5), A-B(10)''',
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
Text('Animated Example of Krushkal\'s Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('krush.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: '''
• Time Complexity: O(E log E) or O(E log V)
  - Sorting edges: O(E log E)
  - Union-Find operations: O(α(V)) per operation (near-constant)
• Space Complexity: O(V + E)
  - Storage for edges
  - Union-Find data structure''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Real-World Applications',
              content: '''
• Network design (telephone, electrical, hydraulic)
• Cluster analysis
• Image segmentation
• Approximation algorithms for NP-hard problems
• Circuit design''',
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