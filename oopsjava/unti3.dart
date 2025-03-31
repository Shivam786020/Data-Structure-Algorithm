import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Unti3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Unit 3: Java New Features',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Functional Interfaces',
              content: '''
Functional interfaces are interfaces with exactly one abstract method. They can have multiple default or static methods but only one abstract method. The @FunctionalInterface annotation ensures this contract. Java provides several built-in functional interfaces like Predicate, Function, Consumer, and Supplier in the java.util.function package.

Functional interfaces enable lambda expressions and are fundamental to Java's functional programming support. They allow behavior parameterization and help write more concise, readable code by separating what to do from how to do it.''',
              icon: Icons.functions,
            ),
            _buildCodeBlock('''
@FunctionalInterface
interface Greeting {
    void sayHello(String name);  // Single abstract method
    
    default void defaultGreet() {
        System.out.println("Hello, World!");
    }
}

public class Main {
    public static void main(String[] args) {
        // Lambda implementation
        Greeting greet = name -> System.out.println("Hello, " + name);
        greet.sayHello("Alice");
        
        // Method reference
        Greeting sysout = System.out::println;
        sysout.sayHello("Bob");
    }
}'''),

            _buildSection(
              title: 'Lambda Expressions',
              content: '''
Lambda expressions provide a concise way to represent instances of functional interfaces. They eliminate the need for anonymous class boilerplate and enable functional programming in Java. The syntax consists of parameters, an arrow (->), and a body.

Lambdas can capture variables from their enclosing scope (effectively final variables). They improve code readability for operations like event handlers, thread initialization, and collection processing. The Java compiler infers types from the context, making lambdas more compact.''',
              icon: Icons.code,
            ),
            _buildCodeBlock('''
import java.util.Arrays;
import java.util.List;

public class LambdaDemo {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Alice", "Bob", "Charlie");
        
        // ForEach with lambda
        names.forEach(name -> System.out.println(name));
        
        // Sorting with lambda
        names.sort((a, b) -> a.length() - b.length());
        
        // Thread with lambda
        new Thread(() -> {
            System.out.println("Running in thread");
        }).start();
        
        // Filter with predicate lambda
        names.stream()
             .filter(name -> name.startsWith("A"))
             .forEach(System.out::println);
    }
}'''),

            _buildSection(
              title: 'Method References',
              content: '''
Method references are shorthand notation for lambda expressions that call existing methods. They're even more concise than lambdas when you simply need to call a method. There are four kinds of method references:
1. Reference to static method (ClassName::staticMethod)
2. Reference to instance method of particular object (instance::method)
3. Reference to instance method of arbitrary object of particular type (ClassName::method)
4. Reference to constructor (ClassName::new)

Method references improve code readability by directly expressing the method to be called rather than writing a lambda that calls the method.''',
              icon: Icons.link,
            ),
            _buildCodeBlock('''
import java.util.List;
import java.util.Arrays;

public class MethodRefDemo {
    public static void main(String[] args) {
        List<String> messages = Arrays.asList("Hello", "World", "Java");
        
        // Static method reference
        messages.forEach(System.out::println);
        
        // Instance method reference
        String prefix = "MSG: ";
        messages.forEach(prefix::concat);
        
        // Arbitrary object method reference
        messages.forEach(String::toUpperCase);
        
        // Constructor reference
        messages.stream()
                .map(String::new)
                .forEach(System.out::println);
    }
    
    static void print(String s) {
        System.out.println(s);
    }
}'''),

            _buildSection(
              title: 'Repeating Annotations',
              content: '''
Java 8 introduced repeating annotations which allow the same annotation to be applied multiple times to a declaration. Before Java 8, you needed to use a container annotation to achieve similar functionality. 

Key Points:
• Use @Repeatable meta-annotation to make an annotation repeatable
• Requires a container annotation to store the repeated annotations
• The container annotation is automatically generated by the compiler if not explicitly defined
• Accessed via reflection or the getAnnotationsByType() method

Common Use Cases:
• Adding multiple constraints to a field
• Tagging methods with multiple categories
• Specifying multiple authorization roles''',
              icon: Icons.repeat,
            ),
            _buildCodeBlock('''
// Define repeatable annotation
@Repeatable(Authors.class)
@interface Author {
    String name();
}

// Container annotation
@interface Authors {
    Author[] value();
}

// Usage
@Author(name="John")
@Author(name="Jane")
class Book {
    // Class implementation
}

// Accessing annotations
Author[] authors = Book.class.getAnnotationsByType(Author.class);'''),

            _buildSection(
              title: 'Java Module System (JPMS)',
              content: '''
Java Platform Module System (JPMS) introduced in Java 9 provides strong encapsulation and reliable configuration. It helps manage large codebases and prevents JAR hell.

Main Components:
• module-info.java - declares module name, dependencies, and exports
• Requires - specifies module dependencies
• Exports - makes packages available to other modules
• Provides/With - declares service implementations
• Opens - allows reflective access (for frameworks like Spring)

Benefits:
• Better dependency management
• Strong encapsulation (non-exported packages are inaccessible)
• Improved performance (only required modules are loaded)
• Smaller runtime images (jlink tool)''',
              icon: Icons.apps,
            ),
            _buildCodeBlock('''
// module-info.java example
module com.example.myapp {
    requires java.base;           // Implicit dependency
    requires java.sql;            // Standard module
    requires org.apache.commons;  // Third-party module
    
    exports com.example.myapp.api;
    opens com.example.myapp.model to hibernate.core;
    
    provides com.example.spi.Service
        with com.example.impl.MyService;
}'''),

            _buildSection(
              title: 'Diamond Syntax with Anonymous Classes',
              content: '''
Java 7 introduced the diamond operator (<>) to reduce verbosity in generic type declarations. Java 9 extended this to work with anonymous inner classes.

Key Features:
• Type inference for generic instance creation
• Eliminates redundant type declarations
• Works with both concrete and anonymous classes
• Makes code more readable while maintaining type safety

Limitations:
• Cannot be used when the anonymous class needs to extend/implement a generic type with wildcards
• The inferred type is the same as the declaration type''',
              icon: Icons.diamond,
            ),
            _buildCodeBlock('''
// Java 7+ diamond syntax
List<String> names = new ArrayList<>();  // Concrete class

// Java 9+ with anonymous class
AbstractList<String> list = new ArrayList<>() {  // Anonymous class
    @Override
    public int size() {
        return 0;
    }
};

// Pre-Java 9 required verbose syntax
AbstractList<String> oldList = new ArrayList<String>() {
    @Override
    public int size() {
        return 0;
    }
};'''),

            _buildSection(
              title: 'Local Variable Type Inference (var)',
              content: '''
Java 10 introduced the var keyword for local variable type inference, allowing the compiler to infer the type based on the initializer.

Characteristics:
• Can only be used for local variables with initializers
• Cannot be used for method parameters, return types, or fields
• The inferred type is fixed (cannot be changed later)
• Improves readability for complex generic types
• Doesn't make Java dynamically typed - type is still checked at compile time

Best Practices:
• Use when the type is obvious from context
• Avoid when it reduces readability
• Don't use for primitive literals (int, double, etc.)''',
              icon: Icons.type_specimen,
            ),
            _buildCodeBlock('''
// Basic usage
var list = new ArrayList<String>();  // Inferred as ArrayList<String>
var stream = list.stream();          // Inferred as Stream<String>

// Good for complex types
var entries = Map.ofEntries(
    Map.entry("key1", 1),
    Map.entry("key2", 2)
);  // Inferred as Map<String, Integer>

// Not recommended when type isn't clear
var result = processData();  // What type is result?

// Invalid uses
var x;                      // Error: cannot infer type
var y = null;               // Error: cannot infer type
public var z = 10;          // Error: cannot use 'var' for fields'''),

            _buildSection(
              title: 'Switch Expressions',
              content: '''
Java 12 introduced switch expressions (standardized in Java 14) as a more concise and less error-prone alternative to traditional switch statements.

Features:
• Can return a value (expression rather than statement)
• Arrow syntax (->) eliminates fall-through
• Multiple case labels with comma separation
• yield keyword for returning values from blocks
• Exhaustiveness checking for enums (no need for default)

Benefits:
• More readable and concise
• Eliminates common bugs from missing breaks
• Encourages immutability (can assign result to final variable)
• Better pattern matching support (future enhancements)''',
              icon: Icons.switch_right,
            ),
            _buildCodeBlock('''
// Traditional switch statement
int numLetters;
switch (day) {
    case MONDAY:
    case FRIDAY:
    case SUNDAY:
        numLetters = 6;
        break;
    case TUESDAY:
        numLetters = 7;
        break;
    default:
        numLetters = -1;
}

// New switch expression
int numLetters = switch (day) {
    case MONDAY, FRIDAY, SUNDAY -> 6;
    case TUESDAY                -> 7;
    default                     -> -1;
};

// With blocks and yield
int result = switch (mode) {
    case "A" -> 1;
    case "B" -> 2;
    case "C" -> {
        int temp = computeValue();
        yield temp * 2;
    }
    default -> throw new IllegalArgumentException();
};'''),

            _buildSection(
              title: 'Text Blocks',
              content: '''
Java 15 introduced text blocks as a standard feature (previewed in 13 and 14) for multiline string literals.

Characteristics:
• Delimited by triple quotes (""")
• Automatically formats multiline content
• Preserves indentation (using relative indentation)
• Supports escape sequences
• Can concatenate with regular strings

Benefits:
• Improved readability for multiline strings (JSON, HTML, SQL)
• Eliminates need for explicit newline characters
• Better handling of whitespace
• Easier to maintain and modify''',
              icon: Icons.text_fields,
            ),
            _buildCodeBlock('''
// Old style
String html = "<html>\n" +
              "    <body>\n" +
              "        <p>Hello, world</p>\n" +
              "    </body>\n" +
              "</html>\n";

// Text block
String html = """
    <html>
        <body>
            <p>Hello, world</p>
        </body>
    </html>
    """;

// JSON example
String json = """
    {
        "name": "John",
        "age": 30,
        "city": "New York"
    }
    """;

// With interpolation (Java 15+)
String name = "John";
String greeting = """
    Hello, %s!
    Welcome to Java.
    """.formatted(name);'''),

            _buildSection(
              title: 'Records',
              content: '''
Records (Java 16) are transparent carriers for immutable data. They automatically generate:
• Private final fields for each component
• Public read accessor methods
• A public constructor
• equals(), hashCode(), and toString()

Characteristics:
• Compact syntax for data classes
• Immutable by design
• Can implement interfaces
• Can declare static fields and methods
• Can have additional methods and constructors

Limitations:
• Cannot extend other classes
• Cannot declare instance fields outside the record header
• Components are implicitly final''',
              icon: Icons.data_object,
            ),
            _buildCodeBlock('''
// Traditional class equivalent
public final class Point {
    private final int x;
    private final int y;
    
    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    // Getters, equals, hashCode, toString
}

// As a record
public record Point(int x, int y) {}

// Usage
Point p = new Point(10, 20);
System.out.println(p.x());  // Accessor method

// With validation
public record Range(int low, int high) {
    public Range {
        if (low >= high)
            throw new IllegalArgumentException();
    }
    
    public int length() {
        return high - low;
    }
}'''),

            _buildSection(
              title: 'Sealed Classes',
              content: '''
Sealed classes (Java 17) restrict which other classes or interfaces may extend or implement them. This allows for exhaustive pattern matching.

Key Features:
• Declared using sealed keyword
• Permitted subclasses listed with permits
• Subclasses must be final, sealed, or non-sealed
• Enables exhaustive pattern matching checks
• Works with both classes and interfaces

Use Cases:
• Modeling fixed alternatives (like algebraic data types)
• Creating secure class hierarchies
• Enabling compiler-checked pattern matching''',
              icon: Icons.lock,
            ),
          ]
        )
      )
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

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(top: 10, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
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
}