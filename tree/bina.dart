import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Bina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Binary Tree', 
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
                title: 'Binary Tree Fundamentals',
                content: '''
A binary tree is a hierarchical data structure where each node has at most two children, referred to as the left child and right child.

Key Properties:
• Root: The topmost node
• Parent/Child: Directly connected nodes
• Leaf: Node without children
• Height: Longest path from root to leaf
• Depth: Distance from node to root
• Degree: Maximum of 2 children per node

Mathematical Properties:
• Maximum nodes at level L: 2^L
• Maximum nodes in tree of height H: 2^(H+1)-1
• Minimum height for N nodes: log₂(N+1)
• Number of leaf nodes in full binary tree: (N+1)/2''',
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
Text(' Binary Tree',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('bina.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Types Section
              _buildSection(
                title: 'Types of Binary Trees',
                content: 'Classification based on structure and properties:',
                icon: Icons.type_specimen,
              ),
              _buildBinaryTreeTypes(),

              // Representation Section
              _buildSection(
                title: 'Binary Tree Representations',
                content: 'How binary trees are stored in memory:',
                icon: Icons.memory,
              ),
              _buildRepresentationMethods(),

              // Traversal Section
             
              // Implementation
              _buildSection(
                title: 'Binary Tree Implementation',
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
    
    // Preorder Traversal
    void preorder(TreeNode node) {
        if (node == null) return;
        System.out.print(node.data + " ");
        preorder(node.left);
        preorder(node.right);
    }
    
    // Level Order Traversal
    void levelOrder() {
        Queue<TreeNode> queue = new LinkedList<>();
        queue.add(root);
        
        while (!queue.isEmpty()) {
            TreeNode current = queue.poll();
            System.out.print(current.data + " ");
            
            if (current.left != null) queue.add(current.left);
            if (current.right != null) queue.add(current.right);
        }
    }
}'''),

              // Applications
              _buildSection(
                title: 'Binary Tree Applications',
                content: 'Practical uses of binary trees:',
                icon: Icons.apps,
              ),
              _buildBulletPoints([
                'Binary Search Trees for O(log n) search operations',
                'Heap data structure for priority queues',
                'Syntax trees in compilers',
                'Huffman coding trees for data compression',
                'Game decision trees (chess, tic-tac-toe)',
                'File system hierarchies'
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
                Icon(Icons.border_inner_sharp, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('Binary Tree',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A tree data structure where each node has at most two children, referred to as the left child and right child. Fundamental for efficient searching and sorting algorithms.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Two Children Max'),
                _buildTag('Hierarchical'),
                _buildTag('O(log n) Operations'),
                _buildTag('Recursive'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBinaryTreeTypes() {
    return Column(
      children: [
        _buildTreeTypeCard(
          'Full Binary Tree',
          'Every node has 0 or 2 children',
          Icons.check_box,
          Colors.green
        ),
        _buildTreeTypeCard(
          'Complete Binary Tree',
          'All levels except last are completely filled',
          Icons.view_agenda,
          Colors.blue
        ),
        _buildTreeTypeCard(
          'Perfect Binary Tree',
          'All interior nodes have 2 children and all leaves at same level',
          Icons.star,
          Colors.amber
        ),
        _buildTreeTypeCard(
          'Balanced Binary Tree',
          'Height difference of left and right subtrees ≤ 1',
          Icons.balance,
          Colors.purple
        ),
        _buildTreeTypeCard(
          'Degenerate Tree',
          'Each parent has only one child (linked list behavior)',
          Icons.linear_scale,
          Colors.red
        ),
      ],
    );
  }

  Widget _buildRepresentationMethods() {
    return Column(
      children: [
        _buildRepresentationCard(
          'Linked Representation',
          'Using node objects with left/right pointers',
          Icons.link
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
Text(' Binary Tree Linked List Representation',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('bl.webp',height: 270,width:350,)
                ]
              ),
            ),
            ),
        _buildRepresentationCard(
          'Array Representation',
          'For complete binary trees: left=2i+1, right=2i+2',
          Icons.list
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
Text(' Binary Tree Array Representation',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('ba.webp',height: 270,width:350,)
                ]
              ),
            ),
            ),
      ],
    );
  }



  Widget _buildTreeTypeCard(String title, String description, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
      ),
    );
  }

  Widget _buildRepresentationCard(String title, String description, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
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
}