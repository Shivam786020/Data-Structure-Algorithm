import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Unit2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Unit 2:', 
               style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
        elevation: 0,
      ),
      endDrawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
         
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Section

              // Idea Behind Exceptions
              _buildSection(
                title: 'The Idea Behind Exceptions',
                content: '''
Exceptions are events that disrupt the normal flow of a program's execution. They represent unexpected or exceptional conditions that arise during runtime.

Key Concepts:
• Normal Flow vs. Exceptional Flow
• Robust Error Handling
• Separation of Error Handling Code from Main Logic
• Prevention of Program Crashes

Why Exception Handling?
1. Maintains normal program flow
2. Provides meaningful error messages
3. Enables graceful recovery
4. Helps in debugging
5. Prevents resource leaks''',
                icon: Icons.lightbulb_outline,
              ),

              // Exceptions vs Errors
              _buildSection(
                title: 'Exceptions vs Errors',
                content: '''
Exceptions:
• Recoverable conditions
• Can be handled programmatically
• Subclasses of Exception class
• Examples: FileNotFoundException, SQLException

Errors:
• Unrecoverable conditions
• Typically indicate serious problems
• Subclasses of Error class
• Examples: OutOfMemoryError, StackOverflowError

Key Differences:
| Feature        | Exceptions                     | Errors                     |
|----------------|--------------------------------|----------------------------|
| Recoverability | Can be caught and handled      | Cannot be recovered from   |
| Source         | Application-level issues       | System-level issues        |
| Handling       | Should be handled              | Should not be caught       |
| Examples       | IOExceptions, SQLExceptions   | VirtualMachineError, ...   |''',
                icon: Icons.compare,
              ),

              // Types of Exceptions
              _buildSection(
                title: 'Types of Exceptions',
                content: '''
1. Checked Exceptions:
   • Checked at compile-time
   • Must be declared or handled
   • Subclasses of Exception (but not RuntimeException)
   • Examples: IOException, SQLException

2. Unchecked Exceptions:
   • Not checked at compile-time
   • Subclasses of RuntimeException
   • Examples: NullPointerException, ArrayIndexOutOfBoundsException

3. Errors:
   • Serious system problems
   • Examples: OutOfMemoryError, StackOverflowError

Hierarchy:
Throwable
├── Error (unchecked)
└── Exception
    ├── RuntimeException (unchecked)
    └── Other Exceptions (checked)''',
                icon: Icons.warning,
              ),

              // Control Flow in Exceptions
              _buildSection(
                title: 'Control Flow in Exception Handling',
                content: '''
Normal Execution:
1. Try block executes
2. If no exception, continues after try-catch
3. Finally block executes (if present)

Exceptional Execution:
1. Exception occurs in try block
2. Immediate jump to matching catch block
3. Finally block executes (if present)
4. Continues after try-catch-finally

Important Rules:
• Only one catch block executes per exception
• Finally always executes (except System.exit())
• Control never returns to point of exception''',
                icon: Icons.alt_route,
              ),
              Center(
                //child: Image.asset('assets/exception_flow.png', width: 300),
              ),

              // JVM Reaction to Exceptions
              _buildSection(
                title: 'JVM Reaction to Exceptions',
                content: '''
When an exception occurs:
1. JVM creates an exception object
2. Normal execution stops
3. JVM looks for exception handler in current method
4. If not found, method terminates and JVM unwinds stack
5. Process repeats in calling method
6. If no handler found in call stack, program terminates

Exception Object Contains:
• Type of exception
• Message describing error
• Stack trace (call hierarchy)

Stack Unwinding:
• Process of removing methods from call stack
• Continues until handler found or program terminates''',
                icon: Icons.settings,
              ),

              // try-catch-finally
              _buildSection(
                title: 'try-catch-finally Blocks',
                content: '''
Basic Structure:
try {
    // Code that might throw exception
} 
catch (ExceptionType e) {
    // Handle exception
} 
finally {
    // Cleanup code (always executes)
}

Key Points:
• try block must have either catch or finally
• Multiple catch blocks allowed (specific to general)
• finally executes regardless of exception
• Resources can be declared in try-with-resources''',
                icon: Icons.block,
              ),
              _buildCodeBlock('''
// Example with multiple catch blocks
try {
    FileReader file = new FileReader("test.txt");
    int data = file.read();
    System.out.println("Data: " + data);
} 
catch (FileNotFoundException e) {
    System.out.println("File not found: " + e.getMessage());
} 
catch (IOException e) {
    System.out.println("IO Error: " + e.getMessage());
} 
finally {
    System.out.println("This always executes");
}'''),

              // throw keyword
              _buildSection(
                title: 'throw Keyword',
                content: '''
Used to explicitly throw an exception:
• Can throw throwable objects
• Typically used for:
  - Custom exception conditions
  - Re-throwing exceptions
  - Converting exception types

Example:
void validateAge(int age) {
    if (age < 18) {
        throw new ArithmeticException("Age must be 18+");
    }
    System.out.println("Valid age");
}

Usage:
try {
    validateAge(15);
} 
catch (ArithmeticException e) {
    System.out.println("Invalid age: " + e.getMessage());
}''',
                icon: Icons.arrow_upward,
              ),

              // throws keyword
              _buildSection(
                title: 'throws Clause',
                content: '''
Indicates that a method might throw exceptions:
• Used for checked exceptions
• Part of method signature
• Caller must handle or declare

Example:
// Method declaration
public void readFile() throws FileNotFoundException {
    FileReader file = new FileReader("test.txt");
    // ...
}

// Calling code must handle
try {
    readFile();
} 
catch (FileNotFoundException e) {
    System.out.println("File not found");
}''',
                icon: Icons.arrow_downward,
              ),

              // Built-in vs Custom Exceptions
              _buildSection(
                title: 'Built-in vs Custom Exceptions',
                content: '''
Built-in Exceptions:
• Provided by Java API
• Examples:
  - IOException
  - SQLException
  - NullPointerException
  - ArrayIndexOutOfBoundsException

Custom Exceptions:
• User-defined exception classes
• Extend Exception or RuntimeException
• Should provide constructors
• Used for application-specific errors

Example Custom Exception:
class InsufficientFundsException extends Exception {
    private double amount;
    
    public InsufficientFundsException(double amount) {
        this.amount = amount;
    }
    
    public double getAmount() {
        return amount;
    }
    
    @Override
    public String getMessage() {
        return "Insufficient funds. Need  + amount + " more.";
    }
}

// Usage
void withdraw(double amount) throws InsufficientFundsException {
    if (balance < amount) {
        throw new InsufficientFundsException(amount - balance);
    }
    balance -= amount;
}''',
                icon: Icons.build,
              ),

              // Checked vs Unchecked Exceptions
              _buildSection(
                title: 'Checked vs Unchecked Exceptions',
                content: '''
Checked Exceptions:
• Must be declared or handled
• Compile-time checking
• Represent recoverable conditions
• Examples: IOException, ClassNotFoundException

Unchecked Exceptions:
• Not checked at compile-time
• Represent programming errors
• Examples: NullPointerException, ArithmeticException

When to Use:
• Checked: For recoverable conditions caller should handle
• Unchecked: For programming errors (bugs)

Best Practices:
1. Use checked exceptions for recoverable conditions
2. Use unchecked for programming errors
3. Don't overuse checked exceptions
4. Create custom exceptions when needed''',
                icon: Icons.check_box,
              ),

              // Exception Handling Best Practices
              _buildSection(
                title: 'Best Practices',
                content: '''
1. Catch specific exceptions first
2. Don't catch Throwable or Exception broadly
3. Clean up resources in finally blocks
4. Use try-with-resources for AutoCloseable
5. Include meaningful messages
6. Log exceptions properly
7. Don't ignore caught exceptions
8. Preserve exception chains
9. Use custom exceptions judiciously
10. Document exceptions with @throws''',
                icon: Icons.star,
              ),
              _buildCodeBlock('''
// Good practice example
try (FileReader file = new FileReader("data.txt");
     BufferedReader br = new BufferedReader(file)) {
    String line;
    while ((line = br.readLine()) != null) {
        System.out.println(line);
    }
} 
catch (FileNotFoundException e) {
    System.err.println("File not found: " + e.getMessage());
    logger.log(Level.SEVERE, "File error", e);
} 
catch (IOException e) {
    System.err.println("IO Error: " + e.getMessage());
    logger.log(Level.SEVERE, "IO error", e);
}'''),

              SizedBox(height: 30),

