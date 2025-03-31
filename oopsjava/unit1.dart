import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Unit1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Unit 1:', 
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

              // Why Java Section
              _buildSection(
                title: 'Why Java?',
                content: '''
Java is one of the most popular programming languages due to its unique features:

Key Advantages:
• Platform Independence (Write Once, Run Anywhere)
• Object-Oriented Programming Language
• Strong Memory Management (Automatic Garbage Collection)
• Rich Standard Library
• Multi-threading Support
• High Performance (JIT Compiler)
• Secure (No explicit pointers, bytecode verification)
• Distributed Computing Capabilities

Major Application Areas:
• Enterprise Applications (Banking, E-commerce)
• Android App Development
• Web Applications
• Scientific Applications
• Big Data Technologies (Hadoop, Spark)
• Embedded Systems''',
                icon: Icons.star,
              ),

              // History of Java
              _buildSection(
                title: 'History of Java',
                content: '''
Java was developed by James Gosling and his team at Sun Microsystems in the early 1990s.

Timeline:
• 1991 - Project "Oak" started for embedded systems
• 1995 - Renamed to "Java" and released publicly
• 1996 - JDK 1.0 released
• 1997 - JDK 1.1 introduced inner classes and JDBC
• 1998 - Java 2 (J2SE 1.2) with Collections Framework
• 2004 - J2SE 5.0 (Generics, Autoboxing, Annotations)
• 2014 - Java 8 (Lambda Expressions, Stream API)
• 2017 - Java 9 (Module System)
• 2020 - Java 15 (Text Blocks, Records)
• 2023 - Java 20 (Virtual Threads, Pattern Matching)

Originally designed for:
• Simple, object-oriented, and familiar
• Robust and secure
• Architecture-neutral and portable
• High performance
• Interpreted, threaded, and dynamic''',
                icon: Icons.history,
              ),

              // JVM Architecture
              _buildSection(
                title: 'Java Virtual Machine (JVM)',
                content: '''
JVM is the engine that drives the Java code execution. It converts Java bytecode into machine language.

Key Components:
1. Class Loader Subsystem:
   • Loading: Reads .class files
   • Linking: Verifies, prepares, resolves
   • Initialization: Executes static blocks

2. Runtime Data Areas:
   • Method Area: Class structures
   • Heap Area: Objects and arrays
   • Stack Area: Thread execution
   • PC Registers: Thread instruction pointers
   • Native Method Stack: Native code

3. Execution Engine:
   • Interpreter: Executes bytecode
   • JIT Compiler: Compiles frequent bytecode to native
   • Garbage Collector: Automatic memory management

4. Native Method Interface (JNI):
   • Interface with native libraries

5. Native Method Libraries:
   • Collection of native libraries''',
                icon: Icons.architecture,
              ),
              Center(
              //  child: Image.asset('assets/jvm_architecture.png', width: 300),
              ),

              // Java Environment
              _buildSection(
                title: 'Java Environment',
                content: '''
Java Development Kit (JDK):
• Complete development environment
• Includes compiler (javac), tools, and JRE

Java Runtime Environment (JRE):
• Implementation of JVM
• Required to run Java programs

Java Virtual Machine (JVM):
• Runtime instance that executes bytecode

Environment Setup:
1. Download and install JDK
2. Set PATH environment variable
3. Verify installation (java -version)
4. Configure IDE (Eclipse, IntelliJ, etc.)

Popular IDEs:
• Eclipse
• IntelliJ IDEA
• NetBeans
• Android Studio''',
                icon: Icons.settings,
              ),

              // Java Source File Structure
              _buildSection(
                title: 'Java Source File Structure',
                content: '''
A typical Java source file has the following structure:

1. Package Declaration (optional):
   package com.example.myapp;

2. Import Statements (optional):
   import java.util.ArrayList;
   import java.io.*;

3. Class Definition (required):
   public class MyClass {
       // Class body
   }

Naming Conventions:
• File name must match public class name
• .java extension
• CamelCase for class names
• lowercase for package names

Example Structure:
// Package
package com.example;

// Imports
import java.util.List;

// Class
public class HelloWorld {
    // Main method
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}''',
                icon: Icons.insert_drive_file,
              ),

              // Compilation Fundamentals
              _buildSection(
                title: 'Compilation Process',
                content: '''
Java uses a two-step compilation process:

1. Compilation to Bytecode:
   • javac HelloWorld.java → HelloWorld.class
   • Platform-independent intermediate code
   • Verified by JVM before execution

2. Execution by JVM:
   • java HelloWorld
   • Class loader loads .class file
   • Bytecode verified
   • Interpreted/JIT compiled to machine code
   • Executed by runtime environment

Just-In-Time (JIT) Compilation:
• Compiles bytecode to native machine code at runtime
• Improves performance of frequently executed code

Java Program Execution Flow:
1. Write .java source file
2. Compile to .class bytecode
3. JVM loads bytecode
4. Bytecode verified
5. Interpreted/JIT compiled
6. Executed by CPU''',
                icon: Icons.build,
              ),
              Center(
              //  child: Image.asset('assets/java_compilation.png', width: 300),
              ),

              // Implementation Example
              _buildSection(
                title: 'Simple Java Program',
                content: 'Basic structure of a Java program:',
                icon: Icons.code,
              ),
              _buildCodeBlock('''
// Package declaration (optional)
package com.example;

// Import statements (optional)
import java.util.Date;

// Class definition (required)
public class HelloWorld {

    // Main method - entry point
    public static void main(String[] args) {
        // Print to console
        System.out.println("Hello, World!");
        System.out.println("Today is: " + new Date());
        
        // Variable declaration
        int number = 10;
        
        // Method call
        printNumber(number);
    }
    
    // Custom method
    public static void printNumber(int num) {
        System.out.println("Number is: " + num);
    }
}'''),

              // Compilation Commands
              _buildSection(
                title: 'Compilation & Execution',
                content: 'How to compile and run Java programs:',
                icon: Icons.terminal,
              ),
              _buildCodeBlock('''
# Compile Java source file
javac HelloWorld.java

# Run the compiled program
java HelloWorld

# With package declaration
javac -d . HelloWorld.java  # Creates package structure
java com.example.HelloWorld'''),

              SizedBox(height: 30),
           
