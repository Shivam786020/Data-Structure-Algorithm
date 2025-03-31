import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/data/funct1.dart';
import 'package:dsa_app/data/funct2.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: const Text('Data Structure Details', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction Section
            _buildSection(
              title: 'What are Data Structures?',
              content: 'Data structures are specialized formats for organizing, processing, retrieving and storing data. They enable efficient access and modification of data in computer programs.',
              icon: Icons.storage,
            ),
            
            const SizedBox(height: 25),
            
            // Types of Data Structures
            _buildSection(
              title: 'Types of Data Structures',
              content: '''
**1. Primitive Data Structures**:
   - Basic building blocks (int, float, char, bool)
   
**2. Linear Data Structures**:
   - Arrays, Linked Lists, Stacks, Queues
   - Elements arranged sequentially
   
**3. Non-Linear Data Structures**:
   - Trees, Graphs
   - Hierarchical or networked relationships
''',
              icon: Icons.category,
            ),
            
            const SizedBox(height: 25),
            
            // Inbuilt Data Structures
            _buildSection(
              title: 'Inbuilt Data Structures',
              content: '''
Inbuilt data structure are provided by the programming language itself. In Dart, some of the inbuilt data structures are:
''',
           icon: Icons.build,
         ),
         const funct2(),
         const SizedBox(height: 25),
         
         // Abstract Data Types
         _buildSection(
           title: 'Abstract Data Types (ADTs)',
           content: '''
**Definition**: Mathematical model for data types defined by behavior, not implementation.

The definition of ADT includes:
ADT only mentions what operations are to be performed but not how these operations will be implemented. It does not specify how data will be organized in memory and what algorithms will be used for implementing the operations.
''',
           icon: Icons.architecture,
         ),
         const funct1(),
         const SizedBox(height: 25),
         
         // Linear vs Non-Linear
         _buildSection(
           title: 'Linear vs Non-Linear Structures',
           content: '''
**Linear Data Structures**:
- Elements form a sequence
- Single level hierarchy
- Examples: Arrays, Linked Lists, Stacks, Queues

**Non-Linear Data Structures**:
- Elements form a hierarchy or network
- Multiple levels
- Examples: Trees, Graphs, Heaps''',
           icon: Icons.compare_arrows,
         ),
         
         const SizedBox(height: 25),
         
         // Static vs Dynamic
         _buildSection(
           title: 'Static vs Dynamic Structures',
           content: '''
**Static Data Structures**:
- Fixed size (allocated at compile time)
- Example: Arrays
- Faster access but less flexible

**Dynamic Data Structures**:
- Size can grow/shrink at runtime
- Examples: Linked Lists, Trees
- More flexible but slightly slower access''',
           icon: Icons.autorenew,
         ),
         
         const SizedBox(height: 25),
         
         // Common Operations
         _buildSection(
           title: 'Common Data Structure Operations',
           content: '''
1. **Traversal**: Access each element
2. **Insertion**: Add new element
3. **Deletion**: Remove an element
4. **Searching**: Find an element
5. **Sorting**: Arrange elements
6. **Merging**: Combine two structures''',
           icon: Icons.settings,
         ),
         
         const SizedBox(height: 25),
         
         // Choosing a Data Structure
         _buildSection(
           title: 'How to Choose a Data Structure',
           content: '''
1. **Nature of data**: Hierarchical? Sequential?
2. **Access pattern**: Random access? Sequential?
3. **Operation frequency**: More inserts? More searches?
4. **Memory constraints**: Fixed size? Dynamic?
5. **Time complexity**: What operations need to be fastest?''',
           icon: Icons.help,
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
         const SizedBox(width: 10),
         Text(
           title,
           style: const TextStyle(
             fontSize: 22,
             fontWeight: FontWeight.w400,
             color: Colors.white,
           ),
         ),
       ],
     ),
     const SizedBox(height: 10),
     Text(
       content,
       style: const TextStyle(
         fontSize: 14,
         color: Colors.white70,
         height: 1.5,
       ),
     ),
   ],
 );
}
}