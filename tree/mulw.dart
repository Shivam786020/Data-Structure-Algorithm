import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Mulw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Multiway Search Tree', 
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
                title: 'Multiway Tree Fundamentals',
                content: '''
A Multiway Search Tree is a tree data structure where each node can have more than two children, typically used for efficient disk-based storage and retrieval.

Key Properties:
• Each node can have multiple keys and children
• For a node with m keys, it can have up to m+1 children
• All keys in a subtree are ordered (left < key1 < middle < key2 < right)
• Better suited for disk storage than binary trees (reduces I/O operations)

Comparison with Binary Trees:
• Shallower trees (reduced height)
• Better cache performance
• More complex insertion/deletion algorithms
• Common in database systems and file systems''',
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
Text(' Multiway Search Tree Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('mul.webp',height: 270,width:350,)
                ]
              ),
            ),
            ),
              // Types Section
              _buildSection(
                title: 'Types of Multiway Trees',
                content: 'Common variants and their characteristics:',
                icon: Icons.type_specimen,
              ),
              _buildTreeTypes(),

              // Operations Section
              _buildSection(
                title: 'Multiway Tree Operations',
                content: 'Core operations and their logic:',
                icon: Icons.build,
              ),
              _buildOperations(),

              // B-Tree Implementation
              _buildSection(
                title: 'B-Tree Implementation',
                content: 'Basic B-Tree structure in Java:',
                icon: Icons.code,
              ),
              _buildCodeBlock('''
// B-Tree Node
class BTreeNode {
    int[] keys;     // Array of keys
    int t;          // Minimum degree
    BTreeNode[] children; // Child pointers
    int n;          // Current number of keys
    boolean leaf;   // Is leaf node
    
    BTreeNode(int t, boolean leaf) {
        this.t = t;
        this.leaf = leaf;
        keys = new int[2*t-1];
        children = new BTreeNode[2*t];
        n = 0;
    }
    
    // Search a key in subtree
    BTreeNode search(int k) {
        int i = 0;
        while (i < n && k > keys[i]) i++;
        
        if (i < n && keys[i] == k) return this;
        if (leaf) return null;
        return children[i].search(k);
    }
}

// B-Tree class
class BTree {
    BTreeNode root;
    int t;  // Minimum degree
    
    BTree(int t) {
        this.t = t;
        root = null;
    }
    
    // Insert key
    void insert(int k) {
        if (root == null) {
            root = new BTreeNode(t, true);
            root.keys[0] = k;
            root.n = 1;
        } else {
            if (root.n == 2*t-1) {
                BTreeNode s = new BTreeNode(t, false);
                s.children[0] = root;
                s.splitChild(0, root);
                
                int i = 0;
                if (s.keys[0] < k) i++;
                s.children[i].insertNonFull(k);
                
                root = s;
            } else {
                root.insertNonFull(k);
            }
        }
    }
    
    // Delete key
    void delete(int k) {
        if (root == null) return;
        
        root.delete(k);
        
        if (root.n == 0) {
            if (root.leaf) root = null;
            else root = root.children[0];
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
                title: 'Multiway Tree Applications',
                content: 'Where multiway trees excel:',
                icon: Icons.apps,
              ),
              _buildBulletPoints([
                'Database systems (B-trees, B+ trees)',
                'File systems (NTFS, ReiserFS, XFS)',
                'DNS servers and distributed systems',
                'Blockchain implementations',
                'GIS and spatial databases',
                'Large-scale data storage systems'
              ]),

              // Comparison
              _buildSection(
                title: 'Multiway vs Binary Trees',
                content: 'When to choose multiway trees:',
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
                Icon(Icons.mediation, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('Multiway Search Tree',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('A tree data structure where each node can have multiple keys and children, optimized for disk storage and large datasets with efficient search operations.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Multiple Children'),
                _buildTag('Disk-Optimized'),
                _buildTag('Balanced'),
                _buildTag('O(log n) Operations'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTreeTypes() {
    return Column(
      children: [
        _buildTreeTypeCard(
          'B-Tree',
          'Self-balancing, all leaves same depth\nUsed in databases and file systems',
          Icons.storage,
          Colors.blue
        ),
        _buildTreeTypeCard(
          'B+ Tree',
          'All data in leaves, linked leaves\nBetter for range queries than B-trees',
          Icons.link,
          Colors.green
        ),
        _buildTreeTypeCard(
          '2-3 Tree',
          'Nodes contain 1-2 keys and 2-3 children\nAlways maintains perfect balance',
          Icons.balance,
          Colors.orange
        ),
        _buildTreeTypeCard(
          'T-Tree',
          'Combines AVL trees and B-trees\nUsed in main-memory databases',
          Icons.memory,
          Colors.purple
        ),
      ],
    );
  }

  Widget _buildOperations() {
    return Column(
      children: [
        _buildOperationCard(
          'Search',
          '1. Start at root\n2. Compare key with node keys\n3. Follow appropriate child pointer\n4. Repeat until found or leaf reached',
          Icons.search
        ),
        _buildOperationCard(
          'Insertion',
          '1. Search for appropriate leaf\n2. Insert key in sorted order\n3. Split node if overflow occurs\n4. Propagate splits upward if needed',
          Icons.add_circle
        ),
        _buildOperationCard(
          'Deletion',
          '1. Locate key to delete\n2. Handle various cases (leaf/non-leaf)\n3. Merge or redistribute keys if underflow\n4. Propagate changes upward if needed',
          Icons.delete
        ),
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
          DataCell(Text('O(n)', style: TextStyle(color: Colors.green))),
        ]),
        DataRow(cells: [
          DataCell(Text('Insertion', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.green))),
        ]),
        DataRow(cells: [
          DataCell(Text('Deletion', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(n)', style: TextStyle(color: Colors.green))),
        ]),
        DataRow(cells: [
          DataCell(Text('Range Query', style: TextStyle(color: Colors.white))),
          DataCell(Text('O(log n + k)', style: TextStyle(color: Colors.green))),
          DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
        ]),
      ],
    );
  }

  Widget _buildComparisonTable() {
    return DataTable(
      columns: [
        DataColumn(label: Text('Feature', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Multiway Tree', style: TextStyle(color: Colors.white))),
        DataColumn(label: Text('Binary Tree', style: TextStyle(color: Colors.white))),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Node Capacity', style: TextStyle(color: Colors.white))),
          DataCell(Text('Multiple keys/children', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Single key, 2 children', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Height', style: TextStyle(color: Colors.white))),
          DataCell(Text('Shorter (logₘ n)', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Taller (log₂ n)', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Disk Access', style: TextStyle(color: Colors.white))),
          DataCell(Text('Optimized (fewer seeks)', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Not optimized', style: TextStyle(color: Colors.blue))),
        ]),
        DataRow(cells: [
          DataCell(Text('Implementation', style: TextStyle(color: Colors.white))),
          DataCell(Text('More complex', style: TextStyle(color: Colors.orange))),
          DataCell(Text('Simpler', style: TextStyle(color: Colors.blue))),
        ]),
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
                style: TextStyle(color: Colors.white70, height: 1.5)),
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