// Add these widgets below the existing content in the Column widget
// After the Compilation Commands section and before the SizedBox(height: 30)

// Programming Structure in Java
_buildSection(
  title: 'Programming Structure in Java',
  content: '''
A typical Java program follows this structure:

1. Documentation Section (Comments)
2. Package Declaration
3. Import Statements
4. Interface/Class Definitions
   - Data Members (Variables)
   - Methods (Functions)
   - Constructors

Example Structure:
/**
 * Documentation comment
 */
package com.example;

import java.util.*;

public class MyClass {
    // Data members
    private int value;
    
    // Constructor
    public MyClass(int val) {
        this.value = val;
    }
    
    // Methods
    public void display() {
        System.out.println("Value: " + value);
    }
    
    // Main method
    public static void main(String[] args) {
        MyClass obj = new MyClass(10);
        obj.display();
    }
}''',
  icon: Icons.article,
),

// Defining Classes
_buildSection(
  title: 'Defining Classes in Java',
  content: '''
Classes are blueprints for objects in Java.

Syntax:
[access-modifier] class ClassName {
    // Fields (variables)
    // Constructors
    // Methods
}

Example:
public class Student {
    // Fields
    private String name;
    private int rollNo;
    
    // Constructor
    public Student(String name, int rollNo) {
        this.name = name;
        this.rollNo = rollNo;
    }
    
    // Method
    public void display() {
        System.out.println("Name: " + name);
        System.out.println("Roll No: " + rollNo);
    }
}''',
  icon: Icons.class_,
),
_buildCodeBlock('''
// Creating objects
Student student1 = new Student("Alice", 101);
student1.display();'''),

