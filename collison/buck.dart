import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Buck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Bucket Hashing', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Bucket Hashing Fundamentals',
              content: '''
Bucket Hashing is a collision resolution technique that uses fixed-size buckets (arrays) at each hash index instead of linked lists.

Key Characteristics:
• Each hash index contains a fixed-size bucket (small array)
• When bucket fills, new entries are rejected or overflow handled
• More cache-friendly than linked lists
• Simpler memory management than linked lists

Advantages:
• Better cache performance than separate chaining
• No dynamic memory allocation per element
• Predictable memory usage

Disadvantages:
• Wasted space if buckets are too large
• Overflow handling needed when buckets fill
• Less flexible than separate chaining''',
              icon: Icons.storage,
            ),
SizedBox(height: 15,),
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
Text('Bucket Hashing Example ',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('buck.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Visual Representation
            _buildSection(
              title: 'Visual Representation',
              content: 'How bucket hashing works (bucket size=3):',
              icon: Icons.visibility,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text('Index 0: [null, null, null]', style: TextStyle(color: Colors.white)),
                  Text('Index 1: [Key1→Val1, Key5→Val5, Key9→Val9]', style: TextStyle(color: Colors.white)),
                  Text('Index 2: [Key2→Val2, null, null]', style: TextStyle(color: Colors.white)),
                  Text('Index 3: [null, null, null]', style: TextStyle(color: Colors.white)),
                  Text('Index 4: [Key4→Val4, Key8→Val8, Key12→Val12]', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // Implementation
            _buildSection(
              title: 'Implementation',
              content: 'Complete hash table with bucket hashing (bucket size=3):',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
class BucketHashTable<K, V> {
    private static final int BUCKET_SIZE = 3;
    private static class Entry<K, V> {
        K key;
        V value;
        
        public Entry(K key, V value) {
            this.key = key;
            this.value = value;
        }
    }
    
    private Entry<K, V>[][] table;
    private int size;
    private int capacity;
    
    @SuppressWarnings("unchecked")
    public BucketHashTable(int capacity) {
        this.capacity = capacity;
        table = new Entry[capacity][BUCKET_SIZE];
        size = 0;
    }
    
    private int hash(K key) {
        return Math.abs(key.hashCode()) % capacity;
    }
    
    public void put(K key, V value) {
        if (size >= capacity * BUCKET_SIZE) {
            throw new RuntimeException("Hash table is full");
        }
        
        int index = hash(key);
        
        // Check for existing key
        for (int i = 0; i < BUCKET_SIZE; i++) {
            if (table[index][i] != null && table[index][i].key.equals(key)) {
                table[index][i].value = value; // Update existing
                return;
            }
        }
        
        // Find empty slot in bucket
        for (int i = 0; i < BUCKET_SIZE; i++) {
            if (table[index][i] == null) {
                table[index][i] = new Entry<>(key, value);
                size++;
                return;
            }
        }
        
        // Bucket is full - handle overflow
        handleOverflow(index, key, value);
    }
    
    private void handleOverflow(int index, K key, V value) {
        // Simple overflow handling - find next available bucket
        for (int i = 1; i < capacity; i++) {
            int newIndex = (index + i) % capacity;
            for (int j = 0; j < BUCKET_SIZE; j++) {
                if (table[newIndex][j] == null) {
                    table[newIndex][j] = new Entry<>(key, value);
                    size++;
                    return;
                }
            }
        }
        throw new RuntimeException("No available buckets");
    }
    
    public V get(K key) {
        int index = hash(key);
        
        // Check primary bucket
        for (int i = 0; i < BUCKET_SIZE; i++) {
            if (table[index][i] != null && table[index][i].key.equals(key)) {
                return table[index][i].value;
            }
        }
        
        // Check overflow buckets if not found
        for (int i = 1; i < capacity; i++) {
            int newIndex = (index + i) % capacity;
            for (int j = 0; j < BUCKET_SIZE; j++) {
                if (table[newIndex][j] != null && table[newIndex][j].key.equals(key)) {
                    return table[newIndex][j].value;
                }
            }
        }
        
        return null;
    }
    
    public void remove(K key) {
        int index = hash(key);
        
        for (int i = 0; i < BUCKET_SIZE; i++) {
            if (table[index][i] != null && table[index][i].key.equals(key)) {
                table[index][i] = null;
                size--;
                return;
            }
        }
        
        // Check overflow buckets if not found
        for (int i = 1; i < capacity; i++) {
            int newIndex = (index + i) % capacity;
            for (int j = 0; j < BUCKET_SIZE; j++) {
                if (table[newIndex][j] != null && table[newIndex][j].key.equals(key)) {
                    table[newIndex][j] = null;
                    size--;
                    return;
                }
            }
        }
    }
    
    public int size() {
        return size;
    }
}'''),

            // Example Walkthrough
            _buildSection(
              title: 'Example Walkthrough',
              content: 'Operations on a bucket hash table (capacity=3, bucket size=2):',
              icon: Icons.table_chart,
            ),
            _buildSubSection('Insertions:'),
            Text('put("A", 1): h("A")=0 → Bucket0: [A→1, null]\n'
                'put("B", 2): h("B")=1 → Bucket1: [B→2, null]\n'
                'put("C", 3): h("C")=2 → Bucket2: [C→3, null]\n'
                'put("D", 4): h("D")=0 → Bucket0: [A→1, D→4]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('Collision Handling:'),
            Text('put("E", 5): h("E")=0 → Bucket0 full, find next available slot\n'
                '→ Bucket1: [B→2, E→5]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('Retrieval:'),
            Text('get("E"): h("E")=0 → check Bucket0: not found\n'
                '→ check Bucket1: found at position 1 → returns 5',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the BucketHashTable:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        BucketHashTable<String, Integer> table = new BucketHashTable<>(5);
        
        table.put("apple", 10);
        table.put("banana", 20);
        table.put("orange", 30);
        table.put("pear", 40); // Might go to same bucket as apple
        
        System.out.println(table.get("orange")); // 30
        System.out.println(table.get("pear"));   // 40
        
        table.remove("banana");
        System.out.println(table.get("banana")); // null
        System.out.println(table.size());        // 3
    }
}'''),

            // Complexity Analysis
            _buildSection(
              title: 'Complexity Analysis',
              content: 'Performance characteristics:',
              icon: Icons.timer,
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('Operation', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Average', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Worst', style: TextStyle(color: Colors.white))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Insert', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Search', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Delete', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
              ],
            ),

            // Comparison with Other Methods
            _buildSection(
              title: 'Comparison with Other Methods',
              content: 'When to use bucket hashing:',
              icon: Icons.compare,
            ),
            _buildBulletPoint('When you want better cache performance than separate chaining'),
            _buildBulletPoint('When memory allocation per element is undesirable'),
            _buildBulletPoint('When the maximum number of collisions per bucket is predictable'),
            _buildBulletPoint('When you can tolerate some wasted space in partially filled buckets'),
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

  Widget _buildSubSection(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8, color: Colors.white70),
          SizedBox(width: 8),
          Expanded(child: Text(text, style: TextStyle(color: Colors.white70))),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SelectableText(
        code,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }
}