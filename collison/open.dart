import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Open extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Open Addressing', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
            _buildSection(
              title: 'Open Addressing Fundamentals',
              content: '''
Open Addressing is a collision resolution method where all elements are stored in the hash table itself. When a collision occurs, alternative slots are found through probing.

Key Characteristics:
• All data stored directly in the array
• No additional data structures (like linked lists)
• Uses probing sequence to find empty slots
• Load factor must be < 1 (table cannot be full)

Advantages:
• Better cache performance (data stored contiguously)
• No extra memory overhead for pointers
• Simpler implementation than separate chaining

Disadvantages:
• Performance degrades as load factor increases
• More sensitive to poor hash functions''',
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
Text('Open Addressing Example ',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('ope.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
            // Probing Methods
            _buildSection(
              title: 'Probing Methods',
              content: 'Different approaches to find empty slots:',
              icon: Icons.search,
            ),
            _buildSubSection('1. Linear Probing'),
            Text('h(k, i) = (h\'(k) + i) % m\n'
                '• Checks next slot sequentially\n'
                '• Simple but can cause clustering',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('2. Quadratic Probing'),
            Text('h(k, i) = (h\'(k) + c₁i + c₂i²) % m\n'
                '• Uses quadratic function to spread probes\n'
                '• Reduces primary clustering',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('3. Double Hashing'),
            Text('h(k, i) = (h₁(k) + i*h₂(k)) % m\n'
                '• Uses second hash function\n'
                '• Provides most uniform distribution',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            // Implementation
            _buildSection(
              title: 'Implementation (Linear Probing)',
              content: 'Complete hash table with open addressing:',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
class OpenAddressingHashTable {
    private static final int DELETED = -1;
    private Entry[] table;
    private int size;
    
    class Entry {
        int key;
        String value;
        
        public Entry(int key, String value) {
            this.key = key;
            this.value = value;
        }
    }
    
    public OpenAddressingHashTable(int size) {
        this.size = size;
        table = new Entry[size];
    }
    
    private int hash(int key) {
        return key % size;
    }
    
    // Linear probing function
    private int probe(int key, int attempt) {
        return (hash(key) + attempt) % size;
    }
    
    public void put(int key, String value) {
        int attempt = 0;
        int index;
        
        do {
            index = probe(key, attempt);
            if (table[index] == null || table[index].key == DELETED) {
                table[index] = new Entry(key, value);
                return;
            }
            attempt++;
        } while (attempt < size);
        
        throw new RuntimeException("Hash table is full");
    }
    
    public String get(int key) {
        int attempt = 0;
        int index;
        
        do {
            index = probe(key, attempt);
            if (table[index] == null) {
                return null;
            }
            if (table[index].key == key) {
                return table[index].value;
            }
            attempt++;
        } while (attempt < size && table[index] != null);
        
        return null;
    }
    
    public void remove(int key) {
        int attempt = 0;
        int index;
        
        do {
            index = probe(key, attempt);
            if (table[index] == null) {
                return;
            }
            if (table[index].key == key) {
                table[index].key = DELETED; // Mark as deleted
                return;
            }
            attempt++;
        } while (attempt < size);
    }
}'''),

            // Example Walkthrough
            _buildSection(
              title: 'Example Walkthrough',
              content: 'Inserting keys with linear probing (table size = 7):',
              icon: Icons.table_chart,
            ),
            _buildSubSection('Insert 10, 20, 30, 47:'),
            Text('h(10) = 10 % 7 = 3 → [_, _, _, 10, _, _, _]\n'
                'h(20) = 20 % 7 = 6 → [_, _, _, 10, _, _, 20]\n'
                'h(30) = 30 % 7 = 2 → [_, _, 30, 10, _, _, 20]\n'
                'h(47) = 47 % 7 = 5 → [_, _, 30, 10, _, 47, 20]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('Insert 15 (collision at h(15)=1):'),
            Text('h(15) = 15 % 7 = 1 → [_, 15, 30, 10, _, 47, 20]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            _buildSubSection('Insert 8 (collision at h(8)=1):'),
            Text('Probe sequence: 1 (occupied), 2 (occupied), 3 (occupied), 4 (empty)\n'
                'Final position: [_, 15, 30, 10, 8, 47, 20]',
                style: TextStyle(color: Colors.white70, fontSize: 16)),

            // Usage Example
            _buildSection(
              title: 'Usage Example',
              content: 'How to use the OpenAddressingHashTable:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        OpenAddressingHashTable table = new OpenAddressingHashTable(7);
        
        table.put(10, "A");
        table.put(20, "B");
        table.put(30, "C");
        table.put(47, "D");
        table.put(15, "E");
        table.put(8, "F");
        
        System.out.println(table.get(30)); // "C"
        System.out.println(table.get(8));  // "F"
        
        table.remove(20);
        System.out.println(table.get(20)); // null
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
                DataColumn(label: Text('Scenario', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Average', style: TextStyle(color: Colors.white))),
                DataColumn(label: Text('Worst', style: TextStyle(color: Colors.white))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Low load factor (<0.5)', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                ]),
                DataRow(cells: [
                  DataCell(Text('Medium load factor (0.5-0.7)', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(1)', style: TextStyle(color: Colors.green))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
                DataRow(cells: [
                  DataCell(Text('High load factor (>0.7)', style: TextStyle(color: Colors.white))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                  DataCell(Text('O(n)', style: TextStyle(color: Colors.orange))),
                ]),
              ],
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