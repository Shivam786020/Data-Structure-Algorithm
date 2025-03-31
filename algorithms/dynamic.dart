import 'package:dsa_app/Appdrawer.dart';
import 'package:dsa_app/dynamic/funct.dart';
import 'package:flutter/material.dart';

class Dynamic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Dynamic Programming', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Dynamic Programming?',
              content: 'Dynamic Programming (DP) is an optimization technique that breaks complex problems into simpler subproblems, stores their solutions (memoization), and reuses these solutions to avoid redundant computations. It works best on problems with optimal substructure and overlapping subproblems.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Characteristics
            _buildSection(
              title: 'Key Characteristics',
              content: '''
1. Optimal Substructure: Solution to main problem contains optimal solutions to subproblems
2. Overlapping Subproblems: Same subproblems are solved multiple times
3. Memoization: Storing computed results for reuse
4. Tabulation: Building solutions iteratively (bottom-up)
5. State Transition: Defining how to move between subproblems''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Types of DP
            _buildSection(
              title: 'Types of Dynamic Programming',
              content: '''
1. **Top-Down (Memoization)**
   - Recursive approach with caching
   - Example: Fibonacci with memoization

2. **Bottom-Up (Tabulation)**
   - Iterative approach building solutions from base cases
   - Example: Fibonacci with array

3. **1D DP**
   - Single dimensional state (e.g., Fibonacci, Climbing stairs)

4. **2D DP**
   - Two dimensional state (e.g., Edit distance, LCS)

5. **DP with Bitmasking**
   - State represented as bits (e.g., TSP, Subset problems)

6. **DP on Trees**
   - Specialized for tree structures (e.g., Tree diameter)

7. **DP on Graphs**
   - For graph traversal problems (e.g., Shortest paths)''',
              icon: Icons.category,
            ),
            
            SizedBox(height: 25),
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
                 Image.asset('dp.jpg',height: 270,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Example: Fibonacci
            Text(
              'Example: Fibonacci Sequence',
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
                    '// Top-Down (Memoization)',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    '''int fibMemo(int n, Map<int,int> memo) {
  if (n <= 1) return n;
  if (memo.containsKey(n)) return memo[n]!;
  
  memo[n] = fibMemo(n-1, memo) + fibMemo(n-2, memo);
  return memo[n]!;
}''',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 15),
                  Text(
                    '// Bottom-Up (Tabulation)',
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    '''int fibTab(int n) {
  List<int> dp = List.filled(n+1, 0);
  dp[1] = 1;
  
  for (int i = 2; i <= n; i++) {
    dp[i] = dp[i-1] + dp[i-2];
  }
  return dp[n];
}''',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Common Problems
            _buildSection(
              title: 'Classic DP Problems',
              content: '''
• 0/1 Knapsack: Maximize value without exceeding weight limit
• Longest Common Subsequence (LCS): Find longest shared sequence
• Coin Change: Minimum coins for given amount
• Edit Distance: Transform one string to another with min operations
• Matrix Chain Multiplication: Optimal multiplication order
• Longest Increasing Subsequence (LIS): Find longest increasing sequence''',
              icon: Icons.list,
            ),
            
            SizedBox(height: 25),
            
            // When to Use DP
            _buildSection(
              title: 'When to Use Dynamic Programming?',
              content: '''
1. The problem can be broken into overlapping subproblems
2. The optimal solution can be constructed from optimal solutions to subproblems
3. The problem requires optimization (min/max) or counting
4. Brute force solution would have exponential time complexity
5. You need to explore all possible combinations/configurations''',
              icon: Icons.help,
            ),
            
            SizedBox(height: 25),
            
            // DP vs Other Approaches
            _buildSection(
              title: 'DP vs Other Techniques',
              content: '''
• **Greedy Algorithms**: DP considers all possibilities while greedy makes locally optimal choices
• **Divide and Conquer**: DP stores solutions to overlapping subproblems
• **Backtracking**: DP avoids recomputation through memoization
• **Memoization vs Tabulation**: Both store results but differ in approach (top-down vs bottom-up)''',
              icon: Icons.compare,
              
            ),
            SizedBox(height: 20,),
            Text('Some Important Techniques of DP',style: TextStyle(
              fontSize: 22,fontWeight: FontWeight.w400,color: Colors.white)
            ),
            SizedBox(height: 20,),
            const Funct()
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