import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Ex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Expression Notations', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Infix Notation
            _buildSection(
              title: '1. Infix Notation',
              content: '''
Infix is the common arithmetic notation where the operator appears between operands.

Characteristics:
• Operators are written between operands
• Requires parentheses to define precedence
• Humans find this most intuitive
• Evaluation requires knowledge of operator precedence

Examples:
• 2 + 3
• (5 - 3) * 4
• 10 / (2 + 3)''',
              icon: Icons.format_align_center,
            ),

            // Prefix Notation
            _buildSection(
              title: '2. Prefix (Polish) Notation',
              content: '''
Prefix notation places the operator before its operands.

Characteristics:
• Operators precede their operands
• No parentheses needed
• Perfect for stack-based evaluation
• Computer-friendly format

Examples:
• + 2 3 → same as 2 + 3
• * - 5 3 4 → same as (5 - 3) * 4
• / 10 + 2 3 → same as 10 / (2 + 3)''',
              icon: Icons.format_align_left,
            ),

            // Postfix Notation
            _buildSection(
              title: '3. Postfix (Reverse Polish) Notation',
              content: '''
Postfix notation places the operator after its operands.

Characteristics:
• Operators follow their operands
• No parentheses needed
• Easy to evaluate using stacks
• Used in some calculators (like HP RPN calculators)

Examples:
• 2 3 + → same as 2 + 3
• 5 3 - 4 * → same as (5 - 3) * 4
• 10 2 3 + / → same as 10 / (2 + 3)''',
              icon: Icons.format_align_right,
            ),

            // Conversion Examples
            _buildSection(
              title: 'Conversion Examples',
              content: 'Comparing all three notations:',
              icon: Icons.compare_arrows,
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Infix', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                DataColumn(label: Text('Prefix', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
                DataColumn(label: Text('Postfix', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('2 + 3',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('+ 2 3',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('2 3 +',style: TextStyle(color: Colors.white),)),
                ]),
                DataRow(cells: [
                  DataCell(Text('(5 - 3) * 4',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('* - 5 3 4',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('5 3 - 4 *',style: TextStyle(color: Colors.white),)),
                ]),
                DataRow(cells: [
                  DataCell(Text('10 / (2 + 3)',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('/ 10 + 2 3',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('10 2 3 + /',style: TextStyle(color: Colors.white),)),
                ]),
                DataRow(cells: [
                  DataCell(Text('3 + 4 * 5',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('+ 3 * 4 5',style: TextStyle(color: Colors.white),)),
                  DataCell(Text('3 4 5 * +',style: TextStyle(color: Colors.white),)),
                ]),
              ],
            ),

            // Evaluation Steps
            _buildSection(
              title: 'Evaluation Steps',
              content: 'How to evaluate each notation:',
              icon: Icons.calculate,
            ),
            _buildSubSection('Infix Evaluation:'),
            Text('1. Follow standard arithmetic rules (PEMDAS/BODMAS)\n2. Evaluate parentheses first\n3. Evaluate higher precedence operators first\n\nExample: (5 - 3) * 4\n1. 5 - 3 = 2\n2. 2 * 4 = 8',
              style: TextStyle(fontSize: 14, height: 1.5,color: Colors.white70)),

            _buildSubSection('Prefix Evaluation (Right to Left):'),
            Text('1. Find first operator followed by two operands\n2. Evaluate that operation\n3. Replace the trio with the result\n4. Repeat\n\nExample: * - 5 3 4\n1. - 5 3 → 2\n2. * 2 4 → 8',
              style: TextStyle(fontSize: 14, height: 1.5,color: Colors.white70)),

            _buildSubSection('Postfix Evaluation (Left to Right):'),
            Text('1. Scan until first operator\n2. Apply it to previous two operands\n3. Replace the trio with result\n4. Repeat\n\nExample: 5 3 - 4 *\n1. 5 3 - → 2\n2. 2 4 * → 8',
              style: TextStyle(fontSize: 14, height: 1.5,color: Colors.white70)),

            // Key Differences
            _buildSection(
              title: 'Key Differences',
              content: '',
              icon: Icons.difference,
            ),
           DataTable(
  columns: [
    DataColumn(label: Text('Aspect', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
    DataColumn(label: Text('Infix', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
    DataColumn(label: Text('Prefix', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
    DataColumn(label: Text('Postfix', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
  ],
  rows: [
    DataRow(cells: [
      DataCell(Text('Operator Position', style: TextStyle(color: Colors.white))),
      DataCell(Text('Between operands', style: TextStyle(color: Colors.white))),
      DataCell(Text('Before operands', style: TextStyle(color: Colors.white))),
      DataCell(Text('After operands', style: TextStyle(color: Colors.white))),
    ]),
    DataRow(cells: [
      DataCell(Text('Parentheses Needed', style: TextStyle(color: Colors.white))),
      DataCell(Text('Yes', style: TextStyle(color: Colors.white))),
      DataCell(Text('No', style: TextStyle(color: Colors.white))),
      DataCell(Text('No', style: TextStyle(color: Colors.white))),
    ]),
    DataRow(cells: [
      DataCell(Text('Evaluation Direction', style: TextStyle(color:  Colors.white))),
      DataCell(Text('Mixed', style: TextStyle(color: Colors.white))),
      DataCell(Text('Right to Left', style: TextStyle(color: Colors.white))),
      DataCell(Text('Left to Right', style: TextStyle(color: Colors.white))),
    ]),
    DataRow(cells: [
      DataCell(Text('Human Readability', style: TextStyle(color: Colors.white))),
      DataCell(Text('Easiest', style: TextStyle(color: Colors.white))),
      DataCell(Text('Hard', style: TextStyle(color: Colors.white))),
      DataCell(Text('Medium', style: TextStyle(color: Colors.white))),
    ]),
  ],
),
          ]
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
          color: Colors.blue,
        ),
      ),
    );
  }

}