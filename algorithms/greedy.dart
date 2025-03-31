
import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/greedy/func.dart';
import 'package:flutter/material.dart';

class Greedy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Greedy Algorithms', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section with More Detail
            _buildSection(
              title: 'What are Greedy Algorithms?',
              content: 
              'Greedy algorithms are a class of algorithms that make the most optimal choice at each decision point '
              'with the intention of finding the global optimum solution. They work by:\n\n'
              '1. Breaking problems into smaller subproblems\n'
              '2. Making the locally optimal choice at each step\n'
              '3. Never reconsidering previous choices (no backtracking)\n\n'
              'The key philosophy is "take what you can get now" without worrying about long-term consequences. '
              'This makes them efficient but doesn\'t guarantee optimal solutions for all problems.',
              icon: Icons.help_outline,
              color: Colors.blueAccent,
            ),
            
            SizedBox(height: 30),
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
Text('Animated Example of Greedy Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('greedy.gif',height: 250,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Structure Section with Diagram Explanation
            _buildSection(
              title: 'Anatomy of Greedy Algorithms',
              content: '''
A complete greedy algorithm consists of these components:

┌───────────────────┐   ┌───────────────────┐   ┌───────────────────┐
│  Candidate Set    │ → │  Selection        │ → │  Feasibility      │
│ (All possible     │   │  Function         │   │  Check            │
│  choices at each  │   │ (Chooses best     │   │ (Validates if     │
│  step)            │   │  local option)    │   │  choice leads to  │
└───────────────────┘   └───────────────────┘   └───────────────────┘
                                  ↓
                         ┌───────────────────┐   ┌───────────────────┐
                         │  Objective        │ → │  Solution         │
                         │  Function         │   │  Function         │
                         │ (Measures         │   │ (Constructs final │
                         │  solution quality)│   │  solution)        │
                         └───────────────────┘   └───────────────────┘

Key Characteristics:
• Makes irrevocable decisions
• Never looks ahead or behind
• Requires optimal substructure
• Needs greedy choice property''',
              icon: Icons.account_tree,
              color: Colors.greenAccent,
            ),
            
            SizedBox(height: 30),
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
Text('Animated Example of Greedy Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('gee.gif',height: 250,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 30),
            // Limitations Section with Case Study
            _buildSection(
              title: 'When Greedy Algorithms Fail',
              content: '''
Case Study: The 0/1 Knapsack Problem

Consider a thief with a knapsack that can hold 15kg. They encounter these items:
1. Gold: 10kg, ₹50,000 (₹5,000/kg)
2. Silver: 5kg, ₹20,000 (₹4,000/kg)
3. Bronze: 5kg, ₹15,000 (₹3,000/kg)

Greedy Approach (by value/kg):
• Takes Gold (10kg, ₹50k) → Remaining 5kg
• Can't take Silver (needs exactly 5kg)
• Total: ₹50k

Optimal Solution:
• Silver + Bronze = 10kg, ₹35k
• Better combinations exist!

This shows greedy fails when:
• Items cannot be divided (0/1 property)
• Local optimum doesn't lead to global optimum
• Problem lacks greedy choice property''',
              icon: Icons.warning,
              color: Colors.orangeAccent,
            ),
            
            SizedBox(height: 30),
            
            // Coin Change Example with Visualization
            _buildSection(
              title: 'Example: Indian Coin Change Problem',
              content: 'Find minimum coins for ₹93 using standard denominations (₹1, 2, 5, 10, 20, 50, 100, 200, 500, 2000)',
              icon: Icons.monetization_on,
              color: Colors.yellowAccent,
            ),
            
            // Interactive Code Example
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Optimal Solution Walkthrough:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildStep('Step 1', 'Sort coins descending: [2000,500,100,50,20,10,5,2,1]'),
                  _buildStep('Step 2', 'Start with largest coin ≤ remaining amount'),
                  _buildStep('Step 3', '₹93 → Use ₹50 (new amount: ₹43)'),
                  _buildStep('Step 4', '₹43 → Use ₹20 + ₹20 (new amount: ₹3)'),
                  _buildStep('Step 5', '₹3 → Use ₹2 + ₹1 (solution: 5 coins)'),
                  SizedBox(height: 15),
                  Container(
                    color: Colors.black,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '''List<int> coinChange(int amount) {
  List<int> coins = [1,2,5,10,20,50,100,200,500,2000];
  List<int> result = [];
  coins.sort((a,b) => b.compareTo(a)); // Descending
  
  for(int coin in coins) {
    while(amount >= coin) {
      amount -= coin;
      result.add(coin);
    }
  }
  return result;
}''',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Additional Examples Section
            _buildSection(
              title: 'More Greedy Algorithm Examples',
              content: '''
1. Activity Selection Problem:
   - Select maximum non-overlapping activities
   - Greedy choice: Earliest finishing time

2. Huffman Coding:
   - Build optimal prefix-free codes
   - Greedy choice: Merge least frequent nodes

3. Minimum Spanning Tree:
   - Prim's Algorithm: Grow tree from cheapest edge
   - Kruskal's: Add edges in order of weight''',
              icon: Icons.library_books,
              color: Colors.purpleAccent,
            ),
            
            SizedBox(height: 30),
            
            // Decision Flowchart
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'When to Use Greedy Approach?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '''Start
  │
  ▼
Does problem have optimal substructure? → No → Use DP/D&C
  │ Yes
  ▼
Does it have greedy choice property? → No → Try other methods
  │ Yes
  ▼
Can you prove it always gives optimal solution? → No → May need refinement
  │ Yes
  ▼
Implement Greedy Algorithm!''',
                    style: TextStyle(
                      color: Colors.white70,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text('Types of Greedy Algorithm'
                ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white),),
                SizedBox(height: 15,),
                const Func()
              ],
            ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required String title, required String content, required IconData icon, Color color = Colors.blue}) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color),
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
            SizedBox(height: 15),
            Text(
              content,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
             
          ],
        ),
      
    );
  }

  Widget _buildStep(String step, String description) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            child: Text(
              step.substring(step.length-1),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
 
}
