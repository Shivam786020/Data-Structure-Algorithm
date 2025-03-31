import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Huff extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),

        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Huffman Coding', style: TextStyle(color: Colors.white)),
      ),
            endDrawer: AppDrawer(),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Definition Section
            _buildSection(
              title: 'What is Huffman Coding?',
              content: 'Huffman coding is a lossless data compression algorithm that uses variable-length codes to represent characters. It assigns shorter codes to more frequent characters and longer codes to less frequent ones, resulting in optimal prefix codes that minimize the total encoded length.',
              icon: Icons.compress,
            ),
            
            SizedBox(height: 25),
            
            // Key Concepts
            _buildSection(
              title: 'Key Concepts',
              content: '''
• Prefix Codes: No code is prefix of another (enables unambiguous decoding)
• Greedy Approach: Merges least frequent nodes first
• Optimal Compression: Provides minimum expected code length
• Binary Tree Structure: Built from bottom-up
• Time Complexity: O(n log n) where n is number of unique characters''',
              icon: Icons.lightbulb_outline,
            ),
            
            SizedBox(height: 25),
            
            // Algorithm Steps
            _buildSection(
              title: 'Algorithm Steps',
              content: '''
1. Calculate frequency of each character
2. Create leaf node for each character with frequency
3. Build priority queue (min-heap) of nodes
4. While queue has more than one node:
   a. Extract two nodes with minimum frequency
   b. Create new internal node with sum of frequencies
   c. Add new node back to queue
5. Remaining node becomes root of Huffman Tree
6. Traverse tree to assign codes (left=0, right=1)''',
              icon: Icons.account_tree,
            ),
            
            SizedBox(height: 25),
            
            // Example Visualization
            _buildSection(
              title: 'Example Walkthrough',
              content: '''
Input: "ABRACADABRA"

Character Frequencies:
A:5, B:2, R:2, C:1, D:1

Building Huffman Tree:
1. Combine C(1) + D(1) = CD(2)
2. Combine B(2) + R(2) = BR(4)
3. Combine CD(2) + BR(4) = CDBR(6)
4. Combine A(5) + CDBR(6) = ACDBR(11)

Final Codes:
A: 0
B: 100
R: 101
C: 1100
D: 1101

Original: 11 chars × 8 bits = 88 bits
Compressed: 5×1 + 2×3 + 2×3 + 1×4 + 1×4 = 23 bits''',
              icon: Icons.visibility,
            ),
            
            SizedBox(height: 25),
            
            // Java Implementation
            Text(
              'Java Implementation',
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
                    '// Huffman Node class',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '''class HuffmanNode implements Comparable<HuffmanNode> {
    char character;
    int frequency;
    HuffmanNode left, right;
    
    public HuffmanNode(char ch, int freq) {
        this.character = ch;
        this.frequency = freq;
    }
    
    public HuffmanNode(int freq, HuffmanNode l, HuffmanNode r) {
        this.frequency = freq;
        this.left = l;
        this.right = r;
    }
    
    @Override
    public int compareTo(HuffmanNode other) {
        return this.frequency - other.frequency;
    }
}

// Main Huffman Coding class
public class HuffmanCoding {
    public static void buildHuffmanTree(String text) {
        // 1. Calculate character frequencies
        Map<Character, Integer> freqMap = new HashMap<>();
        for (char c : text.toCharArray()) {
            freqMap.put(c, freqMap.getOrDefault(c, 0) + 1);
        }
        
        // 2. Build priority queue
        PriorityQueue<HuffmanNode> pq = new PriorityQueue<>();
        for (Map.Entry<Character, Integer> entry : freqMap.entrySet()) {
            pq.add(new HuffmanNode(entry.getKey(), entry.getValue()));
        }
        
        // 3. Build Huffman Tree
        while (pq.size() > 1) {
            HuffmanNode left = pq.poll();
            HuffmanNode right = pq.poll();
            pq.add(new HuffmanNode(left.frequency + right.frequency, left, right));
        }
        
        HuffmanNode root = pq.poll();
        
        // 4. Generate codes
        Map<Character, String> huffmanCodes = new HashMap<>();
        generateCodes(root, "", huffmanCodes);
        
        // Print results
        System.out.println("Huffman Codes:");
        huffmanCodes.forEach((k,v) -> System.out.println(k + ": " + v));
    }
    
    private static void generateCodes(HuffmanNode node, String code, 
                                    Map<Character, String> huffmanCodes) {
        if (node == null) return;
        
        if (node.left == null && node.right == null) {
            huffmanCodes.put(node.character, code);
            return;
        }
        
        generateCodes(node.left, code + "0", huffmanCodes);
        generateCodes(node.right, code + "1", huffmanCodes);
    }
}''',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 25),
              Center(child: 
  Container(
              height: 350,
              decoration: BoxDecoration(
                
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
Text('Animated Example of Huffman Algorithm',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('huff.gif',height: 270,width:350,)
                ]
              ),
            ),
            ),
            SizedBox(height: 20,),
            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: '''
• Time Complexity: O(n log n)
  - Building frequency map: O(n)
  - Building priority queue: O(n)
  - Extracting min nodes: O(log n) per operation (n times)
• Space Complexity: O(n)
  - Storage for frequency map
  - Huffman tree storage
  - Code table storage''',
              icon: Icons.timer,
            ),
            
            SizedBox(height: 25),
            
            // Applications
            _buildSection(
              title: 'Real-World Applications',
              content: '''
• File compression (ZIP, GZIP)
• Image compression (JPEG, PNG)
• Multimedia codecs (MP3, MPEG)
• Network data transmission
• Database systems''',
              icon: Icons.public,
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