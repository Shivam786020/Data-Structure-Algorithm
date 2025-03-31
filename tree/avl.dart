import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Avl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('AVL Tree', 
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
                title: 'AVL Tree Fundamentals',
                content: '''
An AVL tree is a self-balancing Binary Search Tree (BST) where the difference between heights of left and right subtrees (balance factor) cannot be more than 1 for all nodes.

Key Properties:
• Height-balanced BST (|balance factor| ≤ 1)
• Guarantees O(log n) search, insert, and delete
• More strictly balanced than Red-Black trees
• Named after inventors Adelson-Velsky and Landis (1962)

Balance Factor:
For any node N: BF(N) = height(left(N)) - height(right(N))
• BF ∈ {-1, 0, 1} for AVL property
• If BF < -1 or BF > 1, rotations are needed''',
                icon: Icons.balance,
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
Text(' AVL Tree',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('avl.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Rotations Section
              _buildSection(
                title: 'AVL Tree Rotations',
                content: 'Operations to restore balance:',
                icon: Icons.rotate_90_degrees_ccw,
              ),
              _buildRotationTypes(),

              // Operations Section
              _buildSection(
                title: 'AVL Tree Operations',
                content: 'How AVL trees maintain balance:',
                icon: Icons.build,
              ),
              _buildOperations(),

              // Implementation
              _buildSection(
                title: 'AVL Tree Implementation',
                content: 'Java implementation with rotations:',
                icon: Icons.code,
              ),
              _buildCodeBlock('''
class AVLNode {
    int key, height;
    AVLNode left, right;
    
    AVLNode(int d) {
        key = d;
        height = 1;
    }
}

class AVLTree {
    AVLNode root;
    
    int height(AVLNode N) {
        return (N == null) ? 0 : N.height;
    }
    
    int max(int a, int b) {
        return (a > b) ? a : b;
    }
    
    // Right rotation
    AVLNode rightRotate(AVLNode y) {
        AVLNode x = y.left;
        AVLNode T2 = x.right;
        
        x.right = y;
        y.left = T2;
        
        y.height = max(height(y.left), height(y.right)) + 1;
        x.height = max(height(x.left), height(x.right)) + 1;
        
        return x;
    }
    
    // Left rotation
    AVLNode leftRotate(AVLNode x) {
        AVLNode y = x.right;
        AVLNode T2 = y.left;
        
        y.left = x;
        x.right = T2;
        
        x.height = max(height(x.left), height(x.right)) + 1;
        y.height = max(height(y.left), height(y.right)) + 1;
        
        return y;
    }
    
    // Get balance factor
    int getBalance(AVLNode N) {
        return (N == null) ? 0 : height(N.left) - height(N.right);
    }
    
    // Insertion with balancing
    AVLNode insert(AVLNode node, int key) {
        if (node == null) return new AVLNode(key);
        
        if (key < node.key)
            node.left = insert(node.left, key);
        else if (key > node.key)
            node.right = insert(node.right, key);
        else
            return node; // Duplicate keys not allowed
            
        node.height = 1 + max(height(node.left), height(node.right));
        
        int balance = getBalance(node);
        
        // Left Left Case
        if (balance > 1 && key < node.left.key)
            return rightRotate(node);
            
        // Right Right Case
        if (balance < -1 && key > node.right.key)
            return leftRotate(node);
            
        // Left Right Case
        if (balance > 1 && key > node.left.key) {
            node.left = leftRotate(node.left);
            return rightRotate(node);
        }
        
        // Right Left Case
        if (balance < -1 && key < node.right.key) {
            node.right = rightRotate(node.right);
            return leftRotate(node);
        }
        
        return node;
    }
}'''),

              // Complexity Analysis
              _buildSection(
                title: 'Complexity Analysis',
                content: 'Performance characteristics:',
                icon: Icons.timer,
              ),
              _buildComplexityTable(),

              // Applications
              _buildSection(
                title: 'AVL Tree Applications',
                content: 'Where AVL trees excel:',
                icon: Icons.apps,
              ),
              _buildBulletPoints([
                'Databases requiring frequent lookups',
                'Memory-constrained systems needing guaranteed O(log n)',
                'Real-time systems with strict performance requirements',
                'Implementing ordered maps/dictionaries',
                'Priority queues with frequent deletions'
              ]),

              // Comparison
              _buildSection(
                title: 'AVL vs Red-Black Trees',
                content: 'When to choose AVL trees:',
                icon: Icons.compare,
              ),
              _buildComparisonTable(),

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
                Icon(Icons.balance, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('AVL Tree',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A self-balancing Binary Search Tree that maintains O(log n) search time by ensuring the height difference between subtrees is at most 1.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Self-balancing'),
                _buildTag('O(log n) Guaranteed'),
                _buildTag('Height-balanced'),
                _buildTag('Rotations'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRotationTypes() {
    return Column(
      children: [
        _buildRotationCard(
          'Left Rotation',
          'When right subtree is taller (BF < -1)',
          'assets/avl_left_rot.png',
          Colors.blue
        ),
        _buildRotationCard(
          'Right Rotation',
          'When left subtree is taller (BF > 1)',
          'assets/avl_right_rot.png',
          Colors.green
        ),
        _buildRotationCard(
          'Left-Right Rotation',
          'Left-heavy then right-heavy subtree',
          'assets/avl_left_right_rot.png',
          Colors.orange
        ),
        _buildRotationCard(
          'Right-Left Rotation',
          'Right-heavy then left-heavy subtree',
          'assets/avl_right_left_rot.png',
          Colors.purple
        ),
      ],
    );
  }

  Widget _buildOperations() {
    return Column(
      children: [
        _buildOperationStep('1. Insertion:', [
          'Perform standard BST insertion',
          'Update heights of ancestor nodes',
          'Check balance factor',
          'Perform rotations if unbalanced'
        ]),
        _buildOperationStep('2. Deletion:', [
          'Perform standard BST deletion',
          'Update heights of ancestor nodes',
          'Check balance factor',
          'Perform rotations if unbalanced'
        ]),
        _buildOperationStep('3. Search:', [
          'Same as BST (O(log n) guaranteed)',
          'No balancing needed'
        ]),
      ],
    );
  }

  Widget _buildComplexityTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Operation', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Time', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Space', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Search', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
        ]),
        DataRow(cells: [
          DataCell(Text('Insertion', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
        ]),
        DataRow(cells: [
          DataCell(Text('Deletion', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
        ]),
        DataRow(cells: [
          DataCell(Text('Rotation', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
        ]),
      ],
    );
  }

  Widget _buildComparisonTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Feature', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('AVL Tree', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Red-Black', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Balance Strictness', style: TextStyle(color: Colors.white))),
          DataCell(Text('More strict', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Less strict', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Search Performance', style: TextStyle(color: Colors.white))),
          DataCell(Text('Faster', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Slightly slower', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Insert/Delete Cost', style: TextStyle(color: Colors.white))),
          DataCell(Text('Higher', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Lower', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Rotation Types', style: TextStyle(color: Colors.white))),
          DataCell(Text('4', style: TextStyle(color: Colors.orange))),
          DataCell(Text('2', style: TextStyle(color: Colors.blue))),
        ]),
        
      ],
    );
  }

  Widget _buildRotationCard(String title, String description, String imagePath, Color color) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey[900],
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.rotate_right, color: color),
            title: Text(title, style: TextStyle(color: Colors.white)),
            subtitle: Text(description, style: TextStyle(color: Colors.white70)),
          ),
          Image.asset(imagePath, height: 120),
        ],
      ),
    );
  }

  Widget _buildOperationStep(String title, List<String> steps) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey[900],
      child: ExpansionTile(
        title: Text(title, style: TextStyle(color: Colors.white)),
        children: steps.map((step) => 
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 8),
            child: Row(
              children: [
                Icon(Icons.arrow_right, size: 20, color: Colors.white70),
                SizedBox(width: 8),
                Text(step, style: TextStyle(color: Colors.white70)),
              ],
            ),
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
}