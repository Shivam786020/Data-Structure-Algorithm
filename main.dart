//import 'package:dsa_app/ADDsWidget/banner.dart';
import 'package:dsa_app/algorithms/backtrack.dart';
import 'package:dsa_app/algorithms/dynamic.dart';
import 'package:dsa_app/algorithms/greedy.dart';
import 'package:dsa_app/algorithms/searching.dart';
import 'package:dsa_app/data/Arrays.dart';
import 'package:dsa_app/data/graphs.dart';
import 'package:dsa_app/data/hashtable.dart';
import 'package:dsa_app/data/linked.dart';
import 'package:dsa_app/data/queue.dart';
import 'package:dsa_app/dbms/dbms.dart';
import 'package:dsa_app/detailpage.dart';
import 'package:dsa_app/functionss/algo.dart';
import 'package:dsa_app/functionss/datas.dart';
import 'package:dsa_app/jadb.dart';
import 'package:dsa_app/oopsjava/java.dart';
import 'package:dsa_app/oopsjava/unit1.dart';
import 'package:dsa_app/oopsjava/unit2.dart';
import 'package:dsa_app/oopsjava/unit4.dart';
import 'package:dsa_app/oopsjava/unit5.dart';
import 'package:dsa_app/oopsjava/unti3.dart';
import 'package:dsa_app/sorting/sort.dart';
import 'package:dsa_app/ss.dart';
import 'package:dsa_app/tree/avl.dart';
import 'package:dsa_app/tree/bina.dart';
import 'package:dsa_app/tree/biser.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'Appdrawer.dart';

