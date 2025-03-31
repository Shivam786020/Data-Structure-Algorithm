import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Longest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Longest Common Subsequence', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is LCS?',
              content: 'The Longest Common Subsequence (LCS) problem finds the longest sequence of characters that appears left-to-right (but not necessarily in contiguous blocks) in two given strings. It\'s a classic dynamic programming problem with applications in bioinformatics, text comparison, and version control.',
              icon: Icons.help_outline,
            ),
            
            SizedBox(height: 25),
            
            // Key Characteristics
            _buildSection(
              title: 'Key Characteristics',
              content: '''
1. Subsequence (not substring) - elements don't need to be contiguous
2. Preserves order of elements in both sequences
3. Multiple LCS solutions may exist
4. Has optimal substructure property
5. Overlapping subproblems make it ideal for DP''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Example Problem
            _buildSection(
              title: 'Example Problem',
              content: '''
**String 1**: "ABCDGH"
**String 2**: "AEDFHR"

**Visualization**:
A B C D G H
A E D F H R

**LCS**: "ADH" (length 3)
- A (match at position 0)
- D (match at position 3)
- H (match at position 5)''',
              icon: Icons.visibility,
            ),
            
            SizedBox(height: 25),
            
            // DP Solution Explanation
            _buildSection(
              title: 'DP Solution Approach',
              content: '''
1. Create a 2D table with dimensions (m+1)×(n+1)
2. Initialize first row and column with 0s
3. Fill the table:
   - If characters match: dp[i][j] = 1 + dp[i-1][j-1]
   - Else: dp[i][j] = max(dp[i-1][j], dp[i][j-1])
4. Length is in dp[m][n]
5. Reconstruct the sequence by backtracking''',
              icon: Icons.account_tree,
            ),
            
            // Code Implementation
            Text(
              'LCS Implementation',
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
                    'int lcsLength(String text1, String text2) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int m = text1.length, n = text2.length;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  List<List<int>> dp = List.generate(m+1, (_) => List.filled(n+1, 0));',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '  for (int i = 1; i <= m; i++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    for (int j = 1; j <= n; j++) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      if (text1[i-1] == text2[j-1]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        dp[i][j] = 1 + dp[i-1][j-1];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      } else {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '        dp[i][j] = max(dp[i-1][j], dp[i][j-1]);',
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
                  Text(
                    '  return dp[m][n];',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '}',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '// To reconstruct the actual LCS string:',
                    style: TextStyle(color: Colors.green, fontFamily: 'monospace'),
                  ),
                  Text(
                    'String reconstructLCS(String text1, String text2, List<List<int>> dp) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  int i = text1.length, j = text2.length;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  StringBuffer result = StringBuffer();',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '  while (i > 0 && j > 0) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    if (text1[i-1] == text2[j-1]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      result.write(text1[i-1]);',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      i--; j--;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    } else if (dp[i-1][j] > dp[i][j-1]) {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      i--;',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '    } else {',
                    style: TextStyle(color: Colors.white, fontFamily: 'monospace'),
                  ),
                  Text(
                    '      j--;',
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
                    '  return result.toString().split('').reversed.join();',
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
• **Time Complexity**: O(m×n) 
  - For filling the DP table (m and n are string lengths)
• **Space Complexity**: O(m×n) for DP table
• **Space Optimized**: Can be reduced to O(min(m,n)) using two 1D arrays''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Applications',
              content: '''
• DNA sequence alignment (bioinformatics)
• Git diff and version control systems
• Plagiarism detection
• File comparison tools
• Speech recognition
• Machine translation evaluation''',
              icon: Icons.apps,
            ),
            
            SizedBox(height: 25),
            
            // Variations
            _buildSection(
              title: 'Related Problems',
              content: '''
• Longest Common Substring (contiguous blocks)
• Shortest Common Supersequence
• Edit Distance (Levenshtein distance)
• Longest Palindromic Subsequence
• Longest Increasing Subsequence''',
              icon: Icons.compare_arrows,
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