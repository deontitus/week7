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
      home: const SocialMediaCard(),
    );
  }
}

class SocialMediaCard extends StatelessWidget {
  const SocialMediaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Media Card"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          width: 350,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                blurRadius: 8,
                color: Colors.grey,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Profile Section
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=3',
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deon Titus",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "2 hours ago",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              // Caption
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Enjoying Flutter layouts! Building beautiful UI using Row, Column, Stack and Positioned widgets.",
                  style: TextStyle(fontSize: 15),
                ),
              ),

              const SizedBox(height: 12),

              // Image + Floating Like Button
              Stack(
                children: [

                  // Image Body
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Floating Like Button
                  Positioned(
                    bottom: 15,
                    right: 15,
                    child: FloatingActionButton(
                      mini: true,
                      backgroundColor: Colors.red,
                      onPressed: () {},
                      child: const Icon(Icons.favorite),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}