// Add these widgets to your Column children list after the Exception Handling content

// I/O Basics Introduction
_buildSection(
  title: 'I/O Basics in Java',
  content: '''
Java I/O (Input/Output) is used to process input and produce output. The java.io package contains classes for:

Key Concepts:
• Streams: Sequences of data
• Byte Streams: 8-bit bytes (binary data)
• Character Streams: 16-bit Unicode (text data)
• Buffering: Improves performance
• Serialization: Object persistence

Common Use Cases:
• Reading/writing files
• Network communication
• System input/output
• Data conversion''',
  icon: Icons.input,
),

// Byte Streams
_buildSection(
  title: 'Byte Streams',
  content: '''
Handle I/O of raw binary data (8-bit bytes). Main classes from java.io:

Input Streams:
• InputStream (abstract)
• FileInputStream
• BufferedInputStream
• DataInputStream

Output Streams:
• OutputStream (abstract)
• FileOutputStream
• BufferedOutputStream
• DataOutputStream

Key Characteristics:
• Process data byte-by-byte
• Good for binary files (images, videos, etc.)
• Lower-level than character streams
• Faster for binary data''',
  icon: Icons.stream,
),
_buildCodeBlock('''
// Copy file using byte streams
try (FileInputStream in = new FileInputStream("input.jpg");
     FileOutputStream out = new FileOutputStream("output.jpg")) {
    
    byte[] buffer = new byte[1024];
    int bytesRead;
    
    while ((bytesRead = in.read(buffer)) != -1) {
        out.write(buffer, 0, bytesRead);
    }
    System.out.println("File copied successfully");
} 
catch (IOException e) {
    System.err.println("Error copying file: " + e.getMessage());
}'''),