// Constructors
_buildSection(
  title: 'Constructors',
  content: '''
Special methods called when an object is instantiated.

Types:
1. Default Constructor (no-args, auto-generated if none defined)
2. Parameterized Constructor
3. Copy Constructor

Example:
public class Book {
    String title;
    String author;
    
    // Default constructor
    public Book() {
        title = "Unknown";
        author = "Unknown";
    }
    
    // Parameterized constructor
    public Book(String t, String a) {
        title = t;
        author = a;
    }
    
    // Copy constructor
    public Book(Book other) {
        title = other.title;
        author = other.author;
    }
}''',
  icon: Icons.build_circle,
),
_buildCodeBlock('''
Book book1 = new Book();  // Default
Book book2 = new Book("Java", "Author");  // Parameterized
Book book3 = new Book(book2);  // Copy'''),

// Methods
_buildSection(
  title: 'Methods',
  content: '''
Methods define behaviors of a class.

Syntax:
[access-modifier] [static] return-type methodName(parameters) {
    // method body
}

Example:
public class Calculator {
    // Instance method
    public int add(int a, int b) {
        return a + b;
    }
    
    // Static method
    public static double multiply(double x, double y) {
        return x * y;
    }
    
    // Method overloading
    public int add(int a, int b, int c) {
        return a + b + c;
    }
}''',
  icon: Icons.functions,
),
_buildCodeBlock('''
Calculator calc = new Calculator();
int sum = calc.add(5, 3);
double product = Calculator.multiply(4.5, 2.0);'''),

// Access Specifiers
_buildSection(
  title: 'Access Specifiers',
  content: '''
Control visibility of classes, methods, and variables:

1. public - Accessible everywhere
2. protected - Accessible within package and subclasses
3. default (no modifier) - Accessible within package
4. private - Accessible only within class

Example:
public class AccessExample {
    public int publicVar;
    protected int protectedVar;
    int defaultVar;
    private int privateVar;
    
    public void publicMethod() {}
    protected void protectedMethod() {}
    void defaultMethod() {}
    private void privateMethod() {}
}''',
  icon: Icons.security,
),

// Static Members
_buildSection(
  title: 'Static Members',
  content: '''
Belong to the class rather than instances.

Key Points:
• Shared by all instances
• Can be accessed without object creation
• Static methods can only access static members

Example:
public class Counter {
    static int count = 0;  // Static variable
    
    public Counter() {
        count++;
    }
    
    public static void displayCount() {  // Static method
        System.out.println("Total count: " + count);
    }
}''',
  icon: Icons.storage,
),
_buildCodeBlock('''
Counter c1 = new Counter();
Counter c2 = new Counter();
Counter.displayCount();  // Output: Total count: 2'''),

// Final Members
_buildSection(
  title: 'Final Members',
  content: '''
Once assigned cannot be changed.

Applications:
• final variables - Constants
• final methods - Cannot be overridden
• final classes - Cannot be inherited

Example:
public class Constants {
    // Final variable (constant)
    public static final double PI = 3.14159;
    
    // Final method
    public final void display() {
        System.out.println("This cannot be overridden");
    }
}

final class ImmutableClass {  // Cannot be extended
    // class implementation
}''',
  icon: Icons.lock_outline,
),
_buildCodeBlock('''
System.out.println(Constants.PI);
// Constants.PI = 3.14;  // Error: cannot assign final variable'''),

// Comments
_buildSection(
  title: 'Comments',
  content: '''
Used for documentation and code explanation.

Types:
1. Single-line: //
2. Multi-line: /* */
3. Documentation: /** */

Example:
/**
 * This class demonstrates comments
 */
public class CommentDemo {
    /* This is a
       multi-line comment */
    public static void main(String[] args) {
        // Single-line comment
        System.out.println("Comments example");
    }
}''',
  icon: Icons.comment,
),

