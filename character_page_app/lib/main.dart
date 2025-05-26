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
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: Character(),
    );
  }
}

class Character extends StatelessWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        title: const Text(
          "BBANTO ID CARD",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'images/Boundary_logo_1.png',
                width: 220,
                height: 150,
              ),
            ),
            Divider(
              height: 40,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              thickness: 1,
            ),
            const Text(
              'Name',
              style: TextStyle(color: Colors.black, letterSpacing: 2.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              'BBANTO',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              'BBANTO POWER LEVEL',
              style: TextStyle(color: Colors.black, letterSpacing: 2.0),
            ),
            const SizedBox(height: 10.0),
            const Text(
              '10',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
                Text(
                  'Using lightsaber',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
                Text(
                  'Hero face tatoo',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
                Text(
                  'Fire flames',
                  style: TextStyle(fontSize: 16.0, letterSpacing: 1.0),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage('images/Boundary_logo_11-removebg-preview.png'),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