// Character Streams
_buildSection(
  title: 'Character Streams',
  content: '''
Handle I/O of text data (16-bit Unicode characters). Main classes from java.io:

Readers:
• Reader (abstract)
• InputStreamReader
• FileReader
• BufferedReader

Writers:
• Writer (abstract)
• OutputStreamWriter
• FileWriter
• BufferedWriter

Key Characteristics:
• Process data character-by-character
• Handle character encoding automatically
• Better for text files
• Higher-level than byte streams''',
  icon: Icons.text_fields,
),
_buildCodeBlock('''
// Read text file line by line
try (BufferedReader reader = new BufferedReader(new FileReader("textfile.txt"))) {
    String line;
    while ((line = reader.readLine()) != null) {
        System.out.println(line);
    }
} 
catch (IOException e) {
    System.err.println("Error reading file: " + e.getMessage());
}

// Write to text file
try (BufferedWriter writer = new BufferedWriter(new FileWriter("output.txt"))) {
    writer.write("Hello, World!");
    writer.newLine();
    writer.write("This is a text file.");
} 
catch (IOException e) {
    System.err.println("Error writing file: " + e.getMessage());
}'''),

// File Reading/Writing
_buildSection(
  title: 'File Reading & Writing',
  content: '''
Java provides multiple ways to handle files:

1. Legacy File I/O (java.io):
   • File, FileReader, FileWriter, etc.
   • Stream-based
   • Requires manual resource management

2. NIO (New I/O, java.nio):
   • Path, Files, FileChannel
   • Buffer-oriented
   • Non-blocking operations
   • Better performance for large files

3. Modern Approaches (Java 7+):
   • Files utility class
   • try-with-resources
   • Simple methods for common operations''',
  icon: Icons.insert_drive_file,
),
_buildCodeBlock('''
// Modern file reading (Java 7+)
import java.nio.file.*;
import java.util.List;

// Read all lines
try {
    List<String> lines = Files.readAllLines(Paths.get("data.txt"));
    lines.forEach(System.out::println);
} 
catch (IOException e) {
    System.err.println("Error reading file: " + e.getMessage());
}

// Write to file
try {
    String content = "Sample text to write";
    Files.write(Paths.get("output.txt"), content.getBytes());
} 
catch (IOException e) {
    System.err.println("Error writing file: " + e.getMessage());
}'''),