// Data Types
_buildSection(
  title: 'Data Types',
  content: '''
Java has two data type categories:

Primitive Types:
• byte (8-bit), short (16-bit), int (32-bit), long (64-bit)
• float (32-bit), double (64-bit)
• char (16-bit Unicode), boolean (true/false)

Reference Types:
• Classes, Interfaces, Arrays

Example:
public class DataTypes {
    public static void main(String[] args) {
        // Primitive types
        int age = 25;
        double salary = 50000.50;
        char grade = 'A';
        boolean isJavaFun = true;
        
        // Reference types
        String name = "John Doe";
        int[] numbers = {1, 2, 3};
    }
}''',
  icon: Icons.data_object,
),

// Variables
_buildSection(
  title: 'Variables',
  content: '''
Named memory locations to store data.

Types:
1. Local variables (declared in methods)
2. Instance variables (declared in class, outside methods)
3. Static variables (declared with static keyword)

Example:
public class VariableDemo {
    static int staticVar;  // Class variable
    int instanceVar;       // Instance variable
    
    public void demoMethod() {
        int localVar = 10; // Local variable
        System.out.println(localVar);
    }
}''',
  icon: Icons.circle,
),
_buildCodeBlock('''
VariableDemo.staticVar = 5;  // Access static variable
VariableDemo obj = new VariableDemo();
obj.instanceVar = 10;        // Access instance variable'''),

// Operators
_buildSection(
  title: 'Operators',
  content: '''
Special symbols that perform operations:

Types:
1. Arithmetic: +, -, *, /, %, ++, --
2. Relational: ==, !=, >, <, >=, <=
3. Logical: &&, ||, !
4. Assignment: =, +=, -=, *=, /=
5. Bitwise: &, |, ^, ~, <<, >>, >>>
6. Ternary: ?:

Example:
public class Operators {
    public static void main(String[] args) {
        int a = 10, b = 20;
        int sum = a + b;       // Arithmetic
        boolean result = (a < b); // Relational
        boolean flag = (a > 5) && (b < 30); // Logical
        a += 5;                // Assignment
        int max = (a > b) ? a : b; // Ternary
    }
}''',
  icon: Icons.calculate,
),

// Control Flow
_buildSection(
  title: 'Control Flow',
  content: '''
Statements that control program execution:

1. Decision Making:
   • if, if-else, if-else-if ladder
   • switch-case

2. Looping:
   • for, while, do-while
   • enhanced for (for-each)

3. Jump Statements:
   • break, continue, return

Example:
public class ControlFlow {
    public static void main(String[] args) {
        // If-else
        int marks = 75;
        if (marks >= 90) {
            System.out.println("A grade");
        } else if (marks >= 80) {
            System.out.println("B grade");
        } else {
            System.out.println("C grade");
        }
        
        // Switch
        char grade = 'B';
        switch (grade) {
            case 'A': System.out.println("Excellent"); break;
            case 'B': System.out.println("Good"); break;
            default: System.out.println("Invalid");
        }
        
        // For loop
        for (int i = 1; i <= 5; i++) {
            System.out.println(i);
        }
        
        // While loop
        int j = 1;
        while (j <= 5) {
            System.out.println(j);
            j++;
        }
    }
}''',
  icon: Icons.loop,
),

// Arrays
_buildSection(
  title: 'Arrays',
  content: '''
Containers that hold fixed number of values of same type.

Features:
• Fixed size
• Zero-based indexing
• Can be multi-dimensional

Example:
public class ArrayDemo {
    public static void main(String[] args) {
        // 1D array
        int[] numbers = {10, 20, 30};
        
        // 2D array
        int[][] matrix = {{1, 2}, {3, 4}};
        
        // Accessing elements
        System.out.println(numbers[0]);  // 10
        System.out.println(matrix[1][0]); // 3
        
        // Looping through array
        for (int num : numbers) {
            System.out.println(num);
        }
    }
}''',
  icon: Icons.view_array,
),

