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
      title: 'Contact List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, String>> contacts = const [
    {"name": "Arjun", "phone": "9876543210"},
    {"name": "Albin", "phone": "9876501234"},
    {"name": "Deepak", "phone": "9123456780"},
    {"name": "Adithya", "phone": "9988776655"},
    {"name": "Akshay", "phone": "9871234567"},
    {"name": "Deepak", "phone": "9090909090"},
    {"name": "Deon", "phone": "9012345678"},
    {"name": "Ajith", "phone": "9345678901"},
  ];

  final List<String> categories = const [
    "Family",
    "Friends",
    "Work",
    "College",
    "Emergency",
    "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        contacts[index]["name"]![0],
                      ),
                    ),
                    title: Text(contacts[index]["name"]!),
                    subtitle: Text(contacts[index]["phone"]!),
                    trailing: const Icon(Icons.call),
                  ),
                );
              },
              childCount: contacts.length,
            ),
          ),
        ],
      ),
    );
  }
}