// Comparing Stream Types
_buildSection(
  title: 'Byte vs Character Streams',
  content: '''
Key Differences:

| Feature          | Byte Streams                  | Character Streams            |
|------------------|-------------------------------|------------------------------|
| Data Unit        | 8-bit bytes                   | 16-bit Unicode characters    |
| Best For         | Binary files (images, etc.)   | Text files                   |
| Classes          | InputStream/OutputStream      | Reader/Writer                |
| Performance      | Faster for binary data        | Better for text processing   |
| Encoding         | No encoding handling          | Automatic encoding handling  |
| Buffering        | Manual (BufferedInputStream)  | Manual (BufferedReader)      |

When to Use:
• Byte Streams: Images, audio, video, serialized objects
• Character Streams: Text files, configuration files, logs''',
  icon: Icons.compare,
),

// Common File Operations
_buildSection(
  title: 'Common File Operations',
  content: '''
Basic file handling operations:

1. Check file existence:
   Files.exists(Paths.get("file.txt"))

2. Create directory:
   Files.createDirectory(Paths.get("newdir"))

3. Copy file:
   Files.copy(source, target)

4. Move/rename file:
   Files.move(source, target)

5. Delete file:
   Files.delete(path)

6. Get file info:
   size = Files.size(path)
   modified = Files.getLastModifiedTime(path)

7. Read all bytes:
   byte[] data = Files.readAllBytes(path)

8. Write all bytes:
   Files.write(path, byteArray)''',
  icon: Icons.list,
),
_buildCodeBlock('''
// Example of common operations
try {
    Path path = Paths.get("example.txt");
    
    // Check if file exists
    if (!Files.exists(path)) {
        // Create file
        Files.createFile(path);
        System.out.println("File created");
    }
    
    // Write content
    Files.write(path, "Hello".getBytes(), StandardOpenOption.APPEND);
    
    // Get file info
    long size = Files.size(path);
    System.out.println("File size: " + size + " bytes");
    
    // Read content
    String content = new String(Files.readAllBytes(path));
    System.out.println("Content: " + content);
} 
catch (IOException e) {
    System.err.println("File error: " + e.getMessage());
}'''),

// Helper Methods (ensure these are in your code)
// Add these widgets to your Column children list after the I/O content

// Multithreading Introduction
_buildSection(
  title: 'Multithreading in Java',
  content: '''
Multithreading allows concurrent execution of two or more threads for maximum CPU utilization.

Key Concepts:
• Thread: Lightweight sub-process, smallest unit of execution
• Process vs Thread: Threads share memory space, processes don't
• Advantages:
  - Better CPU utilization
  - Improved performance for I/O bound tasks
  - Responsive applications
  - Simplified modeling of concurrent activities

Thread Safety:
• Critical section protection needed
• Shared resources require synchronization
• Race conditions must be prevented''',
  icon: Icons.devices_other,
),

