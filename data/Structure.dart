import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Structure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Structures in Data Structures', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            _buildSection(
              title: 'What is a Structure?',
              content: '''
In programming, a structure (struct) is a composite data type that groups related variables under one name. Structures are used to:
• Represent real-world entities with multiple attributes
• Organize related data together
• Create complex data types from simple ones
• Improve code readability and maintainability

Key Characteristics:
• Contains members of different data types
• Value type (copied when assigned/passed)
• Fixed size at compile time
• No inheritance or methods (in traditional C-style structs)''',
              icon: Icons.architecture,
            ),

            // Java Implementation
            _buildSection(
              title: 'Java Implementation (Using Classes)',
              content: '''
Java doesn\'t have structs like C/C++, but we can use classes to achieve similar functionality. Here\'s how to create a structure-like entity in Java:''',
              icon: Icons.code,
            ),
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
                    '// Student structure example',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    'public class Student {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    // Data members (fields)',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    public int id;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    public String name;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    public double gpa;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    public String major;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '    // Constructor',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    public Student(int id, String name, double gpa, String major) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        this.id = id;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        this.name = name;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        this.gpa = gpa;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        this.major = major;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '// Usage example',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    'public class Main {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    public static void main(String[] args) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        // Create student structure',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        Student s1 = new Student(101, "Alice", 3.8, "Computer Science");',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '        // Access and modify fields',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        System.out.println(s1.name + " majors in " + s1.major);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        s1.gpa = 3.9; // Update GPA',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),

            // Explanation
            _buildSection(
              title: 'Code Explanation',
              content: '''
1. We created a Student class that acts as our structure
2. Defined public fields to store student attributes:
   - id (integer)
   - name (String)
   - gpa (double)
   - major (String)
3. Added a constructor to initialize all fields
4. In the main method:
   - Instantiated a Student object
   - Accessed its fields directly
   - Modified field values

Key Points:
• Java uses classes instead of traditional structs
• Public fields make it behave like a C-style struct
• Can add methods if needed (unlike pure structs)
• Similar to POJOs (Plain Old Java Objects)''',
              icon: Icons.lightbulb_outline,
            ),

            // Comparison
            _buildSection(
              title: 'Structures vs Classes',
              content: '''
| Feature        | Structure (C/C++) | Class (Java)       |
|----------------|-------------------|--------------------|
| Default Access | Public            | Package-private    |
| Memory         | Stack             | Heap               |
| Inheritance    | No                | Yes                |
| Methods        | No                | Yes                |
| Polymorphism   | No                | Yes                |
| Value/Ref      | Value type        | Reference type     |

In Java, we typically:
• Use classes instead of structures
• Follow encapsulation (make fields private)
• Add getters/setters for field access
• Can still create "struct-like" classes when needed''',
              icon: Icons.compare,
            ),

            // Real-world Use Cases
            _buildSection(
              title: 'Common Use Cases for Structures',
              content: '''
1. Representing database records
2. Storing configuration parameters
3. Mathematical concepts (Point, Rectangle, etc.)
4. Game development (Player, Enemy, Item attributes)
5. Network protocols (packet headers)
6. File formats (metadata structures)

Example Structures:
• Point { x, y }
• Employee { id, name, salary }
• Book { title, author, isbn, price }
• RGBColor { red, green, blue }''',
              icon: Icons.apps,
            ),

            // Advanced Java Example
            _buildSection(
              title: 'Advanced Java Example (Record Class)',
              content: 'Java 14+ introduced records for struct-like behavior:',
              icon: Icons.code,
            ),
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
                    '// Modern Java record (immutable structure)',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    'public record Point(int x, int y) { }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '// Usage:',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    'Point p = new Point(5, 10);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    'System.out.println(p.x()); // Accessor method',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
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
}