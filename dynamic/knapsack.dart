import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Knapsack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Knapsack Problem', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is the Knapsack Problem?',
              content: 'A classic optimization problem where given a set of items (each with a weight and value), we must determine the most valuable combination of items that fits into a knapsack with a fixed weight capacity.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Problem Variants
            _buildSection(
              title: 'Types of Knapsack Problems',
              content: '''
1. **0/1 Knapsack**: Each item is either taken (1) or not taken (0)
2. **Fractional Knapsack**: Items can be divided (solved with greedy approach)
3. **Unbounded Knapsack**: Multiple copies of the same item are allowed
4. **Multiple Constraints**: Additional constraints like volume or count
5. **Subset Sum**: Special case where value = weight''',
              icon: Icons.category,
            ),
            
            SizedBox(height: 25),
            
            // Example Problem
            _buildSection(
              title: 'Example Problem',
              content: '''
**Capacity**: 7 kg

**Items**:
1. Item A: 1kg (\$6)
2. Item B: 2kg (\$10) 
3. Item C: 3kg (\$12)

**Optimal Solution**: 
- Take Item B + Item C (Total: 5kg, \$22)
- Cannot take all three (would be 6kg, \$28) because capacity is 7kg''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // DP Solution Explanation
            _buildSection(
              title: 'DP Solution Approach',
              content: '''
1. Create a 2D table (items vs capacities)
2. For each item, decide:
   - If weight ≤ current capacity: Max of (taking or not taking)
   - Else: Carry forward previous value
3. Backtrack to find selected items''',
              icon: Icons.account_tree,
            ),
            
            // Code Example
            Text(
              'DP Implementation (0/1 Knapsack)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
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
                    '// Returns maximum value',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    '''int knapsack(int W, List<int> wt, List<int> val, int n) {
  List<List<int>> dp = List.generate(n+1, (_) => List.filled(W+1, 0));
  
  for (int i = 1; i <= n; i++) {
    for (int w = 1; w <= W; w++) {
      if (wt[i-1] <= w) {
        dp[i][w] = max(val[i-1] + dp[i-1][w-wt[i-1]], dp[i-1][w]);
      } else {
        dp[i][w] = dp[i-1][w];
      }
    }
  }
  return dp[n][W];
}''',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Time Complexity
            _buildSection(
              title: 'Time & Space Complexity',
              content: '''
• **Time**: O(n*W) where n = items, W = capacity
• **Space**: O(n*W) for DP table
• **Optimized Space**: Can be reduced to O(W) using 1D array''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
           
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