// Thread Life Cycle
_buildSection(
  title: 'Thread Life Cycle',
  content: '''
Thread states in Java:

1. New: Thread created but not started
2. Runnable: Ready to run (may be running or waiting for CPU)
3. Blocked/Waiting: Waiting for monitor lock or other thread
4. Timed Waiting: Waiting for specified time
5. Terminated: Thread has completed execution

State Transitions:
• start() → New to Runnable
• yield() → Runnable to Runnable (hinting scheduler)
• sleep(), wait() → Runnable to Timed Waiting
• I/O operation → Runnable to Blocked
• notify(), notifyAll() → Waiting to Runnable
• run() completes → Runnable to Terminated''',
  icon: Icons.repeat,
),
Center(
  //child: Image.asset('assets/thread_lifecycle.png', width: 300),//
),

// Creating Threads
_buildSection(
  title: 'Creating Threads',
  content: '''
Two ways to create threads in Java:

1. Extending Thread class:
   • Create subclass of Thread
   • Override run() method
   • Create instance and call start()

2. Implementing Runnable interface:
   • Implement Runnable interface
   • Implement run() method
   • Pass to Thread constructor
   • Call start() on Thread object

Best Practice:
• Prefer implementing Runnable
  - More flexible (can extend other classes)
  - Better for thread pools
  - Separates task from runner''',
  icon: Icons.create,
),
_buildCodeBlock('''
// Method 1: Extending Thread
class MyThread extends Thread {
    public void run() {
        System.out.println("Thread running: " + getName());
    }
}

// Method 2: Implementing Runnable
class MyRunnable implements Runnable {
    public void run() {
        System.out.println("Runnable running: " + 
            Thread.currentThread().getName());
    }
}

// Usage
public class Main {
    public static void main(String[] args) {
        // Extending Thread
        MyThread thread1 = new MyThread();
        thread1.start();
        
        // Implementing Runnable
        Thread thread2 = new Thread(new MyRunnable());
        thread2.start();
        
        // Lambda version (Java 8+)
        Thread thread3 = new Thread(() -> {
            System.out.println("Lambda thread: " + 
                Thread.currentThread().getName());
        });
        thread3.start();
    }
}'''),

// Thread Priorities
_buildSection(
  title: 'Thread Priorities',
  content: '''
Threads have priorities (1-10) that influence scheduling:

• MIN_PRIORITY: 1
• NORM_PRIORITY: 5 (default)
• MAX_PRIORITY: 10

Key Points:
• Higher priority threads get preference in scheduling
• Not guaranteed (depends on OS implementation)
• Can be set using setPriority()
• Get current priority with getPriority()

Best Practices:
• Avoid relying on priorities for correctness
• Use mainly for performance tuning
• Don't set all threads to high priority''',
  icon: Icons.low_priority,
),
_buildCodeBlock('''
// Priority example
Thread highPriority = new Thread(() -> {
    System.out.println("High priority thread");
});
highPriority.setPriority(Thread.MAX_PRIORITY);

Thread lowPriority = new Thread(() -> {
    System.out.println("Low priority thread");
});
lowPriority.setPriority(Thread.MIN_PRIORITY);

highPriority.start();
lowPriority.start();'''),