// Strings
_buildSection(
  title: 'Strings',
  content: '''
Sequence of characters implemented as objects.

Key Features:
• Immutable (cannot be changed after creation)
• String pool for memory efficiency
• Methods for manipulation

Example:
public class StringDemo {
    public static void main(String[] args) {
        // String creation
        String s1 = "Hello";  // String literal
        String s2 = new String("World");  // Using new
        
        // Concatenation
        String s3 = s1 + " " + s2;
        
        // Methods
        System.out.println(s3.length());  // 11
        System.out.println(s3.substring(0, 5));  // Hello
        System.out.println(s3.indexOf("World"));  // 6
        
        // StringBuilder (mutable)
        StringBuilder sb = new StringBuilder();
        sb.append("Java");
        sb.append(" is");
        sb.append(" awesome");
        System.out.println(sb.toString());
    }
}''',
  icon: Icons.text_fields,
),
// Add these widgets to your existing Column children list

// Object-Oriented Programming Overview
_buildSection(
  title: 'Object-Oriented Programming',
  content: '''
Object-Oriented Programming (OOP) is a paradigm based on the concept of "objects" that contain both data (attributes) and behavior (methods). Java implements OOP through four main principles:

1. Encapsulation: Bundling data with methods that operate on that data
2. Inheritance: Creating new classes from existing ones
3. Polymorphism: Ability to take many forms
4. Abstraction: Hiding complex implementation details

Benefits of OOP:
• Modular structure for programs
• Reusable code through inheritance
• Easier maintenance and modification
• Better organization of complex systems
• Real-world modeling capability''',
  icon: Icons.code,
),

// Classes and Objects
_buildSection(
  title: 'Classes and Objects',
  content: '''
Class: 
- Blueprint/template for creating objects
- Defines properties (fields) and behaviors (methods)
- Logical entity that doesn't occupy memory

Object:
- Instance of a class
- Physical entity that occupies memory
- Has state (values of attributes) and behavior (methods)

Real-world analogy:
Class = Car design (template)
Object = Actual car (instance)

Example:
// Class definition
class Car {
    // Fields (state)
    String color;
    String model;
    double speed;
    
    // Constructor
    Car(String color, String model) {
        this.color = color;
        this.model = model;
        this.speed = 0.0;
    }
    
    // Methods (behavior)
    void accelerate(double increment) {
        speed += increment;
    }
    
    void displayDetails() {
        System.out.println("Model: " + model);
        System.out.println("Color: " + color);
        System.out.println("Speed: " + speed);
    }
}

// Creating objects
Car myCar = new Car("Red", "Toyota");
Car yourCar = new Car("Blue", "Honda");

myCar.accelerate(20.5);
yourCar.accelerate(15.0);

myCar.displayDetails();
yourCar.displayDetails();''',
  icon: Icons.class_,
),

// Inheritance
_buildSection(
  title: 'Inheritance',
  content: '''
Inheritance allows a new class (subclass) to acquire properties and behaviors of an existing class (superclass).

Key Terms:
- Superclass (Parent/Base class): Class being inherited from
- Subclass (Child/Derived class): Class that inherits
- "extends" keyword establishes inheritance

Benefits:
• Code reusability
• Method overriding (runtime polymorphism)
• Class hierarchy organization

Types:
1. Single Inheritance (1 parent → 1 child)
2. Multilevel Inheritance (grandparent → parent → child)
3. Hierarchical Inheritance (1 parent → multiple children)
4. Multiple Inheritance (not directly supported in Java, achieved via interfaces)

Example:
// Superclass
class Animal {
    String name;
    
    public Animal(String name) {
        this.name = name;
    }
    
    public void eat() {
        System.out.println(name + " is eating");
    }
    
    public void sleep() {
        System.out.println(name + " is sleeping");
    }
}

// Subclass
class Dog extends Animal {
    String breed;
    
    public Dog(String name, String breed) {
        super(name);  // Call superclass constructor
        this.breed = breed;
    }
    
    // Additional method specific to Dog
    public void bark() {
        System.out.println(name + " is barking");
    }
    
    // Method overriding
    @Override
    public void eat() {
        System.out.println(name + " the dog is eating dog food");
    }
}

// Usage
Dog myDog = new Dog("Buddy", "Golden Retriever");
myDog.eat();    // Calls overridden method
myDog.sleep();  // Inherited from Animal
myDog.bark();   // Dog-specific method''',
  icon: Icons.family_restroom,
),

