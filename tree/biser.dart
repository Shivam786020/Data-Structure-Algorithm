import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Biser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Binary Search Tree', 
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
                title: 'BST Fundamentals',
                content: '''
A Binary Search Tree (BST) is a node-based binary tree where each node has at most two children and follows the ordering property:

For any node N:
• All keys in left subtree < N's key
• All keys in right subtree > N's key
• No duplicate keys (typically)

Key Properties:
• Average Case: O(log n) for search/insert/delete
• Worst Case: O(n) (degenerates to linked list)
• In-order traversal gives sorted order
• No automatic balancing (unlike AVL/RB trees)''',
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
Text(' Binary Search Tree Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('bst.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Operations Section
              _buildSection(
                title: 'BST Operations',
                content: 'Core BST operations and their logic:',
                icon: Icons.build,
              ),
              _buildOperations(),

              // Traversal Section
          

              // Implementation
              _buildSection(
                title: 'BST Implementation',
                content: 'Complete Java implementation:',
                icon: Icons.code,
              ),
              _buildCodeBlock('''
class BSTNode {
    int key;
    BSTNode left, right;
    
    BSTNode(int item) {
        key = item;
        left = right = null;
    }
}

class BinarySearchTree {
    BSTNode root;
    
    BinarySearchTree() { root = null; }
    
    // Insert a new key
    void insert(int key) {
        root = insertRec(root, key);
    }
    
    BSTNode insertRec(BSTNode root, int key) {
        if (root == null) {
            return new BSTNode(key);
        }
        
        if (key < root.key) {
            root.left = insertRec(root.left, key);
        } else if (key > root.key) {
            root.right = insertRec(root.right, key);
        }
        
        return root;
    }
    
    // Search for a key
    boolean search(int key) {
        return searchRec(root, key);
    }
    
    boolean searchRec(BSTNode root, int key) {
        if (root == null) return false;
        if (root.key == key) return true;
        
        return (key < root.key) 
            ? searchRec(root.left, key) 
            : searchRec(root.right, key);
    }
    
    // Delete a key
    void delete(int key) {
        root = deleteRec(root, key);
    }
    
    BSTNode deleteRec(BSTNode root, int key) {
        if (root == null) return root;
        
        if (key < root.key) {
            root.left = deleteRec(root.left, key);
        } else if (key > root.key) {
            root.right = deleteRec(root.right, key);
        } else {
            // Node with only one child or no child
            if (root.left == null) return root.right;
            if (root.right == null) return root.left;
            
            // Node with two children: Get inorder successor
            root.key = minValue(root.right);
            root.right = deleteRec(root.right, root.key);
        }
        return root;
    }
    
    int minValue(BSTNode root) {
        int min = root.key;
        while (root.left != null) {
            min = root.left.key;
            root = root.left;
        }
        return min;
    }
    
    // Inorder traversal
    void inorder() { inorderRec(root); }
    void inorderRec(BSTNode root) {
        if (root != null) {
            inorderRec(root.left);
            System.out.print(root.key + " ");
            inorderRec(root.right);
        }
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
                title: 'BST Applications',
                content: 'Practical uses of BSTs:',
                icon: Icons.apps,
              ),
              _buildBulletPoints([
                'Implementing dictionaries/maps',
                'Database indexing',
                'Auto-completion and spell checking',
                'Network routing tables',
                '3D game engines for space partitioning',
                'Priority queues with dynamic keys'
              ]),

              // BST vs Hash Table
              _buildSection(
                title: 'BST vs Hash Table',
                content: 'When to choose BST over hash table:',
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
                Icon(Icons.search, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('Binary Search Tree',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A node-based binary tree data structure that maintains sorted order and provides efficient search, insertion, and deletion operations.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Sorted Order'),
                _buildTag('O(log n) Average'),
                _buildTag('Hierarchical'),
                _buildTag('No Duplicates'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperations() {
    return Column(
      children: [
        _buildOperationCard(
          'Insertion',
          '1. Start at root\n2. Compare key with current node\n3. Move left if smaller, right if larger\n4. Insert at empty spot',
          Icons.add_circle
        ),
        _buildOperationCard(
          'Search',
          '1. Start at root\n2. Compare key with current node\n3. Return if match\n4. Move left if smaller, right if larger\n5. Repeat until found or null',
          Icons.search
        ),
        _buildOperationCard(
          'Deletion',
          'Three cases:\n1. No child: Simply remove\n2. One child: Replace with child\n3. Two children: Find inorder successor',
          Icons.delete
        ),
      ],
    );
  }

  

  Widget _buildComplexityTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Operation', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Average', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Worst', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Search', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
        ]),
        DataRow(cells: [
          DataCell(Text('Insertion', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
        ]),
        DataRow(cells: [
          DataCell(Text('Deletion', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
        ]),
        DataRow(cells: [
          DataCell(Text('Traversal', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.green))),
        ]),
      ],
    );
  }

  Widget _buildComparisonTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Feature', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('BST', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Hash Table', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Ordering', style: TextStyle(color: Colors.white))),
          DataCell(Text('Sorted', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Unordered', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Search Time', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.orange))),
          DataCell(Text('O(1)', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Range Queries', style: TextStyle(color: Colors.white))),
          DataCell(Text('Efficient', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Inefficient', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Memory Usage', style: TextStyle(color: Colors.white))),
          DataCell(Text('Lower', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Higher', style: TextStyle(color: Colors.blue))),
        ]),
      ],
    );
  }

  Widget _buildOperationCard(String title, String steps, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey[900],
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: TextStyle(color: Colors.white)),
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(steps, 
                style: TextStyle(color: Colors.white70)),
          ),
        ],
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
            fontSize: 15,
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