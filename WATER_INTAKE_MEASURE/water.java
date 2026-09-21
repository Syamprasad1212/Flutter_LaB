import 'package:flutter/material.dart';

void main() {
  runApp(const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Water Intake Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  static const double dailyGoal = 2000;

  final TextEditingController waterController = TextEditingController();

  List<double> entries = [];

  double get totalConsumed {
    return entries.fold(0, (sum, amount) => sum + amount);
  }

  double get remaining {
    return (dailyGoal - totalConsumed).clamp(0, dailyGoal);
  }

  double get completionPercentage {
    return ((totalConsumed / dailyGoal) * 100).clamp(0, 100);
  }

  void addWater() {
    String input = waterController.text.trim();

    if (input.isEmpty) {
      showError("Please enter a water amount.");
      return;
    }

    double? amount = double.tryParse(input);

    if (amount == null) {
      showError("Please enter a valid number.");
      return;
    }

    // Prevent zero or negative values
    if (amount <= 0) {
      showError("Water amount must be greater than 0 mL.");
      return;
    }

    setState(() {
      entries.add(amount);
      waterController.clear();
    });
  }

  void showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void resetWater() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Reset Confirmation"),
          content: const Text(
            "Are you sure you want to reset today's water intake?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  entries.clear();
                });

                Navigator.pop(context);
              },
              child: const Text("Reset"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    waterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Water Intake Tracker"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const SizedBox(height: 20),

            // Daily Goal
            const Text(
              "Daily Water Goal",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "2000 mL",
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Input
            TextField(
              controller: waterController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Enter water amount",
                hintText: "Example: 500",
                suffixText: "mL",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Add Water Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addWater,
                child: const Text("Add Water"),
              ),
            ),

            const SizedBox(height: 30),

            // Total Consumed
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.water_drop,
                  color: Colors.blue,
                ),
                title: const Text("Total Consumed"),
                trailing: Text(
                  "${totalConsumed.toInt()} mL",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Remaining
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.hourglass_bottom,
                  color: Colors.orange,
                ),
                title: const Text("Remaining"),
                trailing: Text(
                  "${remaining.toInt()} mL",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Entries
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.format_list_numbered,
                  color: Colors.green,
                ),
                title: const Text("Entries Today"),
                trailing: Text(
                  "${entries.length}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            // Completion
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.percent,
                  color: Colors.purple,
                ),
                title: const Text("Completion"),
                trailing: Text(
                  "${completionPercentage.toInt()}%",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Reset
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: resetWater,
                child: const Text("Reset Today"),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