// Superclass and Subclass
_buildSection(
  title: 'Superclass & Subclass',
  content: '''
Superclass (Parent Class):
- General class containing common features
- More reusable and generic
- Also called base or parent class

Subclass (Child Class):
- Specialized version of superclass
- Inherits all non-private members
- Can add new fields/methods
- Can override superclass methods
- Also called derived or child class

Key Points:
• Subclass can access superclass members using 'super' keyword
• Constructor chaining: subclass constructor must call superclass constructor
• Private members are inherited but not directly accessible
• final classes cannot be extended

Example:
// Superclass
class Employee {
    private String name;
    protected double salary;  // Accessible to subclasses
    
    public Employee(String name, double salary) {
        this.name = name;
        this.salary = salary;
    }
    
    public void displayDetails() {
        System.out.println("Name: " + name);
        System.out.println("Salary: " + salary);
    }
}

// Subclass
class Manager extends Employee {
    private String department;
    
    public Manager(String name, double salary, String dept) {
        super(name, salary);  // Must call superclass constructor
        this.department = dept;
    }
    
    @Override
    public void displayDetails() {
        super.displayDetails();  // Call superclass method
        System.out.println("Department: " + department);
    }
    
    public void manageTeam() {
        System.out.println("Managing " + department + " department");
    }
}

// Usage
Manager mgr = new Manager("Alice", 75000, "Engineering");
mgr.displayDetails();  // Calls overridden method
mgr.manageTeam();      // Subclass-specific method''',
  icon: Icons.account_tree,
),

// Method Overriding
_buildSection(
  title: 'Method Overriding',
  content: '''
Method overriding occurs when a subclass provides a specific implementation for a method already defined in its superclass.

Rules:
1. Method must have same name and parameters as superclass method
2. Return type should be same or covariant (subclass of return type)
3. Access modifier cannot be more restrictive
4. Cannot override final, static or private methods
5. Use @Override annotation for better readability

Key Points:
• Runtime polymorphism (dynamic method dispatch)
• Actual method called is determined at runtime based on object type
• Superclass method can be called using super.methodName()

Example:
class Shape {
    public void draw() {
        System.out.println("Drawing a shape");
    }
    
    public double calculateArea() {
        return 0.0;
    }
}

class Circle extends Shape {
    private double radius;
    
    public Circle(double radius) {
        this.radius = radius;
    }
    
    @Override
    public void draw() {
        System.out.println("Drawing a circle with radius " + radius);
    }
    
    @Override
    public double calculateArea() {
        return Math.PI * radius * radius;
    }
}

class Square extends Shape {
    private double side;
    
    public Square(double side) {
        this.side = side;
    }
    
    @Override
    public void draw() {
        System.out.println("Drawing a square with side " + side);
    }
    
    @Override
    public double calculateArea() {
        return side * side;
    }
}

// Runtime polymorphism example
Shape myShape = new Circle(5.0);
myShape.draw();  // Calls Circle's draw() method
System.out.println("Area: " + myShape.calculateArea());

myShape = new Square(4.0);
myShape.draw();  // Calls Square's draw() method
System.out.println("Area: " + myShape.calculateArea());''',
  icon: Icons.swap_horiz,
),

