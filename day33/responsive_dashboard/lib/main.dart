import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {

    // Screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          // Tablet Layout
          if (constraints.maxWidth > 700) {
            return Row(
              children: [

                // Sidebar
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.dashboard, size: 40, color: Colors.white),
                        SizedBox(height: 20),
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Main Content
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey.shade200,
                    child: GridView.count(
                      padding: const EdgeInsets.all(16),
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: List.generate(
                        6,
                        (index) => dashboardCard(index),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          // Mobile Layout
          return Column(
            children: [

              // Top Banner
              Container(
                width: screenWidth,
                padding: const EdgeInsets.all(20),
                color: Colors.blueGrey,
                child: const Center(
                  child: Text(
                    "Dashboard Menu",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              // Main Content
              Expanded(
                child: Container(
                  color: Colors.grey.shade200,
                  child: GridView.count(
                    padding: const EdgeInsets.all(16),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: List.generate(
                      6,
                      (index) => dashboardCard(index),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget dashboardCard(int index) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          "Card ${index + 1}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}