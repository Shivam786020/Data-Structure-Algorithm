import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';
import 'package:dsa_app/collison/ha1.dart';

class Hashtable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Hash Table', style: TextStyle(color: Colors.white)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theory Section
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
Text(' HashTable Example',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                 Image.asset('has.png',height: 270,width:350,)
                ]
              ),
            ),
            ),
SizedBox(height: 10,),
            _buildSection(
              title: 'Hash Table Fundamentals',
              content: '''
A hash table is a data structure that implements an associative array, mapping keys to values. It uses a hash function to compute an index into an array of slots.

Key Components:
• Hash Function: Computes index from key
• Array: Stores the data
• Collision Resolution: Handles hash collisions

Time Complexities:
• Insert: O(1) average, O(n) worst
• Search: O(1) average, O(n) worst
• Delete: O(1) average, O(n) worst''',
              icon: Icons.storage,
            ),

            // Hash Function Example
            _buildSection(
              title: 'Hash Function Example',
              content: 'Simple hash function implementation:',
              icon: Icons.functions,
            ),
            _buildCodeBlock('''
int hashFunction(String key, int tableSize) {
    int hash = 0;
    for (int i = 0; i < key.length; i++) {
        hash = (hash + key.codeUnitAt(i)) % tableSize;
    }
    return hash;
}'''),


 _buildSection(
              title: 'Types of Hash Tables',
              content: 'Different collision resolution methods:',
              icon: Icons.compare_arrows,
            ),
            SizedBox(height: 15),
            Ha1(), // Your existing types visualization widget

            // Separate Chaining Implementation
            _buildSection(
              title: 'Separate Chaining Implementation',
              content: 'Using linked lists to handle collisions:',
              icon: Icons.link,
            ),
            _buildCodeBlock('''
class HashTable {
    private LinkedList<Entry>[] table;
    private int size;
    
    class Entry {
        String key;
        int value;
        
        public Entry(String key, int value) {
            this.key = key;
            this.value = value;
        }
    }
    
    public HashTable(int size) {
        this.size = size;
        table = new LinkedList[size];
    }
    
    public void put(String key, int value) {
        int index = hashFunction(key, size);
        if (table[index] == null) {
            table[index] = new LinkedList<>();
        }
        
        for (Entry entry : table[index]) {
            if (entry.key.equals(key)) {
                entry.value = value; // Update existing
                return;
            }
        }
        
        table[index].add(new Entry(key, value));
    }
    
    public Integer get(String key) {
        int index = hashFunction(key, size);
        if (table[index] != null) {
            for (Entry entry : table[index]) {
                if (entry.key.equals(key)) {
                    return entry.value;
                }
            }
        }
        return null;
    }
}'''),

            // Open Addressing Implementation
            _buildSection(
              title: 'Open Addressing Implementation',
              content: 'Linear probing collision resolution:',
              icon: Icons.search,
            ),
            _buildCodeBlock('''
class OpenAddressingHashTable {
    private Entry[] table;
    private int size;
    
    class Entry {
        String key;
        int value;
        boolean isDeleted;
        
        public Entry(String key, int value) {
            this.key = key;
            this.value = value;
            this.isDeleted = false;
        }
    }
    
    public OpenAddressingHashTable(int size) {
        this.size = size;
        table = new Entry[size];
    }
    
    public void put(String key, int value) {
        int index = hashFunction(key, size);
        int i = 0;
        
        while (i < size) {
            int current = (index + i) % size;
            if (table[current] == null || table[current].isDeleted || 
                table[current].key.equals(key)) {
                table[current] = new Entry(key, value);
                return;
            }
            i++;
        }
        throw new RuntimeException("Hash table is full");
    }
    
    public Integer get(String key) {
        int index = hashFunction(key, size);
        int i = 0;
        
        while (i < size) {
            int current = (index + i) % size;
            if (table[current] == null) {
                return null;
            }
            if (!table[current].isDeleted && table[current].key.equals(key)) {
                return table[current].value;
            }
            i++;
        }
        return null;
    }
}'''),

            // Types of Hash Tables
           
            // Usage Examples
            _buildSection(
              title: 'Usage Examples',
              content: 'How to use the HashTable classes:',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
public class Main {
    public static void main(String[] args) {
        // Separate Chaining Example
        HashTable chainingTable = new HashTable(10);
        chainingTable.put("apple", 5);
        chainingTable.put("banana", 7);
        System.out.println(chainingTable.get("apple")); // 5
        
        // Open Addressing Example
        OpenAddressingHashTable openTable = new OpenAddressingHashTable(10);
        openTable.put("orange", 3);
        openTable.put("grape", 4);
        System.out.println(openTable.get("orange")); // 3
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