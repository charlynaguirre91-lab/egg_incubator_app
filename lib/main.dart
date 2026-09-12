import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

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
  final SupabaseClient supabase = Supabase.instance.client;
  
  List<Map<String, dynamic>> presets = [];
  bool isLoading = true;
  String selectedPresetInfo = "No preset selected";

  @override
  void initState() {
    super.initState();
    fetchPresets();
  }

  Future<void> fetchPresets() async {
    try {
      final response = await supabase.from('incubator_presets').select();
      setState(() {
        presets = List<Map<String, dynamic>>.from(response);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        selectedPresetInfo = "Error loading presets: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Egg Incubator Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Egg Type Preset:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: presets.length,
                      itemBuilder: (context, index) {
                        final preset = presets[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              preset['egg_type'] ?? 'Unknown',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Temp: ${preset['target_temperature']}°C | Humidity: ${preset['target_humidity']}% | Days: ${preset['incubation_days']} Days',
                            ),
                            trailing: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  selectedPresetInfo =
                                      "Active Preset: ${preset['egg_type']} (${preset['target_temperature']}°C, ${preset['target_humidity']}%, ${preset['incubation_days']} Days)";
                                });
                              },
                              child: const Text('Select'),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 30),
                  Center(
                    child: Text(
                      selectedPresetInfo,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.deepOrange),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}