// Method Overloading
_buildSection(
  title: 'Method Overloading',
  content: '''
Method overloading allows multiple methods with same name but different parameters in the same class.

Rules:
1. Methods must have same name
2. Methods must have different parameter lists (type, number, or order)
3. Return type can be same or different
4. Access modifier can be different

Key Points:
• Compile-time polymorphism (static binding)
• Increases readability (same operation with different inputs)
• Also called static polymorphism

Example:
class Calculator {
    // Add two integers
    public int add(int a, int b) {
        return a + b;
    }
    
    // Add three integers
    public int add(int a, int b, int c) {
        return a + b + c;
    }
    
    // Add two doubles
    public double add(double a, double b) {
        return a + b;
    }
    
    // Concatenate two strings
    public String add(String a, String b) {
        return a + b;
    }
}

// Usage
Calculator calc = new Calculator();
System.out.println(calc.add(5, 3));        // 8
System.out.println(calc.add(2.5, 3.7));    // 6.2
System.out.println(calc.add("Hello", " World")); // "Hello World"''',
  icon: Icons.functions,
),

// Overriding vs Overloading Comparison
_buildSection(
  title: 'Overriding vs Overloading',
  content: '''
Key Differences:

| Feature        | Overriding                          | Overloading                     |
|----------------|-------------------------------------|---------------------------------|
| Definition     | Same method in parent and child     | Same name, different parameters |
| Inheritance    | Requires inheritance                | Within same class               |
| Parameters     | Must be same                        | Must be different               |
| Return Type    | Must be same or covariant           | Can be different                |
| Polymorphism   | Runtime (dynamic)                   | Compile-time (static)           |
| Binding        | Late binding (at runtime)           | Early binding (at compile time) |
| Access Modifier| Cannot be more restrictive          | Can be different                |
| Purpose        | Change behavior                     | Increase readability            |

When to use:
• Overriding - When you need different behavior in subclass
• Overloading - When you need same operation with different parameters''',
  icon: Icons.compare,
),
// Add these widgets to your existing Column children list

// Packages
_buildSection(
  title: 'Packages in Java',
  content: '''
Packages are containers for classes that prevent naming conflicts and control access.

Key Benefits:
• Prevents naming conflicts
• Provides better organization
• Allows access protection
• Enables reusable components

Package Naming Conventions:
• Use lowercase letters
• Use reverse domain name as prefix (com.example.mypackage)
• Use meaningful names for functionality
• Avoid Java/Sun reserved names''',
  icon: Icons.folder,
),

// Defining Packages
_buildSection(
  title: 'Defining Packages',
  content: '''
To create a package:
1. First statement in Java file must be package declaration
2. Directory structure must match package hierarchy
3. Compile with -d option to create proper directory structure

Example:
// File: com/example/util/Calculator.java
package com.example.util;

public class Calculator {
    public static int add(int a, int b) {
        return a + b;
    }
}

Compilation:
javac -d . Calculator.java  // Creates com/example/util/Calculator.class

Execution:
java com.example.util.Calculator''',
  icon: Icons.create_new_folder,
),
_buildCodeBlock('''
// Directory structure:
project/
└── com/
    └── example/
        └── util/
            ├── Calculator.java
            └── Calculator.class'''),

// Classpath Setting
_buildSection(
  title: 'Classpath Setting for Packages',
  content: '''
Classpath tells JVM where to look for classes and packages.

Setting Classpath:
1. Using -classpath or -cp option:
   java -classpath /path/to/classes com.example.Main
   
2. Setting CLASSPATH environment variable:
   export CLASSPATH=/path/to/classes
   
3. Using wildcard for JAR files:
   java -classpath "/lib/*" com.example.Main

Important Notes:
• . (current directory) is in default classpath
• Multiple paths separated by : (Unix) or ; (Windows)
• Classpath order matters (first match is used)''',
  icon: Icons.settings,
),
_buildCodeBlock('''
# Linux/Mac
export CLASSPATH=/home/user/project:/home/user/lib/mylib.jar

# Windows
set CLASSPATH=C:\project;C:\lib\mylib.jar

# Running with classpath
java -cp bin:lib/* com.example.Main'''),

