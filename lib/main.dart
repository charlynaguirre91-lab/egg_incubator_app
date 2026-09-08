import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egg Incubator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const IncubatorHomePage(),
    );
  }
}

class IncubatorHomePage extends StatefulWidget {
  const IncubatorHomePage({super.key});

  @override
  State<IncubatorHomePage> createState() => _IncubatorHomePageState();
}

class _IncubatorHomePageState extends State<IncubatorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egg Incubator Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Incubator Control Panel Ready',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}