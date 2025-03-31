import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Separ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Separate Chaining', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Separate Chaining Fundamentals',
              content: '''
Separate Chaining is a collision resolution technique where each bucket (array slot) contains a linked list of entries that hash to the same index.

Key Characteristics:
• Uses linked lists to handle collisions
• Multiple items can hash to same index
• Load factor can be > 1 (more items than slots)
• Simple to implement

Advantages:
• Handles arbitrary number of collisions
• Performance degrades gracefully
• Easy to implement deletion

Disadvantages:
• Extra memory for linked list pointers
• Poor cache performance (nodes not contiguous)
• Memory overhead for linked list nodes''',
              icon: Icons.link,
            ),
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
Text('Separate Chaining Example ',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('ope.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Visual Representation
            _buildSection(
              title: 'Visual Representation',
              content: 'How separate chaining works:',
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
                  Text('Index 0: null', style: TextStyle(color: Colors.white)),
                  Text('Index 1: [Key1→Val1] → [Key5→Val5]', style: TextStyle(color: Colors.white)),
                  Text('Index 2: [Key2→Val2]', style: TextStyle(color: Colors.white)),
                  Text('Index 3: null', style: TextStyle(color: Colors.white)),
                  Text('Index 4: [Key4→Val4] → [Key8→Val8] → [Key12→Val12]', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),

            // Implementation
            _buildSection(
              title: 'Implementation',
              content: 'Complete hash table with separate chaining:',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
import java.util.LinkedList;

class SeparateChainingHashTable<K, V> {
    private static class Entry<K, V> {
        K key;
        V value;
        
        public Entry(K key, V value) {
            this.key = key;
            this.value = value;
        }
    }
    
    private LinkedList<Entry<K, V>>[] table;
    private int size;
    
    @SuppressWarnings("unchecked")
    public SeparateChainingHashTable(int capacity) {
        table = new LinkedList[capacity];
        size = 0;
    }
    
    private int hash(K key) {
        return Math.abs(key.hashCode()) % table.length;
    }
    
    public void put(K key, V value) {
        int index = hash(key);
        
        if (table[index] == null) {
            table[index] = new LinkedList<>();
        }
        
        // Check for existing key
        for (Entry<K, V> entry : table[index]) {
            if (entry.key.equals(key)) {
                entry.value = value; // Update existing
                return;
            }
        }
        
        // Add new entry
        table[index].add(new Entry<>(key, value));
        size++;
    }
    
    public V get(K key) {
        int index = hash(key);
        
        if (table[index] != null) {
            for (Entry<K, V> entry : table[index]) {
                if (entry.key.equals(key)) {
                    return entry.value;
                }
            }
        }
        return null;
    }
    
    public void remove(K key) {
        int index = hash(key);
        
        if (table[index] != null) {
            Iterator<Entry<K, V>> iterator = table[index].iterator();
            while (iterator.hasNext()) {
                Entry<K, V> entry = iterator.next();
                if (entry.key.equals(key)) {
                    iterator.remove();
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
              content: 'Operations on a hash table (size=5):',
              icon: Icons.table_chart,
            ),
            _buildSubSection('Insertions:'),
            Text('put("apple", 10): h("apple") = 1 → [null, [apple→10], null, null, null]\n'
                'put("banana", 20): h("banana") = 3 → [null, [apple→10], null, [banana→20], null]\n'
                'put("orange", 30): h("orange") = 1 → [null, [apple→10]→[orange→30], null, [banana→20], null]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('Collision Handling:'),
            Text('put("pear", 40): h("pear") = 3 → [null, [apple→10]→[orange→30], null, [banana→20]→[pear→40], null]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('Retrieval:'),
            Text('get("orange"): h("orange") = 1 → search chain at index 1 → returns 30',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the SeparateChainingHashTable:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        SeparateChainingHashTable<String, Integer> table = 
            new SeparateChainingHashTable<>(5);
        
        table.put("apple", 10);
        table.put("banana", 20);
        table.put("orange", 30);
        table.put("pear", 40);
        
        System.out.println(table.get("orange")); // 30
        System.out.println(table.get("banana")); // 20
        
        table.remove("banana");
        System.out.println(table.get("banana")); // null
        System.out.println(table.size()); // 3
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

            // Comparison with Open Addressing
            _buildSection(
              title: 'Comparison with Open Addressing',
              content: 'When to use separate chaining:',
              icon: Icons.compare,
            ),
            _buildBulletPoint('When the number of keys is unknown or can be large'),
            _buildBulletPoint('When frequent deletions are required'),
            _buildBulletPoint('When memory is not a primary concern'),
            _buildBulletPoint('When using poor hash functions that cause many collisions'),
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