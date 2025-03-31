import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Unit4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Unit 4:Java Collection Framework', style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Collection in Java',
              content: '''
Collections in Java are containers that group multiple items into a single unit. They represent a group of objects known as elements and provide various operations to manipulate these elements.

Key Characteristics:
• Store and retrieve elements efficiently
• Provide standardized interfaces for common operations
• Support different data structures and algorithms
• Implement reusable collection functionality
• Part of java.util package

Primary Benefits:
• Reduces programming effort
• Increases program speed and quality
• Allows interoperability between APIs
• Encourages software reuse''',
              icon: Icons.storage,
            ),

            _buildSection(
              title: 'Collection Framework in Java',
              content: '''
The Java Collections Framework is a unified architecture for representing and manipulating collections. It provides:

1. Interfaces: Abstract data types representing collections
2. Implementations: Concrete implementations of collection interfaces
3. Algorithms: Methods for performing operations on collections

Framework Advantages:
• Consistent API - Common interface hierarchy
• Reduces effort - No need to write collection code
• Increases quality - Well-tested implementations
• Performance - High-performance implementations
• Interoperability - Common language for collections''',
              icon: Icons.architecture,
            ),

            _buildSection(
              title: 'Hierarchy of Collection Framework',
              content: '''
The Java Collection Framework hierarchy is organized as follows:

1. Iterable Interface (Top-level interface)
   • Collection Interface (Extends Iterable)
     - List Interface (Ordered collections)
     - Set Interface (Unique elements)
     - Queue Interface (FIFO processing)
   • Map Interface (Separate hierarchy, key-value pairs)

Key Implementations:
• List: ArrayList, LinkedList, Vector, Stack
• Set: HashSet, LinkedHashSet, TreeSet
• Queue: PriorityQueue, ArrayDeque
• Map: HashMap, TreeMap, LinkedHashMap''',
              icon: Icons.account_tree,
            ),

            _buildSection(
              title: 'Iterator Interface',
              content: '''
The Iterator interface provides a way to traverse through a collection and access its elements. It acts as a universal cursor for collection classes.

Main Methods:
• hasNext(): Returns true if more elements exist
• next(): Returns the next element
• remove(): Removes the last element returned (optional operation)

Features:
• Fail-fast behavior (throws ConcurrentModificationException if collection modified during iteration)
• Uniform way to access different collection types
• Supports removal of elements during iteration
• Single-direction traversal (forward only)

Enhanced For-Each Loop:
• Internally uses Iterator
• More concise syntax for iteration''',
              icon: Icons.navigation,
            ),

            _buildSection(
              title: 'Collection Interface',
              content: '''
The Collection interface is the root interface in the collection hierarchy. It declares the core methods that all collections will have.

Core Operations:
• Size Operations: size(), isEmpty()
• Modification Operations: add(), remove(), clear()
• Query Operations: contains(), containsAll()
• Conversion Operations: toArray()
• Bulk Operations: addAll(), removeAll(), retainAll()

Characteristics:
• Foundation for all collection types except Map
• Can be made unmodifiable using Collections.unmodifiableCollection()
• Can be made thread-safe using synchronizedCollection()''',
              icon: Icons.interests,
            ),

            _buildSection(
              title: 'List Interface',
              content: '''
The List interface extends Collection and represents an ordered collection (sequence). Lists may contain duplicate elements.

Key Features:
• Positional access - Elements can be accessed by index
• Search - Can search for elements and return their index
• Range-view - Can operate on sublists
• Ordered - Maintains insertion order

Common Implementations:
1. ArrayList: Resizable array implementation
   • Fast random access
   • Slow insertion/deletion in middle
2. LinkedList: Doubly-linked list implementation
   • Fast insertion/deletion
   • Slow random access
3. Vector: Synchronized resizable array
   • Thread-safe version of ArrayList
4. Stack: LIFO structure extending Vector''',
              icon: Icons.list,
            ),

            _buildSection(
              title: 'ArrayList',
              content: '''
ArrayList is a resizable-array implementation of the List interface. It provides all optional list operations and permits all elements including null.

Characteristics:
• Dynamic resizing - Grows automatically
• Random access - Fast O(1) access by index
• Ordered - Maintains insertion order
• Not synchronized - Not thread-safe by default
• Allows duplicate elements

Performance:
• get(int index): O(1)
• add(E element): O(1) amortized
• add(int index, E element): O(n)
• remove(int index): O(n)

Best Use Cases:
• When frequent access by index is needed
• When iteration is the primary operation
• When the list size changes infrequently''',
              icon: Icons.view_array,
            ),

            _buildSection(
              title: 'LinkedList',
              content: '''
LinkedList is a doubly-linked list implementation of the List and Deque interfaces. It provides all optional list operations and permits all elements including null.

Characteristics:
• Node-based structure - Each element has reference to next/prev
• Implements both List and Deque interfaces
• Not synchronized - Not thread-safe by default
• Allows duplicate elements
• More memory overhead than ArrayList

Performance:
• get(int index): O(n)
• add(E element): O(1)
• add(int index, E element): O(n)
• remove(int index): O(n)

Best Use Cases:
• When frequent insertions/deletions are needed
• When implementing stacks/queues
• When memory usage is not a primary concern''',
              icon: Icons.link,
            ),

            _buildSection(
              title: 'Vector & Stack',
              content: '''
Vector:
• Legacy synchronized collection (from Java 1.0)
• Similar to ArrayList but with synchronization
• Thread-safe but slower than ArrayList
• Grows by doubling its size (default) or by capacity increment

Stack (extends Vector):
• Last-In-First-Out (LIFO) data structure
• Classic stack operations: push(), pop(), peek()
• Inherits all Vector methods
• Not recommended for new code (use Deque instead)

Modern Alternatives:
• For thread-safe lists: Collections.synchronizedList()
• For stacks: ArrayDeque (more performant)''',
              icon: Icons.layers,
            ),

            _buildSection(
              title: 'Queue Interface',
              content: '''
The Queue interface extends Collection and represents a collection designed for holding elements prior to processing. Typically follows FIFO (First-In-First-Out) ordering.

Core Operations:
• Insertion: add(), offer()
• Removal: remove(), poll()
• Examination: element(), peek()

Implementations:
1. PriorityQueue: Unbounded priority queue
   • Orders elements according to natural ordering or Comparator
   • No null elements allowed
2. ArrayDeque: Resizable-array double-ended queue
   • More efficient than Stack for stack operations
   • More efficient than LinkedList for queue operations

Specialized Queues (in java.util.concurrent):
• BlockingQueue, TransferQueue, etc.''',
              icon: Icons.queue,
            ),

            _buildSection(
              title: 'Set Interface',
              content: '''
The Set interface extends Collection and represents a collection that contains no duplicate elements. It models the mathematical set abstraction.

Key Characteristics:
• No duplicate elements (elements must be unique)
• At most one null element allowed
• No positional access (no get(index) method)
• Equality based on contents, not order

Main Implementations:
1. HashSet: Hash table implementation
   • Best general-purpose implementation
   • No ordering guarantees
2. LinkedHashSet: Hash table + linked list
   • Maintains insertion-order iteration
   • Slightly slower than HashSet
3. TreeSet: Red-black tree implementation
   • Elements sorted by natural ordering or Comparator
   • Implements NavigableSet interface''',
              icon: Icons.category,

            ),

            // Previous sections remain unchanged...
            // Add these new sections after the existing ones:

            _buildSection(
              title: 'HashSet',
              content: '''
HashSet is the most common implementation of the Set interface, backed by a hash table (actually a HashMap instance).

Key Characteristics:
• Stores elements using hashing mechanism
• Contains unique elements only (no duplicates)
• Allows one null element
• Doesn't maintain insertion order
• Offers constant-time performance for basic operations (add, remove, contains)
• Not synchronized (not thread-safe)

Internal Working:
• Uses HashMap internally to store elements
• Elements are stored as keys in the HashMap (values are dummy objects)
• Relies on hashCode() and equals() methods for uniqueness

Best Use Cases:
• When uniqueness of elements is required
• When order of elements doesn't matter
• For fast lookup operations''',
              icon: Icons.grid_on,
            ),

            _buildSection(
              title: 'LinkedHashSet',
              content: '''
LinkedHashSet extends HashSet and implements Set interface while maintaining insertion order.

Key Characteristics:
• Combines features of HashSet and LinkedList
• Maintains a doubly-linked list running through all entries
• Preserves insertion order
• Slightly slower than HashSet due to maintenance of linked list
• Not synchronized (not thread-safe)

Performance:
• Slightly slower than HashSet for add/remove operations
• Same performance as HashSet for contains operation
• Iteration is faster than HashSet (follows linked list order)

Best Use Cases:
• When insertion order needs to be maintained
• When uniqueness and predictable iteration order are both required''',
              icon: Icons.link,
            ),

            _buildSection(
              title: 'SortedSet Interface',
              content: '''
SortedSet is a subinterface of Set that provides total ordering of its elements.

Key Features:
• Elements are ordered using their natural ordering or by a Comparator
• Provides additional methods that take advantage of the ordering
• All elements inserted must implement Comparable or be accepted by the Comparator

Important Methods:
• first(): Returns the first (lowest) element
• last(): Returns the last (highest) element
• headSet(), tailSet(), subSet(): For range views
• comparator(): Returns the Comparator used

Implementations:
• TreeSet is the primary implementation
• ConcurrentSkipListSet in concurrent package''',
              icon: Icons.sort,
            ),

            _buildSection(
              title: 'TreeSet',
              content: '''
TreeSet implements NavigableSet (which extends SortedSet) and uses a TreeMap for storage.

Key Characteristics:
• Elements are sorted in natural order or by specified Comparator
• Provides guaranteed log(n) time cost for basic operations
• Doesn't allow null elements (if using natural ordering)
• Not synchronized (not thread-safe)

Ordering:
• Natural ordering: Elements must implement Comparable
• Custom ordering: Provide Comparator at creation time

Special Features:
• Provides methods like ceiling(), floor(), higher(), lower()
• Can retrieve subsets using range operations

Best Use Cases:
• When elements need to be in sorted order
• When range operations are needed
• When accessing elements in sorted order is required''',
              icon: Icons.account_tree,
            ),

            _buildSection(
              title: 'Map Interface',
              content: '''
Map represents an object that maps keys to values and cannot contain duplicate keys.

Core Characteristics:
• Key-value pairs (each key maps to exactly one value)
• No duplicate keys allowed
• Each key can map to at most one value
• Basic operations: put, get, remove
• Three collection views: key set, value collection, entry set

Important Methods:
• put(K, V), get(K), remove(K)
• containsKey(), containsValue()
• keySet(), values(), entrySet()
• putAll(), clear()

Implementations:
• HashMap: General-purpose implementation
• LinkedHashMap: Maintains insertion order
• TreeMap: Sorted by keys
• Hashtable: Legacy synchronized implementation''',
              icon: Icons.map,
            ),

            _buildSection(
              title: 'HashMap Class',
              content: '''
HashMap is the most common Map implementation using hash table storage.

Key Features:
• Stores key-value pairs using hashing
• Allows one null key and multiple null values
• No ordering guarantees
• Constant-time performance for basic operations (assuming good hash function)
• Not synchronized (not thread-safe)

Internal Working:
• Uses array of buckets (initially capacity 16)
• Uses hashCode() to determine bucket location
• Handles collisions using linked lists/balanced trees (Java 8+)

Performance Factors:
• Initial capacity (default 16)
• Load factor (default 0.75)
• Hash function quality

Best Use Cases:
• General-purpose key-value storage
• When fast access is needed without ordering requirements''',
              icon: Icons.grid_view,
            ),

            _buildSection(
              title: 'LinkedHashMap Class',
              content: '''
LinkedHashMap extends HashMap and maintains insertion-order or access-order.

Key Characteristics:
• Combines hash table and linked list implementation
• Can maintain either insertion order or access order
• Slightly slower than HashMap due to linked list maintenance
• Not synchronized (not thread-safe)

Ordering Modes:
• Insertion-order: Default mode (keys ordered by insertion)
• Access-order: When created with accessOrder=true (LRU order)

Special Features:
• Useful for creating LRU caches
• Predictable iteration order
• Performance similar to HashMap

Best Use Cases:
• When insertion/access order needs to be maintained
• For building LRU caches
• When predictable iteration order is needed''',
              icon: Icons.line_style,
            ),

            _buildSection(
              title: 'TreeMap Class',
              content: '''
TreeMap implements NavigableMap and stores key-value pairs in a red-black tree.

Key Features:
• Keys are sorted by natural order or by Comparator
• Provides guaranteed log(n) time cost for most operations
• Doesn't allow null keys (if using natural ordering)
• Not synchronized (not thread-safe)

Special Methods:
• firstKey(), lastKey()
• headMap(), tailMap(), subMap()
• ceilingKey(), floorKey(), higherKey(), lowerKey()

Performance:
• Slower than HashMap for most operations
• Faster than HashMap for sorted operations
• Efficient for range operations

Best Use Cases:
• When keys need to be in sorted order
• When range operations are needed
• When accessing entries in key order is required''',
              icon: Icons.grain,
            ),

            _buildSection(
              title: 'Hashtable Class',
              content: '''
Hashtable is a legacy synchronized implementation of the Map interface.

Key Characteristics:
• Thread-safe (synchronized methods)
• Doesn't allow null keys or values
• Slower than HashMap due to synchronization
• Uses Enumeration rather than Iterator for traversal

Comparison with HashMap:
• Synchronized vs non-synchronized
• No nulls vs allows one null key and multiple null values
• Enumerator vs Iterator
• Inherits from Dictionary (legacy class)

Modern Alternatives:
• Use HashMap with Collections.synchronizedMap()
• Use ConcurrentHashMap for better concurrent performance

Best Use Cases:
• Legacy applications requiring thread-safety
• When working with older Java code''',
              icon: Icons.lock_clock,
            ),

            _buildSection(
              title: 'Sorting in Collections',
              content: '''
Java provides several ways to sort collections:

1. Collections.sort():
   • Sorts List implementations
   • Uses natural ordering or specified Comparator
   • Modifies the original list

2. Arrays.sort():
   • Sorts arrays
   • Similar functionality to Collections.sort()

3. Sorted Collections:
   • TreeSet and TreeMap maintain sorted order automatically

Natural Ordering:
• Elements must implement Comparable interface
• Defines the "natural ordering" of objects

Comparator:
• External comparison logic
• Can provide multiple sorting sequences
• More flexible than natural ordering''',
              icon: Icons.sort_by_alpha,
            ),

            _buildSection(
              title: 'Comparable Interface',
              content: '''
The Comparable interface defines the natural ordering of objects.

Key Features:
• Single method: compareTo(Object)
• Returns negative, zero, or positive integer
• Implemented by classes whose objects have natural ordering
• Used by Collections.sort() and Arrays.sort()

Contract Requirements:
• sgn(x.compareTo(y)) == -sgn(y.compareTo(x))
• Transitive: (x.compareTo(y)>0 && y.compareTo(z)>0) ⇒ x.compareTo(z)>0
• Consistent with equals: x.compareTo(y)==0 ⇒ x.equals(y)

Common Implementations:
• String, Integer, Date and other wrapper classes
• Should be implemented for value objects''',
              icon: Icons.compare,
            ),

            _buildSection(
              title: 'Properties Class',
              content: '''
Properties is a specialized Hashtable subclass for handling configuration files.

Key Characteristics:
• Extends Hashtable<Object,Object>
• Designed to work with String keys and values
• Supports loading from/saving to .properties files
• Provides methods for default values
• Thread-safe (inherited from Hashtable)

Main Methods:
• getProperty(), setProperty()
• load(), store()
• propertyNames(), stringPropertyNames()

File Format:
• key=value pairs
• Lines starting with # are comments
• Supports escape sequences

Common Uses:
• Configuration files
• Internationalization (i18n) resource bundles
• Application settings''',
              icon: Icons.settings,
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
            Icon(icon, color: Colors.orangeAccent, size: 28),
            SizedBox(width: 10),
            Text(title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              )),
          ],
        ),
        SizedBox(height: 12),
        Text(content,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            height: 1.6,
          )),
      ],
    );
  }
}