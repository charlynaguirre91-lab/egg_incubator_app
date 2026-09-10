import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load the environment variables from .env
  await dotenv.load(fileName: ".env");

  // Initialize Supabase client
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

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
          'Supabase Connected Successfully!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}