//import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await MobileAds.instance.initialize();  // Initialize AdMob
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DS&A Handbook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black87,
      ),
      home: const HomePage(),
      routes: {
        // Define named routes for all your topic pages
        '/arrays': (context) => Arrays(),
        '/linkedLists': (context) => Linked(),
        '/stacks': (context) => Stack(),
        '/queues': (context) => Queue(),
        '/trees': (context) => Tree(),
        '/graphs': (context) => Graphs(),
        '/hashTables': (context) => Hashtable(),
        '/sortingAlgorithms': (context) => Sort(),
        '/searchingAlgorithms': (context) => Searching(),
        '/dynamicProgramming': (context) => Dynamic(),
        '/greedyAlgorithms': (context) => Greedy(),
        '/backtracking': (context) => Backtrack(),
        '/javaProgramming': (context) => Java(),
        '/avl':(context) => Avl(),
        '/databaseSystems': (context) => Dbms(),
        '/binarytree': (context) => Bina(),
        '/binary search': (context) => Biser(),
        '/dataStructuresAlgorithms': (context) => DetailPage(),
        '/unit 1': (context) => Unit1(),
        '/unit 2': (context) => Unit2(),
        '/unit 3': (context) => Unti3(),
        '/unit 4': (context) => Unit4(),
        '/unit 5': (context) => Unit5(),

      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResults = [];
  
  final List<Map<String, dynamic>> _allTopics = [
    // Data Structures
    {
      'title': 'Arrays', 
      'type': 'Data Structure', 
      'route': '/arrays',
      'widget': InkWell(
        child: Text('Arrays', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Linked Lists', 
      'type': 'Data Structure', 
      'route': '/linkedLists',
      'widget': InkWell(
        child: Text('Linked Lists', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Stacks', 
      'type': 'Data Structure', 
      'route': '/stacks',
      'widget': InkWell(
        child: Text('Stacks', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Queues', 
      'type': 'Data Structure', 
      'route': '/queues',
      'widget': InkWell(
        child: Text('Queues', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Trees', 
      'type': 'Data Structure', 
      'route': '/trees',
      'widget': InkWell(
        child: Text('Trees', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Graphs', 
      'type': 'Data Structure', 
      'route': '/graphs',
      'widget': InkWell(
        child: Text('Graphs', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Hash Tables', 
      'type': 'Data Structure', 
      'route': '/hashTables',
      'widget': InkWell(
        child: Text('Hash Tables', style: TextStyle(color: Colors.blue))),
    },
    
    // Algorithms
    {
      'title': 'Sorting Algorithms', 
      'type': 'Algorithm', 
      'route': '/sortingAlgorithms',
      'widget': InkWell(
        child: Text('Sorting Algorithms', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Searching Algorithms', 
      'type': 'Algorithm', 
      'route': '/searchingAlgorithms',
      'widget': InkWell(
        child: Text('Searching Algorithms', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Dynamic Programming', 
      'type': 'Algorithm', 
      'route': '/dynamicProgramming',
      'widget': InkWell(
        child: Text('Dynamic Programming', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Greedy Algorithms', 
      'type': 'Algorithm', 
      'route': '/greedyAlgorithms',
      'widget': InkWell(
        child: Text('Greedy Algorithms', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Backtracking', 
      'type': 'Algorithm', 
      'route': '/backtracking',
      'widget': InkWell(
        child: Text('Backtracking', style: TextStyle(color: Colors.blue))),
    },
    
    // Subjects
    {
      'title': 'Java Programming', 
      'type': 'Subject', 
      'route': '/javaProgramming',
      'widget': InkWell(
        child: Text('Java Programming', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Database Systems', 
      'type': 'Subject', 
      'route': '/databaseSystems',
      'widget': InkWell(
        child: Text('Database Systems', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Computer Science Syllabus', 
      'type': 'Subject', 
      'route': '/computerScienceSyllabus',
      'widget': InkWell(
        child: Text('Computer Science Syllabus', style: TextStyle(color: Colors.blue))),
    },
    {
      'title': 'Unit 1', 
      'type': 'Data structure & Algorithms', 
      'route': '/unit 1',
      'widget': InkWell(
        child: Text('Data Structures & Algorithms', style: TextStyle(color: Colors.blue))),
    },
      {
      'title': 'Unit 2', 
      'type': 'Data structure & Algorithms', 
      'route': '/unit 2',
      'widget': InkWell(
        child: Text('Data Structures & Algorithms', style: TextStyle(color: Colors.blue))),
    },
      {
      'title': 'Unit 3', 
      'type': 'Data structure & Algorithms', 
      'route': '/unit 3',
      'widget': InkWell(
        child: Text('Data Structures & Algorithms', style: TextStyle(color: Colors.blue))),
    },
      {
      'title': 'Unit 4', 
      'type': 'Data structure & Algorithms', 
      'route': '/unit 4',
      'widget': InkWell(
        child: Text('Data Structures & Algorithms', style: TextStyle(color: Colors.blue))),
    },
      {
      'title': 'Unit 5', 
      'type': 'Data structure & Algorithms', 
      'route': '/unit 5',
      'widget': InkWell(
        child: Text('Data Structures & Algorithms', style: TextStyle(color: Colors.blue))),
    },
  ];

  void _shareContent() {
    Share.share('Check out this amazing DS&A Handbook app!');
  }

  void _searchTopics(String query) {
    setState(() {
      if (query.isEmpty) {
        _searchResults = [];
      } else {
        _searchResults = _allTopics.where((topic) {
          return topic['title'].toLowerCase().contains(query.toLowerCase()) ||
                 topic['type'].toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _navigateToTopic(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: !_isSearching
            ? const Text('DS&A Made Easy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200))
            : AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 250,
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  onChanged: _searchTopics,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    iconColor: Colors.white,
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
        actions: [
          !_isSearching
              ? IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isSearching = true;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      _isSearching = false;
                      _searchController.clear();
                      _searchResults = [];
                    });
                  },
                ),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: _shareContent,
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_searchResults.isNotEmpty) ...[
              const Text(
                'Search Results',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Column(
                children: _searchResults.map((topic) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    onTap: () => _navigateToTopic(context, topic['route']),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            topic['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            topic['type'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )).toList(),
              ),
              const SizedBox(height: 20),
            ] else if (_isSearching && _searchController.text.isEmpty) ...[
              const Center(
                child: Text(
                  'Type to search for topics',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ] else if (_isSearching && _searchResults.isEmpty) ...[
              const Center(
                child: Text(
                  'No results found',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ] else ...[
              // Original content when not searching
              const Text(
                'Data Structures & Algorithms',
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Data Structures',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'A data structure is a way of organizing, storing, and managing data in a computer so that it can be used efficiently.'
                ' It provides a means to handle large amounts of data effectively,'
                ' enabling faster access, modification, and processing. Data structures are '
                'fundamental to designing efficient algorithms and solving complex computational problems.',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              const Inkwelll(),
              const SizedBox(height: 20),
              const Text(
                'Algorithms',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Algorithms are step-by-step procedures or sets of rules for solving a specific problem or performing a computation. They are the backbone of computer science and are used to process data, perform calculations, and automate tasks. An algorithm takes an input, processes it, and produces an output.',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 10),
              const Text(
                'Algorithms are essential for developing software, building applications, and solving complex problems efficiently. They are used in various fields, including artificial intelligence, machine learning, data science, and cryptography.',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              const Algo(),
              const SizedBox(height: 30),
              const Text(
                'Computer Science Syllabus Related Subjects: ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Jadb(),
              SizedBox(height: 20,),
            //BannerAdWidget()
            ],
          ],
        ),
      ),
    );
  }
}