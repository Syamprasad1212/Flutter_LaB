import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// -------------------- MAIN APP --------------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Service App",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

// -------------------- HOME PAGE --------------------

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home,
              size: 80,
              color: Colors.indigo,
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome Home",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Explore our services and give us your feedback.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- DRAWER MENU --------------------

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Icon(
                  Icons.apps,
                  color: Colors.white,
                  size: 45,
                ),
                SizedBox(height: 10),
                Text(
                  "My App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          // Home
          ListTile(
            leading: const Icon(Icons.home, color: Colors.indigo),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
          ),

          // Services
          ListTile(
            leading: const Icon(
              Icons.miscellaneous_services,
              color: Colors.indigo,
            ),
            title: const Text("Services"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ServicesPage(),
                ),
              );
            },
          ),

          // Feedback
          ListTile(
            leading: const Icon(
              Icons.feedback,
              color: Colors.indigo,
            ),
            title: const Text("Feedback"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FeedbackPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// -------------------- SERVICES PAGE --------------------

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Our Services",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Service 1
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.web,
                  color: Colors.indigo,
                  size: 35,
                ),
                title: const Text(
                  "Web Development",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Modern and responsive websites.",
                ),
              ),
            ),

            // Service 2
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  color: Colors.indigo,
                  size: 35,
                ),
                title: const Text(
                  "Mobile App Development",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Android and Flutter applications.",
                ),
              ),
            ),

            // Service 3
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.cloud,
                  color: Colors.indigo,
                  size: 35,
                ),
                title: const Text(
                  "Cloud Services",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Reliable cloud-based solutions.",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------- FEEDBACK PAGE --------------------

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  // Controller for TextField
  TextEditingController feedbackController = TextEditingController();

  String message = "";

  // Submit function
  void submitFeedback() {
    String feedback = feedbackController.text;

    print("Feedback: $feedback");

    setState(() {
      message = "Feedback Submitted";
    });
  }

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Give Your Feedback",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "We would love to hear from you!",
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Feedback TextField
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Enter your feedback...",
                prefixIcon: const Icon(Icons.feedback),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  "Submit Feedback",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // Success Message
            Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
