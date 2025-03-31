import 'package:dsa_app/algorithms/alogoriths.dart';
import 'package:dsa_app/arry/oper.dart';
import 'package:dsa_app/collison/buck.dart';
import 'package:dsa_app/collison/open.dart';
import 'package:dsa_app/collison/separ.dart';
import 'package:dsa_app/dynamic/bellman.dart';
import 'package:dsa_app/dynamic/coin.dart';
import 'package:dsa_app/dynamic/knapsack.dart';
import 'package:dsa_app/dynamic/longest.dart';
import 'package:dsa_app/graph/bred.dart';
import 'package:dsa_app/graph/depth.dart';
import 'package:dsa_app/graph/topo.dart';
import 'package:dsa_app/greedy/dij.dart';
import 'package:dsa_app/greedy/huff.dart';
import 'package:dsa_app/greedy/krus.dart';
import 'package:dsa_app/greedy/prim.dart';
import 'package:dsa_app/linked/circu.dart';
import 'package:dsa_app/linked/doub.dart';
import 'package:dsa_app/linked/sing.dart';
import 'package:dsa_app/oopsjava/java.dart';
import 'package:dsa_app/oopsjava/unit1.dart';
import 'package:dsa_app/oopsjava/unit2.dart';
import 'package:dsa_app/oopsjava/unit4.dart';
import 'package:dsa_app/oopsjava/unit5.dart';
import 'package:dsa_app/oopsjava/unti3.dart';
import 'package:dsa_app/queu/arrq.dart';
import 'package:dsa_app/queu/heaope.dart';
import 'package:dsa_app/queu/linkq.dart';
import 'package:dsa_app/sorting/bubble.dart';
import 'package:dsa_app/sorting/insert.dart';
import 'package:dsa_app/sorting/merge.dart';
import 'package:dsa_app/sorting/quick.dart';
import 'package:dsa_app/sorting/select.dart';
import 'package:dsa_app/sorting/sort.dart';
import 'package:dsa_app/stack/arr.dart';
import 'package:dsa_app/stack/ex.dart';
import 'package:dsa_app/stack/link.dart';
import 'package:dsa_app/tree/avl.dart';
import 'package:dsa_app/tree/bina.dart';
import 'package:dsa_app/tree/biser.dart';
import 'package:dsa_app/tree/mulw.dart';
import 'package:flutter/material.dart';
import '../constants/color.dart'; // Import custom colors
import 'package:dsa_app/data/Arrays.dart';
import 'package:dsa_app/data/Structure.dart';
import 'package:dsa_app/data/graphs.dart';
import 'package:dsa_app/data/hashtable.dart';
import 'package:dsa_app/data/heap.dart';
import 'package:dsa_app/data/linked.dart';
import 'package:dsa_app/data/queue.dart';
import 'package:dsa_app/data/stack.dart';
import 'package:dsa_app/data/tree.dart';
import 'package:dsa_app/algorithms/analysis.dart';
import 'package:dsa_app/algorithms/asymptotic.dart';
import 'package:dsa_app/algorithms/backtrack.dart';
import 'package:dsa_app/algorithms/complexity.dart';
import 'package:dsa_app/algorithms/devide.dart';
import 'package:dsa_app/algorithms/dynamic.dart';
import 'package:dsa_app/algorithms/greedy.dart';
import 'package:dsa_app/algorithms/iteration.dart';
import 'package:dsa_app/algorithms/searching.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF22242D), // Drawer background color
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color(0xFF22242D)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset('logo.jpg', height: 90, width: 90, fit: BoxFit.cover),
                ),
                SizedBox(height: 10),
                Text(
                  'Data Structures & Algorithms',
                  style: TextStyle(fontSize: 16, color: customcolor.whiteprimary),
                ),

              ],
            ),
          ),

          _buildCategoryTitle('Data Structures'),
            _buildExpandableTile(
            context,
            icon: Icons.call_split,
            title: 'Arrays',
            children: [
          _buildListTile(Icons.arrow_right, 'Arrays', context, Arrays()),

              _buildListTile(Icons.arrow_right, 'Array Operations', context, Oper()),
                            _buildListTile(Icons.arrow_right, 'Bubble Sort', context, Bubble()),

              _buildListTile(Icons.arrow_right, 'Quick Sort', context, Quick()),
                            _buildListTile(Icons.arrow_right, 'Array Operations', context, Oper()),
              _buildListTile(Icons.arrow_right, 'Sorting', context, Sort()),
              _buildListTile(Icons.arrow_right, 'Merge Sort', context, Merge()),
              _buildListTile(Icons.arrow_right, 'Insertion Sort', context, Insert()),
                            _buildListTile(Icons.arrow_right, 'Selection Sort', context, Select()),



            ],
          ),
          _buildListTile(Icons.table_chart, 'Structure', context, Structure()),
            _buildExpandableTile(
            context,
            icon: Icons.link,
            title: 'Linked List',
            children: [
          _buildListTile(Icons.arrow_right, 'Linked List', context, Linked()),

              _buildListTile(Icons.arrow_right, 'Singly Linked List', context, Sing()),
              _buildListTile(Icons.arrow_right, 'Doubly Linked List', context, Doub()),
                            _buildListTile(Icons.arrow_right, 'Circular Linked List', context, Circu()),

            ],
          ),
             _buildExpandableTile(
            context,
            icon: Icons.stacked_bar_chart,
            title: 'Stack',
            children: [
          _buildListTile(Icons.arrow_right, 'Stack', context, Stackk()),

              _buildListTile(Icons.arrow_right, 'Expression Evaluation', context, Ex()),

              _buildListTile(Icons.arrow_right, 'Array Implement', context, Arr()),
              _buildListTile(Icons.arrow_right, 'Linked List Imple', context, Link()),

            ],
          ),
             _buildExpandableTile(
            context,
            icon: Icons.queue,
            title: 'Queue',
            children: [

          _buildListTile(Icons.arrow_right, 'Queue', context, Queue()),

              _buildListTile(Icons.arrow_right, 'Array Implement', context, Arrq()),
              _buildListTile(Icons.arrow_right, 'Linked List Imple', context, Linkq()),

            ],
          ),
           _buildExpandableTile(
            context,
            icon: Icons.account_tree,
            title: 'Trees',
            children: [
          _buildListTile(Icons.arrow_right, 'Trees', context, Tree()),

          _buildListTile(Icons.arrow_right, 'Binary Tree', context, Bina()),

              _buildListTile(Icons.arrow_right, 'Binary Search Tree', context, Biser()),
              _buildListTile(Icons.arrow_right, 'Multiway Search Tree', context, Mulw()),
              _buildListTile(Icons.arrow_right, 'AVL Tree', context, Avl()),


            ],
          ),
             _buildExpandableTile(
            context,
            icon: Icons.scatter_plot,
            title: 'Heap',
            children: [

          _buildListTile(Icons.arrow_right, 'Heap', context, Heap()),

              _buildListTile(Icons.arrow_right, 'Heap Operations', context, Heaope()),

            ],
          ),
           _buildExpandableTile(
            context,
            icon: Icons.graphic_eq,
            title: 'Graphs',
            children: [
          _buildListTile(Icons.arrow_right, 'Graphs', context, Graphs()),


              _buildListTile(Icons.arrow_right, 'Breadth First Search', context, Bred()),
              _buildListTile(Icons.arrow_right, 'Depth First Search', context, Depth()),
              _buildListTile(Icons.arrow_right, 'Topological Sorting', context, Topo()),

            ],
          ),
         _buildExpandableTile(
            context,
            icon: Icons.dashboard,
            title: 'Hash Tables',
            children: [

          _buildListTile(Icons.arrow_right, 'Hash Tables', context, Hashtable()),

              _buildListTile(Icons.arrow_right, 'Open Addresing', context, Open()),
              _buildListTile(Icons.arrow_right, 'Separate Chaining', context, Separ()),
              _buildListTile(Icons.arrow_right, 'Bucket Hashing', context, Buck()),

            ],
          ),
          Divider(color: customcolor.whitesecondary, thickness: 0.5),

          _buildCategoryTitle('Algorithms'),

          _buildListTile(Icons.code, 'Algorithms', context, Algorithms()),
          _buildListTile(Icons.analytics, 'How to Analyze Algorithms', context, Analysis()),
          
          // Expansion Tile for Searching Algorithms
          _buildExpandableTile(
            context,
            icon: Icons.search,
            title: 'Searching Algorithms',
            children: [
              _buildListTile(Icons.arrow_right, 'Linear Search', context, Searching()),
              _buildListTile(Icons.arrow_right, 'Binary Search', context, Searching()),
            ],
          ),

          _buildListTile(Icons.timelapse, 'Complexity of Algorithms', context, Complexity()),
          _buildListTile(Icons.functions, 'Asymptotic Notation', context, Asymptotic()),

          // Expansion Tile for Divide & Conquer Algorithms
          _buildExpandableTile(
            context,
            icon: Icons.call_split,
            title: 'Divide & Conquer',
            children: [
                        _buildListTile(Icons.arrow_right, 'Divide & Conquer', context, Devide()),
              _buildListTile(Icons.arrow_right, 'Merge Sort', context, Merge()),
              _buildListTile(Icons.arrow_right, 'Quick Sort', context, Quick()),
            ],
          ),
   _buildExpandableTile(
            context,
            icon: Icons.call_split,
            title: 'Greedy Algorithms',
            children: [
          _buildListTile(Icons.arrow_right, 'Greedy Algorithms', context, Greedy()),
          _buildListTile(Icons.arrow_right, 'Prim\'s Algorithm', context, Prim()),
          _buildListTile(Icons.arrow_right, 'Krushkal\'s Algorithm', context, Krus()),
          _buildListTile(Icons.arrow_right, 'Huffman Algorithm', context, Huff()),
          _buildListTile(Icons.arrow_right, 'Dijkstra\'s Algorithm', context, Dij()),
            ],
             
            
          ),
             _buildExpandableTile(
            context,
            icon: Icons.memory,
            title: 'Dynamic Programming',
            children: [
          _buildListTile(Icons.arrow_right, 'Dynamic Programming', context, Dynamic()),
          _buildListTile(Icons.arrow_right, 'Bellman Ford', context, Bellman()),
          _buildListTile(Icons.arrow_right, '0/1 Knapsack', context, Knapsack()),
          _buildListTile(Icons.arrow_right, 'Longest Common Subsequence', context, Longest()),
          _buildListTile(Icons.arrow_right, 'Coin Change', context, Coin()),

          
            ],
             
            
          ),
          _buildListTile(Icons.undo, 'Backtracking', context, Backtrack()),

          // Expansion Tile for Backtracking
        

          _buildListTile(Icons.repeat, 'Iteration & Recursion', context, Iteration()),
          Divider(color: customcolor.whitesecondary, thickness: 0.5),

                    _buildCategoryTitle('Computer science related subjects'),
    _buildExpandableTile(
            context,
            icon: Icons.javascript_outlined,
            title: 'Java with oops',
            children: [

          _buildListTile(Icons.arrow_right, 'Java with oops', context, Java()),

              _buildListTile(Icons.arrow_right, 'Unit 1', context, Unit1()),
              _buildListTile(Icons.arrow_right, 'Unit 2', context, Unit2()),
              _buildListTile(Icons.arrow_right, 'Unit 3', context, Unti3()),
              _buildListTile(Icons.arrow_right, 'Unit 4', context, Unit4()),
              _buildListTile(Icons.arrow_right, 'Unit 5', context, Unit5()),

            ],
          ),

        ],
      ),
    );
  }

  /// Helper method to build normal list tiles
  Widget _buildListTile(IconData icon, String title, BuildContext context, Widget targetPage) {
    return ListTile(
      leading: Icon(icon, size: 20, color: customcolor.whiteprimary),
      title: Text(title, style: TextStyle(color: customcolor.whitesecondary)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => targetPage));
      },
    );
  }

  /// Helper method to build expandable list items
  Widget _buildExpandableTile(BuildContext context, {required IconData icon, required String title, required List<Widget> children}) {
    return ExpansionTile(
      leading: Icon(icon, size: 20, color: customcolor.whiteprimary),
      title: Text(title, style: TextStyle(color: customcolor.whitesecondary)),
      children: children,
    );
  }

  /// Helper method to build category title
  Widget _buildCategoryTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Text(
        title,
        style: TextStyle(fontSize: 12, color: customcolor.whiteprimary, fontWeight: FontWeight.bold),
      ),
    );
  }
}