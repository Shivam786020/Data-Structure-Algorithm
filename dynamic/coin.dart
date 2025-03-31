import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Coin Change Problem', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is the Coin Change Problem?',
              content: 'A classic dynamic programming problem where we determine the minimum number of coins needed to make up a given amount, using coins of specified denominations. If the amount cannot be made up, we return -1.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Problem Variants
            _buildSection(
              title: 'Problem Variants',
              content: '''
1. **Minimum Coins**: Find the fewest coins needed (this implementation)
2. **Number of Ways**: Count all possible combinations
3. **Unlimited vs Limited Coins**: With/without coin quantity constraints
4. **Unique Combinations**: Distinct solutions only''',
              icon: Icons.category,
            ),
            
            SizedBox(height: 25),
            
            // Example Problem
            _buildSection(
              title: 'Example Problem',
              content: '''
**Coins**: [1, 2, 5]
**Amount**: 11

**Optimal Solution**: 
- 5 + 5 + 1 = 11 (3 coins)
- Other possibilities:
  - 5 + 2 + 2 + 2 = 11 (4 coins)
  - 2 + 2 + 2 + 2 + 2 + 1 = 11 (6 coins)
  - 1 × 11 = 11 (11 coins)''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // DP Solution Explanation
            _buildSection(
              title: 'DP Solution Approach',
              content: '''
1. Create a DP array where dp[i] = min coins for amount i
2. Initialize dp[0] = 0 (base case: 0 coins for amount 0)
3. For each amount from 1 to target:
   - For each coin ≤ current amount:
     - dp[i] = min(dp[i], 1 + dp[i - coin])
4. The solution is in dp[amount]''',
              icon: Icons.account_tree,
            ),
            
            // Code Implementation
            Text(
              'Minimum Coin Change Implementation',
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
                borderRadius: BorderRadius.circular(10),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'int coinChange(List<int> coins, int amount) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> dp = List.filled(amount + 1, amount + 1);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  dp[0] = 0; // Base case',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  for (int i = 1; i <= amount; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (int coin in coins) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      if (coin <= i) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        dp[i] = min(dp[i], dp[i - coin] + 1);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  return dp[amount] > amount ? -1 : dp[amount];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Number of Ways Variant
            _buildSection(
              title: 'Number of Ways Variant',
              content: 'To count all possible combinations (order doesn\'t matter):',
              icon: Icons.format_list_numbered,
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
                    'int countWays(List<int> coins, int amount) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<int> dp = List.filled(amount + 1, 0);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  dp[0] = 1; // One way to make amount 0',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  for (int coin in coins) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (int i = coin; i <= amount; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      dp[i] += dp[i - coin];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  }',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  return dp[amount];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
            
            // Complexity
            _buildSection(
              title: 'Time & Space Complexity',
              content: '''
• **Minimum Coins**:
  - Time: O(amount × n) where n = number of coins
  - Space: O(amount)
  
• **Number of Ways**:
  - Time: O(amount × n)
  - Space: O(amount)''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Real-World Applications',
              content: '''
• Vending machine change systems
• Cash register algorithms
• Financial transaction optimizations
• Resource allocation problems
• Cryptocurrency transaction fees''',
              icon: Icons.apps,
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