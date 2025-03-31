import 'package:dsa_app/Appdrawer.dart';
import 'package:flutter/material.dart';

class Unit5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 215, 79, 38),
        title: Text('Unit 5:Spring Framework', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 22)),
      ),
      endDrawer: AppDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              title: 'Spring Framework Introduction',
              content: '''
The Spring Framework is a comprehensive programming and configuration model for modern Java-based enterprise applications. It provides infrastructure support for developing robust applications easily.

Key Features:
• Dependency Injection (DI) - Fundamental principle throughout Spring
• Aspect-Oriented Programming (AOP) - Separating cross-cutting concerns
• Template pattern - Simplifies JDBC, JMS, JPA and other technologies
• Transaction management - Consistent model across different APIs
• MVC framework - Powerful web framework
• Testing support - First-class support for testing

Benefits:
• Lightweight container
• Loose coupling through DI/IoC
• Declarative programming
• Boilerplate reduction
• Easy integration with other frameworks''',
              icon: Icons.architecture,
            ),

            _buildSection(
              title: 'Spring Core Basics',
              content: '''
The Spring Core container is the fundamental module providing the IoC container. Key components:

1. Beans: Objects managed by Spring container
2. Configuration Metadata: How container should create/configure beans
3. ApplicationContext: Spring container implementation

Core Packages:
• org.springframework.beans
• org.springframework.context
• org.springframework.core

Typical Workflow:
1. Define beans (POJOs)
2. Configure beans (XML/Java/Annotations)
3. Create ApplicationContext
4. Get beans from container''',
              icon: Icons.build,
            ),

            _buildSection(
              title: 'Spring Dependency Injection',
              content: '''
Dependency Injection (DI) is a design pattern where objects define their dependencies (other objects they work with) through constructor arguments or properties set after construction.

Types of DI in Spring:
1. Constructor Injection (Recommended)
   • Dependencies provided through constructor
   • Ensures immutable objects
   • Better for mandatory dependencies

2. Setter Injection
   • Dependencies provided through setter methods
   • More flexible for optional dependencies

3. Field Injection (Using @Autowired)
   • Direct field injection with reflection
   • Discouraged (harder to test)''',
              icon: Icons.input,
            ),
            _buildCodeBlock('''
// Constructor Injection Example
public class UserService {
    private final UserRepository userRepo;
    
    @Autowired
    public UserService(UserRepository userRepo) {
        this.userRepo = userRepo;
    }
}

// Setter Injection Example
public class PaymentService {
    private PaymentProcessor processor;
    
    @Autowired
    public void setProcessor(PaymentProcessor processor) {
        this.processor = processor;
    }
}

// Field Injection (Not recommended)
public class ProductService {
    @Autowired
    private ProductRepository productRepo;
}'''),

            _buildSection(
              title: 'Spring Inversion of Control',
              content: '''
Inversion of Control (IoC) is a principle where the control of object creation and binding is transferred from application code to the framework.

Key Concepts:
• Traditional approach: Objects create their dependencies
• IoC approach: Container creates and manages dependencies
• Application becomes passive (receives dependencies)
• Framework calls application code

Spring IoC Container:
• BeanFactory: Basic container
• ApplicationContext: Advanced container with more features
• Responsible for:
  - Instantiating beans
  - Configuring beans
  - Assembling dependencies
  - Managing life cycle''',
              icon: Icons.compare_arrows,
            ),

            _buildSection(
              title: 'Aspect-Oriented Programming (AOP)',
              content: '''
AOP provides a way to modularize cross-cutting concerns (logging, security, transactions) that cut across multiple types and objects.

AOP Concepts:
1. Aspect: Modularization of concern (logging aspect)
2. Join Point: Point in execution (method execution)
3. Advice: Action taken at join point (before, after, around)
4. Pointcut: Predicate matching join points
5. Target: Object being advised
6. Weaving: Linking aspects with other objects

Spring AOP:
• Proxy-based (uses JDK dynamic proxies or CGLIB)
• Only method execution join points
• Works with Spring beans only''',
              icon: Icons.polyline,
            ),
            _buildCodeBlock('''
// Aspect Example
@Aspect
@Component
public class LoggingAspect {
    
    @Before("execution(* com.example.service.*.*(..))")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("Before: " + joinPoint.getSignature());
    }
    
    @AfterReturning(
        pointcut="execution(* com.example.service.*.*(..))",
        returning="result")
    public void logAfterReturning(JoinPoint joinPoint, Object result) {
        System.out.println("After returning: " + result);
    }
}'''),

            _buildSection(
              title: 'Bean Scopes',
              content: '''
Spring defines several bean scopes that determine the lifecycle and visibility of beans:

1. Singleton (Default)
   • Single instance per container
   • Shared for all requests
   • Stateless beans typically

2. Prototype
   • New instance for each request
   • Stateful beans typically

3. Request (Web-aware)
   • Single instance per HTTP request
   • Only valid in web-aware context

4. Session (Web-aware)
   • Single instance per HTTP session
   • User-specific state

5. Application (Web-aware)
   • Single instance per ServletContext
   • Similar to singleton but for servlet context

6. WebSocket (Web-aware)
   • Single instance per WebSocket session''',
              icon: Icons.copy,
            ),
            _buildCodeBlock('''
// Scope Configuration Examples
@Component
@Scope("prototype")
public class ShoppingCart {
    // Prototype-scoped bean
}

@Configuration
public class AppConfig {
    @Bean
    @Scope(WebApplicationContext.SCOPE_SESSION)
    public UserPreferences userPreferences() {
        return new UserPreferences();
    }
}'''),

            _buildSection(
              title: 'Auto-wiring',
              content: '''
Spring can automatically wire relationships between collaborating beans by inspecting the ApplicationContext.

Auto-wiring Modes:
1. no (Default) - No auto-wiring, must define explicitly
2. byName - Looks for bean with same name as property
3. byType - Looks for bean of matching type
4. constructor - Like byType but for constructor args
5. autodetect - Chooses constructor or byType

@Autowired Annotation:
• Can be used on constructors, setters, fields
• Required by default (can set required=false)
• Works with @Qualifier for disambiguation

Best Practices:
• Prefer constructor injection
• Use @Qualifier for multiple implementations
• Avoid field injection for testability''',
              icon: Icons.cable,
            ),
            _buildCodeBlock('''
// Auto-wiring Examples
@Service
public class OrderService {
    private final PaymentProcessor processor;
    
    @Autowired
    public OrderService(PaymentProcessor processor) {
        this.processor = processor;
    }
}

@Component
public class EmailService {
    @Autowired
    @Qualifier("smtpSender")
    private MailSender mailSender;
}'''),

            _buildSection(
              title: 'Spring Annotations',
              content: '''
Spring provides numerous annotations to simplify configuration:

Core Stereotypes:
• @Component - Generic stereotype
• @Service - Business service layer
• @Repository - Data access layer
• @Controller - Web controller layer

Dependency Injection:
• @Autowired - Auto-wires dependencies
• @Qualifier - Specifies which bean to wire
• @Value - Injects values from properties

Configuration:
• @Configuration - Marks config class
• @Bean - Defines a bean method
• @ComponentScan - Configures scanning
• @PropertySource - Adds property source

AOP:
• @Aspect - Marks aspect class
• @Before, @After, etc. - Advice types''',
              icon: Icons.edit,
            ),

            _buildSection(
              title: 'Bean Lifecycle Callbacks',
              content: '''
Spring provides several ways to hook into bean lifecycle:

Initialization Callbacks:
1. InitializingBean interface (afterPropertiesSet())
2. @PostConstruct annotation
3. init-method attribute (XML or @Bean)

Destruction Callbacks:
1. DisposableBean interface (destroy())
2. @PreDestroy annotation
3. destroy-method attribute (XML or @Bean)

Lifecycle Phases:
1. Instantiation
2. Population of properties
3. Pre-initialization (BeanPostProcessor)
4. Initialization
5. Post-initialization (BeanPostProcessor)
6. Destruction''',
              icon: Icons.loop,
            ),
            _buildCodeBlock('''
// Lifecycle Example
@Component
public class DatabaseInitializer {
    @PostConstruct
    public void init() {
        // Initialize database
    }
    
    @PreDestroy
    public void cleanup() {
        // Release resources
    }
}

@Configuration
public class AppConfig {
    @Bean(initMethod = "start", destroyMethod = "stop")
    public Server server() {
        return new Server();
    }
}'''),

            _buildSection(
              title: 'Bean Configuration Styles',
              content: '''
Spring offers multiple ways to configure beans:

1. XML Configuration (Traditional)
   • beans.xml file
   • <bean> definitions
   • Verbose but explicit

2. Annotation-based Configuration
   • @Component, @Service, etc.
   • @Autowired for DI
   • Needs component scanning

3. Java-based Configuration
   • @Configuration classes
   • @Bean methods
   • Type-safe and refactorable

4. Groovy Configuration
   • DSL-style configuration
   • Less common than others

Best Practices:
• Use Java config for infrastructure
• Use annotations for application classes
• Mix approaches as needed''',
              icon: Icons.settings,
            ),
            _buildCodeBlock('''
// XML Configuration Example
<!-- beans.xml -->
<beans>
    <bean id="userService" class="com.example.UserService">
        <constructor-arg ref="userRepository"/>
    </bean>
</beans>

// Java Configuration Example
@Configuration
@ComponentScan("com.example")
public class AppConfig {
    @Bean
    public DataSource dataSource() {
        return new EmbeddedDatabaseBuilder()
            .setType(EmbeddedDatabaseType.H2)
            .build();
    }
}'''),

            _buildSection(
              title: 'Spring Boot Build Systems',
              content: '''
Spring Boot supports two main build systems:

1. Maven:
   • Uses pom.xml for configuration
   • Extensive plugin ecosystem
   • Declarative configuration
   • Advantages:
     - Standard in Java ecosystem
     - Good IDE support
     - Well-known dependency management

2. Gradle:
   • Uses build.gradle (Groovy/Kotlin DSL)
   • More flexible than Maven
   • Faster incremental builds
   • Advantages:
     - Concise configuration
     - Better performance
     - Advanced customization

Key Dependencies:
• spring-boot-starter-parent (Maven)
• spring-boot-gradle-plugin (Gradle)
• Starter dependencies (spring-boot-starter-web, etc.)''',
              icon: Icons.build,
            ),
            _buildCodeBlock('''
<!-- Maven pom.xml example -->
<parent>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-starter-parent</artifactId>
    <version>2.7.0</version>
</parent>

<dependencies>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
</dependencies>

// Gradle build.gradle example
plugins {
    id 'org.springframework.boot' version '2.7.0'
    id 'io.spring.dependency-management' version '1.0.11.RELEASE'
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter-web'
}'''),

            _buildSection(
              title: 'Spring Boot Code Structure',
              content: '''
Recommended Spring Boot project structure:

src/
├── main/
│   ├── java/
│   │   └── com/example/
│   │       ├── Application.java          # Main class
│   │       ├── controller/              # Controllers
│   │       ├── service/                 # Business logic
│   │       ├── repository/              # Data access
│   │       └── model/                   # Domain objects
│   └── resources/
│       ├── static/                      # Static content
│       ├── templates/                   # Template files
│       ├── application.properties       # Configuration
│       └── application.yml              # Alternative config
└── test/                                # Test code

Key Principles:
• Package by feature, not by layer
• Keep main application class in root package
• Follow standard Maven/Gradle layout
• Separate configuration from business logic

Advantages:
• Clear separation of concerns
• Better maintainability
• Easier testing
• Standardized across projects''',
              icon: Icons.folder,
            ),

            _buildSection(
              title: 'Spring Boot Runners',
              content: '''
Spring Boot provides two main interfaces to run code at startup:

1. CommandLineRunner:
   • Runs after application context is loaded
   • Access to raw command line arguments
   • Multiple runners can be ordered with @Order

2. ApplicationRunner:
   • Similar to CommandLineRunner
   • Provides ApplicationArguments for more sophisticated argument parsing

Use Cases:
• Data initialization
• Scheduled tasks setup
• System verification
• Warm-up caches

Advantages:
• Simple way to execute code at startup
• Integrated with Spring lifecycle
• Can access all Spring beans''',
              icon: Icons.play_arrow,
            ),
            _buildCodeBlock('''
@Component
@Order(1)
public class DatabaseInitializer implements CommandLineRunner {
    
    @Override
    public void run(String... args) throws Exception {
        // Initialize database
    }
}

@Component
public class CacheWarmup implements ApplicationRunner {
    
    @Override
    public void run(ApplicationArguments args) throws Exception {
        // Warm up caches
    }
}'''),

            _buildSection(
              title: 'Logging in Spring Boot',
              content: '''
Spring Boot uses SLF4J with Logback as the default logging implementation.

Key Features:
• Simple configuration via application.properties
• Multiple log levels (TRACE, DEBUG, INFO, WARN, ERROR)
• File and console logging
• Log groups
• Profile-specific logging

Configuration Properties:
• logging.level.<package>=<level>
• logging.file.name=myapp.log
• logging.pattern.console=%d{yyyy-MM-dd HH:mm:ss} %-5level %logger{36} - %msg%n

Best Practices:
• Use appropriate log levels
• Include contextual information
• Avoid expensive operations in logging
• Use parameterized logging''',
              icon: Icons.article,
            ),
            _buildCodeBlock('''
// Typical logger usage
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
public class MyController {
    private static final Logger logger = LoggerFactory.getLogger(MyController.class);
    
    @GetMapping("/")
    public String home() {
        logger.debug("Home endpoint accessed");
        return "Hello World";
    }
}

# application.properties example
logging.level.root=WARN
logging.level.com.example=DEBUG
logging.file.name=application.log
logging.pattern.console=%d{yyyy-MM-dd} %highlight(%-5level) %cyan(%logger{36}) - %msg%n'''),

            _buildSection(
              title: 'Building RESTful Web Services',
              content: '''
Spring Boot makes it easy to create RESTful web services using Spring MVC.

Key Components:
1. @RestController: Combines @Controller and @ResponseBody
2. Request Mapping Annotations: @GetMapping, @PostMapping etc.
3. ResponseEntity: For complete response control
4. Exception Handling: @ControllerAdvice, @ExceptionHandler

Advantages:
• Automatic JSON serialization
• Built-in error handling
• Content negotiation
• HATEOAS support
• Easy testing

Best Practices:
• Use proper HTTP methods
• Return appropriate status codes
• Document your API (Swagger/OpenAPI)
• Validate inputs
• Handle exceptions gracefully''',
              icon: Icons.cloud,
            ),
            _buildCodeBlock('''
@RestController
@RequestMapping("/api/products")
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @GetMapping
    public List<Product> getAllProducts() {
        return productService.findAll();
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Product> getProduct(@PathVariable Long id) {
        return productService.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<Product> createProduct(@RequestBody Product product) {
        Product saved = productService.save(product);
        return ResponseEntity.created(URI.create("/products/" + saved.getId()))
                            .body(saved);
    }
}'''),

            _buildSection(
              title: 'REST Controller & Request Mapping',
              content: '''
@RestController is a specialized version of @Controller that automatically adds @ResponseBody to all methods.

Request Mapping Annotations:
• @RequestMapping: General purpose mapping
• @GetMapping: GET requests
• @PostMapping: POST requests
• @PutMapping: PUT requests
• @DeleteMapping: DELETE requests
• @PatchMapping: PATCH requests

Mapping Options:
• path/value: URL path
• method: HTTP method
• params: Request parameters
• headers: Request headers
• consumes: Request content type
• produces: Response content type

Advantages:
• Clear mapping of HTTP methods
• Reduced boilerplate
• Type-safe return values
• Automatic content negotiation''',
              icon: Icons.api,
            ),
            _buildCodeBlock('''
@RestController
@RequestMapping("/api/users")
public class UserController {
    
    @GetMapping
    public List<User> getAllUsers() { /* ... */ }
    
    @GetMapping("/search")
    public List<User> searchUsers(@RequestParam String name) { /* ... */ }
    
    @PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<User> createUser(@RequestBody User user) { /* ... */ }
    
    @PutMapping("/{id}")
    public User updateUser(@PathVariable Long id, @RequestBody User user) { /* ... */ }
    
    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) { /* ... */ }
}'''),

            _buildSection(
              title: 'Request Body & Path Variables',
              content: '''
@RequestBody:
• Binds HTTP request body to a method parameter
• Typically used with POST/PUT requests
• Supports content negotiation
• Automatically converts JSON/XML to objects

@PathVariable:
• Extracts values from URI template variables
• Useful for resource identifiers
• Can specify name and required status
• Supports type conversion

@RequestParam:
• Binds query parameters to method parameters
• Optional/default values supported
• Can be required or optional
• Supports arrays/lists''',
              icon: Icons.input,
            ),
            _buildCodeBlock('''
@PostMapping("/orders")
public ResponseEntity<Order> createOrder(
        @RequestBody OrderRequest request,
        @RequestParam(required = false, defaultValue = "false") boolean validate) {
    if (validate) {
        // Validate order
    }
    Order order = orderService.create(request);
    return ResponseEntity.created(URI.create("/orders/" + order.getId()))
                        .body(order);
}

@GetMapping("/products/{category}/{id}")
public Product getProduct(
        @PathVariable String category,
        @PathVariable Long id) {
    return productService.findByCategoryAndId(category, id);
}'''),

            _buildSection(
              title: 'HTTP Methods (GET, POST, PUT, DELETE)',
              content: '''
Standard HTTP Methods in REST:

GET:
• Retrieve resources
• Should be idempotent
• No request body (usually)
• Returns 200 (OK) or 404 (Not Found)

POST:
• Create new resources
• Non-idempotent
• Includes request body
• Returns 201 (Created) with Location header

PUT:
• Update existing resources
• Idempotent
• Includes request body
• Returns 200 (OK) or 204 (No Content)

DELETE:
• Remove resources
• Idempotent
• No request body
• Returns 200 (OK) or 204 (No Content)

Best Practices:
• Use proper status codes
• Follow REST conventions
• Document your API
• Support content negotiation''',
              icon: Icons.http,
            ),
            _buildCodeBlock('''
@RestController
@RequestMapping("/api/books")
public class BookController {
    
    @GetMapping
    public List<Book> getAllBooks() { /* ... */ }
    
    @PostMapping
    public ResponseEntity<Book> addBook(@RequestBody Book book) { /* ... */ }
    
    @PutMapping("/{id}")
    public Book updateBook(@PathVariable Long id, @RequestBody Book book) { /* ... */ }
    
    @DeleteMapping("/{id}")
    public void deleteBook(@PathVariable Long id) { /* ... */ }
}'''),

            _buildSection(
              title: 'Building Web Applications',
              content: '''
Spring Boot supports traditional server-rendered web applications using:

1. Spring MVC:
   • @Controller (not @RestController)
   • View templates (Thymeleaf, FreeMarker, JSP)
   • Model attributes
   • Form handling

2. Thymeleaf (Recommended):
   • Natural templates (HTML)
   • Good Spring integration
   • Expression language

3. Static Resources:
   • Served from /static or /public
   • Automatic caching headers
   • Versioned resource URLs

Configuration Properties:
• spring.mvc.view.prefix=/templates/
• spring.mvc.view.suffix=.html
• spring.resources.static-locations=classpath:/static/

Advantages:
• Rapid development
• Auto-configured defaults
• Embedded server support
• Easy to add REST endpoints''',
              icon: Icons.web,
            ),
            _buildCodeBlock('''
@Controller
@RequestMapping("/products")
public class ProductWebController {
    
    @GetMapping
    public String listProducts(Model model) {
        model.addAttribute("products", productService.findAll());
        return "products/list";
    }
    
    @GetMapping("/{id}")
    public String viewProduct(@PathVariable Long id, Model model) {
        model.addAttribute("product", productService.findById(id));
        return "products/view";
    }
}

<!-- Thymeleaf template example (products/list.html) -->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Products</h1>
    <ul>
        <li th:each="product : ">
            <a th:href="@{/products/{id}()}" 
               th:text">Product Name</a>
        </li>
    </ul>
</body>
</html>'''),

            _buildSection(
              title: 'Application Properties',
              content: '''
Spring Boot uses application.properties or application.yml for configuration:

Common Properties:
• Server: server.port, server.servlet.context-path
• Datasource: spring.datasource.url, username, password
• JPA: spring.jpa.show-sql, hibernate.ddl-auto
• Logging: logging.level.root, logging.file.name
• MVC: spring.mvc.view.prefix, spring.resources.cache.period

Profile-specific Properties:
• application-{profile}.properties
• Activated with spring.profiles.active

YAML Advantages:
• Hierarchical configuration
• Less verbose
• Supports complex types
• Better for multi-line values

Property Sources:
1. application.properties in classpath
2. Command line arguments
3. Environment variables
4. @PropertySource annotations''',
              icon: Icons.settings,
            ),
            _buildCodeBlock('''
# application.properties example
server.port=8081
spring.datasource.url=jdbc:mysql://localhost:3306/mydb
spring.datasource.username=root
spring.datasource.password=secret
spring.jpa.show-sql=true
logging.level.org.springframework=INFO

# application.yml equivalent
server:
  port: 8081
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/mydb
    username: root
    password: secret
  jpa:
    show-sql: true
logging:
  level:
    org.springframework: INFO'''),
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
        borderRadius: BorderRadius.circular(10)),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SelectableText(
          code,
          style: TextStyle(
            fontFamily: 'RobotoMono',
            fontSize: 13,color: Colors.white
          ),
        ),
      ),
    );
  }
}