import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/graph/gr1.dart';
import 'package:flutter/material.dart';

class Graphs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Graph Data Structure', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Graph Definition
            _buildSection(
              title: 'What is a Graph?',
              content: '''
A graph is a non-linear data structure consisting of nodes (vertices) connected by edges. It represents relationships between objects.

Key Characteristics:
• Nodes (Vertices): Represent entities
• Edges: Represent relationships between nodes
• Can be directed or undirected
• Can be weighted or unweighted
• Can be cyclic or acyclic''',
              icon: Icons.polyline,
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
Text(' Example of Graph',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('gp.jpg',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Graph Properties
            _buildSection(
              title: 'Properties of Graphs',
              content: '''
1. Directed vs Undirected:
   - Directed: Edges have direction (one-way)
   - Undirected: Edges have no direction (two-way)

2. Weighted vs Unweighted:
   - Weighted: Edges have values/weights
   - Unweighted: All edges are equal

3. Connected vs Disconnected:
   - Connected: Path exists between any two nodes
   - Disconnected: Some nodes have no path between them

4. Cyclic vs Acyclic:
   - Cyclic: Contains at least one cycle
   - Acyclic: Contains no cycles''',
              icon: Icons.tune,
            ),

            // Graph Terminology
            _buildSection(
              title: 'Graph Terminology',
              content: '''
• Vertex (Node): Fundamental unit of the graph
• Edge: Connection between two vertices
• Path: Sequence of vertices connected by edges
• Cycle: Path that starts and ends at same vertex
• Degree: Number of edges connected to a vertex
   - In-degree: Incoming edges (directed graphs)
   - Out-degree: Outgoing edges (directed graphs)
• Adjacency: Two vertices are adjacent if connected by an edge
• Weight: Value assigned to an edge (in weighted graphs)''',
              icon: Icons.legend_toggle,
            ),

            // Types of Graphs
            _buildSection(
              title: 'Types of Graphs',
              content: '''
1. Undirected Graph:
   - Edges have no direction
   - Social networks, road maps

2. Directed Graph (Digraph):
   - Edges have direction
   - Web page links, dependency graphs

3. Weighted Graph:
   - Edges have weights
   - Road networks with distances, network routing

4. Unweighted Graph:
   - All edges are equal
   - Social connections

5. Cyclic Graph:
   - Contains at least one cycle
   - Circular dependencies

6. Acyclic Graph:
   - Contains no cycles
   - Family trees, version histories

7. Connected Graph:
   - Path exists between any two nodes
   - Fully linked network

8. Disconnected Graph:
   - Some nodes have no connecting path
   - Islands in a network''',
              icon: Icons.category,
            ),

            // Graph Representations
            _buildSection(
              title: 'Graph Representations',
              content: 'Two common ways to represent graphs in memory:',
              icon: Icons.memory,
            ),
            
            // Adjacency Matrix
            _buildSubSection('1. Adjacency Matrix'),
            Text('A 2D array where matrix[i][j] = 1 indicates an edge from node i to j\n\n'
                'Pros:\n'
                '• Simple to implement\n'
                '• Edge lookup is O(1)\n'
                '• Easy to check for edge existence\n\n'
                'Cons:\n'
                '• Consumes O(V²) space\n'
                '• Adding a vertex is O(V²)',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            _buildCodeBlock('''
// Example adjacency matrix for 4-node graph
int[][] adjMatrix = {
    {0, 1, 0, 1},  // Node 0 connections
    {1, 0, 1, 0},  // Node 1 connections
    {0, 1, 0, 1},  // Node 2 connections
    {1, 0, 1, 0}   // Node 3 connections
};'''),
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
Text('Adjacency Matrix',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('adm.JPG',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Adjacency List
            _buildSubSection('2. Adjacency List'),
            Text('An array of lists where each list stores adjacent vertices\n\n'
                'Pros:\n'
                '• Space efficient (O(V + E))\n'
                '• Adding a vertex is easy\n'
                '• Efficient for sparse graphs\n\n'
                'Cons:\n'
                '• Edge lookup is O(V) in worst case\n'
                '• Less space efficient for dense graphs',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            _buildCodeBlock('''
// Example adjacency list for 4-node graph
List<List<Integer>> adjList = new ArrayList<>();

adjList.add(Arrays.asList(1, 3));  // Node 0 neighbors
adjList.add(Arrays.asList(0, 2));  // Node 1 neighbors
adjList.add(Arrays.asList(1, 3));  // Node 2 neighbors
adjList.add(Arrays.asList(0, 2));  // Node 3 neighbors'''),

            // Edge List
            _buildSubSection('3. Edge List'),
            Text('A list of all edges in the graph\n\n'
                'Pros:\n'
                '• Simple representation\n'
                '• Easy to iterate through edges\n\n'
                'Cons:\n'
                '• Inefficient for most operations\n'
                '• Not commonly used for algorithms',
                style: TextStyle(color: Colors.white70, fontSize: 16)),
            _buildCodeBlock('''
// Example edge list for 4-node graph
class Edge {
    int source, destination, weight;
    Edge(int s, int d, int w) {
        source = s; destination = d; weight = w;
    }
}

List<Edge> edges = Arrays.asList(
    new Edge(0, 1, 5),
    new Edge(0, 3, 2),
    new Edge(1, 2, 3),
    new Edge(2, 3, 7)
);'''),
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
Text('Adjacency List Representation',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('adl.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
SizedBox(height: 15,),
Text('Graph Traversals',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),

SizedBox(height: 15,),
const Gr1(),
            // Graph Operations
            _buildSection(
              title: 'Common Graph Operations',
              content: 'Basic operations performed on graphs:',
              icon: Icons.build,
            ),
            _buildBulletPoint('Add Vertex: Add a new vertex to the graph'),
            _buildBulletPoint('Add Edge: Add a new edge between two vertices'),
            _buildBulletPoint('Remove Vertex: Remove a vertex and all connected edges'),
            _buildBulletPoint('Remove Edge: Remove an edge between two vertices'),
            _buildBulletPoint('Check Adjacency: Determine if two vertices are adjacent'),
            _buildBulletPoint('Find Neighbors: Get all adjacent vertices of a vertex'),
            _buildBulletPoint('Get Vertex/Edge Count: Return number of vertices/edges'),

            // Applications
            _buildSection(
              title: 'Applications of Graphs',
              content: 'Real-world uses of graph data structures:',
              icon: Icons.apps,
            ),
            _buildBulletPoint('Social networks (Facebook friends graph)'),
            _buildBulletPoint('Transportation networks (roads, flights)'),
            _buildBulletPoint('Web page linking (Google PageRank)'),
            _buildBulletPoint('Computer networks (routing, connectivity)'),
            _buildBulletPoint('Dependency graphs (package managers)'),
            _buildBulletPoint('Recommendation systems (Amazon purchases)'),
            _buildBulletPoint('Pathfinding (GPS navigation)'),
            _buildBulletPoint('Circuit design (connection routing)'),
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

  Widget _buildSubSection(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.white70),
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