// Making JAR Files
_buildSection(
  title: 'Creating JAR Files',
  content: '''
JAR (Java Archive) files package classes and resources into a single file.

Creating JAR:
1. Compile classes with package structure
2. Create manifest file (optional)
3. Run jar command

Basic JAR:
jar cvf mylibrary.jar com/

Executable JAR:
1. Create manifest.txt with Main-Class header:
   Main-Class: com.example.Main
2. Create JAR:
   jar cvfm app.jar manifest.txt com/

Using JAR:
• Add to classpath: java -cp mylibrary.jar com.example.Main
• Run executable JAR: java -jar app.jar''',
  icon: Icons.archive,
),
_buildCodeBlock('''
# Create a simple JAR
jar cvf utils.jar com/example/util/*.class

# Create executable JAR with manifest
echo "Main-Class: com.example.Main" > manifest.txt
jar cvfm app.jar manifest.txt com/example/*.class

# View JAR contents
jar tf utils.jar

# Extract JAR
jar xvf utils.jar'''),

// Import Statements
_buildSection(
  title: 'Import Statements',
  content: '''
Import statements allow using classes from other packages without full qualification.

Types:
1. Specific class import:
   import java.util.ArrayList;
   
2. Whole package import:
   import java.util.*;
   
3. Static import (since Java 5):
   import static java.lang.Math.PI;
   import static java.lang.Math.*;

Rules:
• Must appear after package declaration
• Before class declaration
• Can import from same package without explicit import
• java.lang package is automatically imported

Example:
package com.example.app;

import java.util.ArrayList;
import java.util.List;
import static java.lang.Math.PI;

public class Main {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        double circleArea = PI * 10 * 10;
    }
}''',
  icon: Icons.import_export,
),

// Static Import
_buildSection(
  title: 'Static Import',
  content: '''
Static import allows using static members (fields/methods) without class qualification.

Benefits:
• Makes code more readable
• Reduces typing for frequently used static members
• Useful for constants and utility methods

Examples:
// Without static import
double area = Math.PI * Math.pow(radius, 2);

// With static import
import static java.lang.Math.PI;
import static java.lang.Math.pow;

double area = PI * pow(radius, 2);

When to use:
• For frequently used constants (like PI)
• For utility class methods (like Collections.sort)
• When improves code readability

When to avoid:
• When causes naming conflicts
• For rarely used static members
• When reduces code clarity''',
  icon: Icons.input,
),
_buildCodeBlock('''
import static java.lang.System.out;
import static java.util.Collections.sort;

public class Main {
    public static void main(String[] args) {
        out.println("Hello");  // Instead of System.out
        
        List<String> names = new ArrayList<>();
        sort(names);           // Instead of Collections.sort
    }
}'''),

// Naming Conventions
_buildSection(
  title: 'Package Naming Conventions',
  content: '''
Standard Java Package Naming Conventions:

1. Use lowercase letters exclusively
   com.example.mypackage (correct)
   com.example.MyPackage (incorrect)

2. Use reverse domain name as prefix
   com.company.project.module

3. Avoid using Java/Sun reserved names
   java.myproject (incorrect)
   com.mycompany.javaext (correct)

4. Use meaningful names for functionality
   com.company.accounting
   org.project.utils

5. Single words preferred, use underscores only when necessary
   com.example.image_processing

Common Prefixes:
• com - Commercial organizations
• org - Non-profit organizations
• edu - Educational institutions
• gov - Government agencies
• net - Network organizations

Example Valid Names:
• com.google.gson
• org.apache.commons.io
• edu.harvard.cs.lib
• gov.nasa.jpl.orbit''',
  icon: Icons.text_format,
),
 ],
          ),
        ),
      ),
    );
  }
// Helper Methods (Add these to your existing helper methods)
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
  // ============= Helper Methods =============
 