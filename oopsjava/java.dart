import 'package:dsa_app/oopsjava/ja.dart';
import 'package:flutter/material.dart';
import 'package:dsa_app/Appdrawer.dart';

class Java extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Java OOPs Concepts', 
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
              _buildHeroSection(),

              // OOPs Introduction
              _buildSection(
                title: 'Object-Oriented Programming',
                content: '''
Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects", which can contain data (attributes) and code (methods). Java is fundamentally object-oriented.

Key Benefits:
• Modularity for easier maintenance
• Reusability through inheritance
• Flexibility via polymorphism
• Effective problem solving through abstraction
• Data security with encapsulation''',
                icon: Icons.code,
              ),

              // Pillars of OOP
            
              SizedBox(height: 10,),
              Text('ALL UINTS OF OOPS WITH JAVA',
              style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),),
              SizedBox(height: 10,),
              const Ja(),
              SizedBox(height: 15,),
                _buildSection(
                title: 'Four Pillars of OOP',
                content: 'Fundamental principles of object-oriented programming:',
                icon: Icons.architecture,
              ),
              _buildPillars(),

              // Classes & Objects
              _buildSection(
                title: 'Classes & Objects',
                content: 'Basic building blocks of Java OOP:',
                icon: Icons.category,
              ),
              _buildClassesObjects(),

              // Inheritance
              _buildSection(
                title: 'Inheritance',
                content: 'Mechanism to create new classes from existing ones:',
                icon: Icons.family_restroom,
              ),
              _buildInheritance(),

              // Polymorphism
              _buildSection(
                title: 'Polymorphism',
                content: 'Ability to take many forms:',
                icon: Icons.transform,
              ),
              _buildPolymorphism(),

              // Abstraction
              _buildSection(
                title: 'Abstraction',
                content: 'Hiding complex implementation details:',
                icon: Icons.visibility_off,
              ),
              _buildAbstraction(),

              // Encapsulation
              _buildSection(
                title: 'Encapsulation',
                content: 'Bundling data with methods that operate on that data:',
                icon: Icons.lock,
              ),
              _buildEncapsulation(),

              // Implementation
              _buildSection(
                title: 'Java OOP Implementation',
                content: 'Complete example demonstrating all concepts:',
                icon: Icons.terminal,
              ),
              _buildCodeBlock('''
// Abstract class (Abstraction)
abstract class Animal {
    // Encapsulated field
    private String name;
    
    // Constructor
    public Animal(String name) {
        this.name = name;
    }
    
    // Abstract method (Abstraction)
    public abstract void makeSound();
    
    // Concrete method
    public void eat() {
        System.out.println(name + " is eating");
    }
    
    // Getter (Encapsulation)
    public String getName() {
        return name;
    }
}

// Inheritance
class Dog extends Animal {
    public Dog(String name) {
        super(name);
    }
    
    // Polymorphism - method overriding
    @Override
    public void makeSound() {
        System.out.println(getName() + " says: Woof!");
    }
    
    // New method specific to Dog
    public void wagTail() {
        System.out.println(getName() + " is wagging tail");
    }
}

// Interface (Another form of Abstraction)
interface Swimmable {
    void swim();
}

class Fish extends Animal implements Swimmable {
    public Fish(String name) {
        super(name);
    }
    
    @Override
    public void makeSound() {
        System.out.println(getName() + " says: Blub blub!");
    }
    
    @Override
    public void swim() {
        System.out.println(getName() + " is swimming");
    }
}

public class Main {
    public static void main(String[] args) {
        // Polymorphism - Animal reference, Dog object
        Animal myDog = new Dog("Buddy");
        myDog.makeSound();  // Output: Buddy says: Woof!
        myDog.eat();        // Output: Buddy is eating
        
        // Downcasting to access Dog-specific method
        if (myDog instanceof Dog) {
            ((Dog)myDog).wagTail();  // Output: Buddy is wagging tail
        }
        
        Fish myFish = new Fish("Nemo");
        myFish.makeSound();  // Output: Nemo says: Blub blub!
        myFish.swim();       // Output: Nemo is swimming
    }
}'''),

              // Best Practices
              _buildSection(
                title: 'OOP Best Practices',
                content: 'Guidelines for effective object-oriented design:',
                icon: Icons.star,
              ),
              _buildBestPractices(),

              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // ============= Helper Methods =============
  Widget _buildHeroSection() {
    return Card(
      color: Colors.blueGrey[900],
      margin: EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.code, color: Colors.orangeAccent, size: 30),
                SizedBox(width: 10),
                Text('Java OOPs Concepts',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
              ],
            ),
            SizedBox(height: 10),
            Text('Object-Oriented Programming in Java with classes, objects, inheritance, polymorphism, abstraction, and encapsulation.',
              style: TextStyle(color: Colors.white70, height: 1.5)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildTag('Classes & Objects'),
                _buildTag('Inheritance'),
                _buildTag('Polymorphism'),
                _buildTag('Abstraction'),
                _buildTag('Encapsulation'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPillars() {
    return Column(
      children: [
        _buildPillarCard(
          'Encapsulation',
          'Bundling data with methods that operate on that data',
          Icons.lock,
          Colors.blue
        ),
        _buildPillarCard(
          'Inheritance',
          'Creating new classes from existing ones',
          Icons.family_restroom,
          Colors.green
        ),
        _buildPillarCard(
          'Polymorphism',
          'Ability to take many forms (method overriding/overloading)',
          Icons.transform,
          Colors.orange
        ),
        _buildPillarCard(
          'Abstraction',
          'Hiding complex implementation details',
          Icons.visibility_off,
          Colors.purple
        ),
      ],
    );
  }

  Widget _buildClassesObjects() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint('Class: Blueprint/template for objects (defines properties and behaviors)'),
          _buildBulletPoint('Object: Instance of a class with state and behavior'),
          _buildBulletPoint('Constructor: Special method to initialize objects'),
          _buildBulletPoint('Example: "Car" class with "color" field and "drive()" method'),
          SizedBox(height: 10),
          _buildCodeBlock('''
// Class definition
class Car {
    String color;  // Field
    
    // Constructor
    Car(String color) {
        this.color = color;
    }
    
    // Method
    void drive() {
        System.out.println(color + " car is driving");
    }
}

// Object creation
Car myCar = new Car("Red");
myCar.drive();  // Output: Red car is driving'''),
        ],
      ),
    );
  }

  Widget _buildInheritance() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint('Allows creating new classes that reuse, extend, and modify existing classes'),
          _buildBulletPoint('Superclass (parent) - Subclass (child) relationship'),
          _buildBulletPoint('"extends" keyword for inheritance'),
          _buildBulletPoint('"super" keyword to refer to parent class'),
          _buildBulletPoint('Types: Single, Multilevel, Hierarchical (Java doesn\'t support Multiple Inheritance directly)'),
          SizedBox(height: 10),
          _buildCodeBlock('''
class Vehicle {  // Superclass
    void run() {
        System.out.println("Vehicle is running");
    }
}

class Bike extends Vehicle {  // Subclass
    @Override
    void run() {
        System.out.println("Bike is running safely");
    }
}

Vehicle obj = new Bike();
obj.run();  // Output: Bike is running safely'''),
        ],
      ),
    );
  }

  Widget _buildPolymorphism() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint('Compile-time (Method Overloading)'),
          _buildBulletPoint('Run-time (Method Overriding)'),
          _buildBulletPoint('Allows one interface with multiple implementations'),
          _buildBulletPoint('Enables "programming to interface" principle'),
          SizedBox(height: 10),
          _buildCodeBlock('''
// Method Overloading (Compile-time)
class Calculator {
    int add(int a, int b) { return a + b; }
    double add(double a, double b) { return a + b; }
}

// Method Overriding (Run-time)
class Animal {
    void sound() { System.out.println("Animal makes sound"); }
}

class Dog extends Animal {
    @Override
    void sound() { System.out.println("Dog barks"); }
}'''),
        ],
      ),
    );
  }

  Widget _buildAbstraction() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint('Achieved through abstract classes and interfaces'),
          _buildBulletPoint('Hides complex implementation details'),
          _buildBulletPoint('Abstract classes can have both abstract and concrete methods'),
          _buildBulletPoint('Interfaces (100% abstraction before Java 8)'),
          _buildBulletPoint('"abstract" keyword for classes/methods'),
          SizedBox(height: 10),
          _buildCodeBlock('''
// Abstract class
abstract class Shape {
    abstract void draw();  // Abstract method
    
    void display() {      // Concrete method
        System.out.println("Displaying shape");
    }
}

// Interface
interface Drawable {
    void draw();  // Abstract by default
}

class Circle extends Shape implements Drawable {
    @Override
    void draw() {
        System.out.println("Drawing circle");
    }
}'''),
        ],
      ),
    );
  }

  Widget _buildEncapsulation() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint('Bundling data (variables) with methods (functions)'),
          _buildBulletPoint('Achieved through access modifiers (private, protected, public)'),
          _buildBulletPoint('Getter/Setter methods for controlled access'),
          _buildBulletPoint('Increases security and prevents accidental modification'),
          SizedBox(height: 10),
          _buildCodeBlock('''
class Account {
    private double balance;  // Private field
    
    // Public getter
    public double getBalance() {
        // Validation can be added
        return balance;
    }
    
    // Public setter
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }
}

Account acc = new Account();
acc.deposit(1000);
System.out.println(acc.getBalance());'''),
        ],
      ),
    );
  }

  Widget _buildBestPractices() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBulletPoint('Favor composition over inheritance'),
          _buildBulletPoint('Program to interfaces, not implementations'),
          _buildBulletPoint('Follow SOLID principles'),
          _buildBulletPoint('Use meaningful class/method names'),
          _buildBulletPoint('Keep classes and methods small and focused'),
          _buildBulletPoint('Minimize mutability (use final where possible)'),
          _buildBulletPoint('Use proper access modifiers'),
        ],
      ),
    );
  }

  Widget _buildPillarCard(String title, String description, IconData icon, Color color) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: TextStyle(color: Colors.white)),
        subtitle: Text(description, style: TextStyle(color: Colors.white70)),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.arrow_right, size: 24, color: Colors.orangeAccent),
          SizedBox(width: 8),
          Expanded(
            child: Text(text,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white70,
              )),
          ),
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
          fontFamily: 'RobotoMono',
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Chip(
      label: Text(text, style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.blueGrey[800],
      shape: StadiumBorder(),
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