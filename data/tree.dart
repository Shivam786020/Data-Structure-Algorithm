import 'package:dsa_app/tree/t1.dart';
import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Tree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Tree Data Structure', 
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
                title: 'Tree Fundamentals',
                content: '''
A tree is a hierarchical data structure consisting of nodes connected by edges. Unlike arrays/linked lists which are linear, trees are nonlinear with parent-child relationships.

Key Properties:
• Root: The topmost node
• Parent/Child: Directly connected nodes
• Leaf: Node without children
• Height: Longest path from root to leaf
• Depth: Distance from node to root
• Degree: Number of children a node has''',
                icon: Icons.account_tree,
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
Text(' Tree Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('tree.jpg',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Advantages
              _buildSection(
                title: 'Advantages of Trees',
                content: 'Why trees are powerful data structures:',
                icon: Icons.thumb_up,
              ),
              _buildBulletPoints([
                'Efficient hierarchical data representation',
                'Faster search than linked lists (O(log n) in balanced trees)',
                'Insertion/deletion faster than arrays',
                'Flexible size, no fixed capacity',
                'Many specialized variants for different use cases',
                'Natural representation of real-world hierarchies'
              ]),

              // Terminology
              _buildSection(
                title: 'Tree Terminology',
                content: 'Essential terms to understand:',
                icon: Icons.terrain,
              ),
              _buildTerminologyTable(),

              // Types of Trees
              _buildSection(
                title: 'Types of Trees',
                content: 'Common tree variants and their uses:',
                icon: Icons.type_specimen,
              ),
SizedBox(height: 15,),
const T1(),
              // Traversal Methods
              _buildSection(
                title: 'Tree Traversal Methods',
                content: 'Ways to visit all nodes in a tree:',
                icon: Icons.traffic,
              ),
              _buildTraversalMethods(),

              // Implementation
              _buildSection(
                title: 'Tree Implementation',
                content: 'Basic implementation in Java:',
                icon: Icons.code,
              ),
              _buildCodeBlock('''
// Binary Tree Node Implementation
class TreeNode {
    int data;
    TreeNode left;
    TreeNode right;
    
    TreeNode(int value) {
        this.data = value;
        this.left = null;
        this.right = null;
    }
}

// Binary Tree Class
class BinaryTree {
    TreeNode root;
    
    BinaryTree() { root = null; }
    
    // Preorder Traversal
    void preorder(TreeNode node) {
        if (node == null) return;
        System.out.print(node.data + " ");
        preorder(node.left);
        preorder(node.right);
    }
    
    // Insertion Example
    void insert(int data) {
        root = insertRec(root, data);
    }
    
    private TreeNode insertRec(TreeNode root, int data) {
        if (root == null) {
            return new TreeNode(data);
        }
        
        if (data < root.data) {
            root.left = insertRec(root.left, data);
        } else if (data > root.data) {
            root.right = insertRec(root.right, data);
        }
        
        return root;
    }
}'''),

              // Applications
              _buildSection(
                title: 'Tree Applications',
                content: 'Real-world uses of tree structures:',
                icon: Icons.apps,
              ),
              _buildBulletPoints([
                'File systems (directory structure)',
                'Database indexing (B-trees, B+ trees)',
                'Compilers (parse trees, syntax trees)',
                'Networking (routing tables)',
                'Machine learning (decision trees)',
                'Auto-completion (Trie)',
                'Blockchain (Merkle trees)'
              ]),

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
                Text('Tree Data Structure',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A hierarchical data structure that simulates a branching tree structure,'
            ' with a root value and subtrees of children, represented as linked nodes.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Hierarchical'),
                _buildTag('Non-linear'),
                _buildTag('O(log n) Search'),
                _buildTag('Recursive'),
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
            fontSize: 14,
            color: Colors.white70,
            height: 1.6,
          )),
      ],
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points.map((point) => 
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.arrow_right, size: 24, color: Colors.orangeAccent),
                SizedBox(width: 8),
                Expanded(
                  child: Text(point,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white70,
                    )),
                ),
              ],
            ),
          )).toList(),
      ),
    );
  }

  Widget _buildTerminologyTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Term', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Definition', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        _buildTerminologyRow('Root', 'Topmost node in the tree'),
        _buildTerminologyRow('Parent', 'Immediate predecessor of a node'),
        _buildTerminologyRow('Child', 'Immediate successor of a node'),
        _buildTerminologyRow('Leaf', 'Node without any children'),
        _buildTerminologyRow('Edge', 'Link between parent and child'),
        _buildTerminologyRow('Depth', 'Number of edges from root to node'),
        _buildTerminologyRow('Height', 'Number of edges on longest root-to-leaf path'),
        _buildTerminologyRow('Degree', 'Number of children a node has'),
      ],
    );
  }

  DataRow _buildTerminologyRow(String term, String definition) {
    return DataRow(cells: [
      DataCell(Text(term, style: TextStyle(color: Colors.orange))),
      DataCell(Text(definition, style: TextStyle(color: Colors.white70))),
    ]);
  }



 

  Widget _buildTraversalMethods() {
    return Column(
      children: [
        _buildTraversalMethod(
          'Depth-First Search (DFS)',
          [
            'Pre-order: Root → Left → Right',
            'In-order: Left → Root → Right (gives sorted order in BST)',
            'Post-order: Left → Right → Root'
          ],
          Icons.vertical_align_bottom
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
Text(' Traversals Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('tra.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
           
        _buildTraversalMethod(
          'Breadth-First Search (BFS)',
          ['Level-order: Visit nodes level by level'],
          Icons.horizontal_split
        ),
      ],
    );
  }

  Widget _buildTraversalMethod(String title, List<String> methods, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      color: Colors.grey[900],
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.orangeAccent),
        title: Text(title, style: TextStyle(color: Colors.white)),
        children: methods.map((method) => 
          ListTile(
            title: Text(method, 
                    style: TextStyle(color: Colors.white70)),
          )).toList(),
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SelectableText(
        code,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'RobotoMono',
          fontSize: 13,
        ),
      ),
    );
  }
}