// Synchronizing Threads
_buildSection(
  title: 'Synchronizing Threads',
  content: '''
Synchronization prevents thread interference and memory consistency errors.

Approaches:
1. Synchronized Methods:
   • Entire method locked
   • Lock on object (instance methods) or class (static methods)

2. Synchronized Blocks:
   • More granular control
   • Can lock on any object

3. Lock Objects (java.util.concurrent.locks):
   • More flexible than synchronized

Key Concepts:
• Only one thread can hold lock at a time
• Other threads block until lock released
• Helps prevent race conditions
• Can lead to deadlocks if not careful''',
  icon: Icons.lock,
),
_buildCodeBlock('''
// Shared resource
class Counter {
    private int count = 0;
    
    // Synchronized method
    public synchronized void increment() {
        count++;
    }
    
    // Synchronized block
    public void decrement() {
        synchronized(this) {
            count--;
        }
    }
    
    public int getCount() {
        return count;
    }
}

// Usage
Counter counter = new Counter();

Runnable task = () -> {
    for (int i = 0; i < 1000; i++) {
        counter.increment();
    }
};

Thread t1 = new Thread(task);
Thread t2 = new Thread(task);

t1.start();
t2.start();

t1.join();
t2.join();

System.out.println("Final count: " + counter.getCount()); // Should be 2000'''),

// Inter-Thread Communication
_buildSection(
  title: 'Inter-Thread Communication',
  content: '''
Threads can communicate using:

1. wait(): 
   • Releases lock and waits
   • Must be in synchronized block

2. notify(): 
   • Wakes one waiting thread
   • Must be in synchronized block

3. notifyAll(): 
   • Wakes all waiting threads
   • Must be in synchronized block

Common Pattern:
• Producer-Consumer problem
• Threads wait for condition
• Notify when condition changes

Important:
• Always call wait() in loop checking condition
• Prefer notifyAll() over notify() to avoid starvation''',
  icon: Icons.notifications_active,
),
_buildCodeBlock('''
// Producer-Consumer example
class MessageQueue {
    private String message;
    private boolean empty = true;

    public synchronized String take() {
        // Wait until message is available
        while (empty) {
            try {
                wait();
            } catch (InterruptedException e) {}
        }
        empty = true;
        notifyAll();
        return message;
    }

    public synchronized void put(String message) {
        // Wait until message has been retrieved
        while (!empty) {
            try { 
                wait();
            } catch (InterruptedException e) {}
        }
        empty = false;
        this.message = message;
        notifyAll();
    }
}

// Usage
MessageQueue queue = new MessageQueue();

// Producer
new Thread(() -> {
    String[] messages = {"Hello", "World", "Goodbye"};
    for (String msg : messages) {
        queue.put(msg);
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {}
    }
}).start();

// Consumer
new Thread(() -> {
    for (int i = 0; i < 3; i++) {
        System.out.println("Received: " + queue.take());
    }
}).start();'''),

// Thread Safety Best Practices
_buildSection(
  title: 'Thread Safety Best Practices',
  content: '''
1. Immutable Objects:
   • Best for thread safety
   • No synchronization needed

2. Confinement:
   • Don't share data between threads
   • Use thread-local variables

3. Synchronization:
   • Use when sharing is necessary
   • Keep synchronized blocks small

4. Concurrent Collections:
   • Prefer java.util.concurrent classes
   • Thread-safe implementations

5. Atomic Variables:
   • java.util.concurrent.atomic package
   • For simple atomic operations

6. Avoid:
   • Deadlocks (circular wait)
   • Starvation (threads waiting indefinitely)
   • Livelocks (threads busy but not progressing)''',
  icon: Icons.security,
),
_buildCodeBlock('''
// Good practices examples
import java.util.concurrent.*;

// 1. Using concurrent collections
ConcurrentMap<String, Integer> map = new ConcurrentHashMap<>();
map.put("key", 42);

// 2. Using atomic variables
AtomicInteger counter = new AtomicInteger(0);
counter.incrementAndGet();

// 3. Using thread pools
ExecutorService executor = Executors.newFixedThreadPool(4);
executor.submit(() -> System.out.println("Task running"));
executor.shutdown();'''),
     ],
          ),
        ),
      ),
    );
  }
// Helper Methods (ensure these are in your code)
Widget _buildCodeBlock(String code) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.only(top: 10, bottom: 15),
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(10),
    ),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SelectableText(
        code,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'RobotoMono',
          fontSize: 13,
        ),
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
              fontWeight: FontWeight.w400,
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