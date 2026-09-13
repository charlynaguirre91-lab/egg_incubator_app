import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ──────────────────────────────────────────────
// App Entry Point
// ──────────────────────────────────────────────

void main() {
  runApp(const SmartHatchApp());
}

// ──────────────────────────────────────────────
// Root Widget
// ──────────────────────────────────────────────

class SmartHatchApp extends StatelessWidget {
  const SmartHatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE8752A),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F6FA),
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const LandingPage(),
    );
  }
}

// ══════════════════════════════════════════════
// MOCK DATA
// ══════════════════════════════════════════════

class SpeciesData {
  final String name;
  final String emoji;
  final int incubationDays;
  final String temperature;
  final String description;

  const SpeciesData({
    required this.name,
    required this.emoji,
    required this.incubationDays,
    required this.temperature,
    required this.description,
  });
}

const List<SpeciesData> speciesList = [
  SpeciesData(
    name: 'Chicken',
    emoji: '🐔',
    incubationDays: 21,
    temperature: '37.5°C',
    description:
        'Chicken eggs typically require 21 days of incubation. Maintain a steady temperature of 37.5°C and humidity around 50-55%. Turn the eggs regularly for best results.',
  ),
  SpeciesData(
    name: 'Duck',
    emoji: '🦆',
    incubationDays: 28,
    temperature: '37.5°C',
    description:
        'Duck eggs need about 28 days to hatch. Keep the temperature at 37.5°C with higher humidity (60-65%) compared to chicken eggs. Increase humidity in the last 3 days.',
  ),
  SpeciesData(
    name: 'Quail',
    emoji: '🥚',
    incubationDays: 17,
    temperature: '37.5°C',
    description:
        'Quail eggs hatch in about 17-18 days. Maintain 37.5°C with 55-60% humidity. Quail eggs are small and require careful handling during incubation.',
  ),
];

class BatchData {
  final String batchNumber;
  final String species;
  final String startDate;
  final String endDate;
  final int eggsTotal;
  final int eggsHatched;
  final String temperature;
  final String status;
  final bool isSuccess;

  const BatchData({
    required this.batchNumber,
    required this.species,
    required this.startDate,
    required this.endDate,
    required this.eggsTotal,
    required this.eggsHatched,
    required this.temperature,
    required this.status,
    required this.isSuccess,
  });
}

final List<BatchData> sampleBatches = [
  const BatchData(
    batchNumber: 'Batch #23',
    species: 'Chicken',
    startDate: '2026-04-10',
    endDate: '2026-05-01',
    eggsTotal: 20,
    eggsHatched: 18,
    temperature: '37.5°C',
    status: 'Completed',
    isSuccess: true,
  ),
  const BatchData(
    batchNumber: 'Batch #22',
    species: 'Duck',
    startDate: '2026-03-01',
    endDate: '2026-03-29',
    eggsTotal: 15,
    eggsHatched: 12,
    temperature: '37.5°C',
    status: 'Completed',
    isSuccess: true,
  ),
  const BatchData(
    batchNumber: 'Batch #21',
    species: 'Quail',
    startDate: '2026-02-10',
    endDate: '2026-02-27',
    eggsTotal: 45,
    eggsHatched: 40,
    temperature: '37.5°C',
    status: 'Completed',
    isSuccess: true,
  ),
];

// ══════════════════════════════════════════════
// LANDING PAGE
// ══════════════════════════════════════════════

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'SmartHatch',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE8752A),
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8752A).withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.egg_outlined,
                    size: 72,
                    color: Color(0xFFE8752A),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Smarter Hatching,\nBetter Results.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'SmartHatch helps you monitor and manage\nyour egg incubation with ease.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 44),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainNavigation(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8752A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignInScreen(),
                      ),
                    );
                  },
                  child: Text.rich(
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Sign in',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE8752A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// SIGN IN SCREEN
// ══════════════════════════════════════════════

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Welcome back!')),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const MainNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8752A).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person_outline,
                  size: 40,
                  color: Color(0xFFE8752A),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Sign in to your SmartHatch account',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'juan@example.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE8752A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Back to Landing Page',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// BOTTOM NAVIGATION HOST
// ══════════════════════════════════════════════

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SpeciesScreen(),
    HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE8752A).withValues(alpha: 0.15),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: Color(0xFFE8752A)),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.egg_outlined),
            selectedIcon: Icon(Icons.egg, color: Color(0xFFE8752A)),
            label: 'Species',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history, color: Color(0xFFE8752A)),
            label: 'History',
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════
// HOME SCREEN
// ══════════════════════════════════════════════

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _HomeHeader(
              onProfileTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 24),
            const _SectionLabel(text: 'OVERVIEW'),
            const SizedBox(height: 10),
            _OverviewCards(
              onTotalBatchesTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                );
              },
              onBestSuccessTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                );
              },
              onTopSpeciesTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SpeciesScreen()),
                );
              },
            ),
            const SizedBox(height: 24),
            const _SectionLabel(text: 'LAST BATCH'),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BatchDetailsScreen(batch: sampleBatches[0]),
                  ),
                );
              },
              child: const _LastBatchCard(),
            ),
            const SizedBox(height: 24),
            const _SectionLabel(text: 'ACTIONS'),
            const SizedBox(height: 10),
            _StartIncubationCTA(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const IncubationSetupScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// SPECIES SCREEN
// ══════════════════════════════════════════════

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Select Species',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Choose the type of egg you want to incubate',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            ...speciesList.map(
              (species) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _SpeciesCard(
                  name: species.name,
                  description: '${species.incubationDays} days incubation period',
                  emoji: species.emoji,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SpeciesDetailsScreen(species: species),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// SPECIES DETAILS SCREEN
// ══════════════════════════════════════════════

class SpeciesDetailsScreen extends StatelessWidget {
  final SpeciesData species;
  const SpeciesDetailsScreen({super.key, required this.species});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(species.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8752A).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(species.emoji, style: const TextStyle(fontSize: 52)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              species.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            _InfoRow(
              icon: Icons.calendar_today,
              label: 'Incubation Period',
              value: '${species.incubationDays} days',
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.thermostat,
              label: 'Temperature',
              value: species.temperature,
            ),
            const SizedBox(height: 20),
            const _SectionLabel(text: 'DESCRIPTION'),
            const SizedBox(height: 8),
            Text(
              species.description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          IncubationSetupScreen(selectedSpecies: species),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8752A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// INCUBATION SETUP (Step 1 & 2)
// ══════════════════════════════════════════════

class IncubationSetupScreen extends StatefulWidget {
  final SpeciesData? selectedSpecies;
  const IncubationSetupScreen({super.key, this.selectedSpecies});

  @override
  State<IncubationSetupScreen> createState() => _IncubationSetupScreenState();
}

class _IncubationSetupScreenState extends State<IncubationSetupScreen> {
  SpeciesData? _selectedSpecies;
  final _eggController = TextEditingController(text: '20');
  int _currentStep = 1;

  @override
  void initState() {
    super.initState();
    _selectedSpecies = widget.selectedSpecies;
    if (_selectedSpecies != null) _currentStep = 2;
  }

  @override
  void dispose() {
    _eggController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Incubation')),
      body: _currentStep == 1 ? _buildStep1() : _buildStep2(),
    );
  }

  Widget _buildStep1() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepIndicator(1, 3),
          const SizedBox(height: 20),
          const Text(
            'Select Species',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Choose the type of egg to incubate',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 20),
          ...speciesList.map(
            (species) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _SpeciesCard(
                name: species.name,
                description: '${species.incubationDays} days',
                emoji: species.emoji,
                onTap: () {
                  setState(() {
                    _selectedSpecies = species;
                    _currentStep = 2;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStepIndicator(2, 3),
          const SizedBox(height: 20),
          const Text(
            'Enter Number of Eggs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'How many ${_selectedSpecies?.name.toLowerCase() ?? 'eggs'} will you incubate?',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Row(
              children: [
                Text(
                  _selectedSpecies?.emoji ?? '🥚',
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _selectedSpecies?.name ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${_selectedSpecies?.incubationDays ?? 0} days • ${_selectedSpecies?.temperature ?? ''}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _eggController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Number of Eggs',
              hintText: 'e.g. 20',
              prefixIcon: const Icon(Icons.egg_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                final eggs = int.tryParse(_eggController.text);
                if (eggs == null || eggs <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid number of eggs')),
                  );
                  return;
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => IncubationChecklistScreen(
                      species: _selectedSpecies!,
                      eggCount: eggs,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE8752A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepIndicator(int current, int total) {
    return Row(
      children: List.generate(total, (index) {
        final isActive = index < current;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index < total - 1 ? 8 : 0),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFFE8752A)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

// ══════════════════════════════════════════════
// INCUBATION CHECKLIST (Step 3)
// ══════════════════════════════════════════════

class IncubationChecklistScreen extends StatefulWidget {
  final SpeciesData species;
  final int eggCount;
  const IncubationChecklistScreen({
    super.key,
    required this.species,
    required this.eggCount,
  });

  @override
  State<IncubationChecklistScreen> createState() =>
      _IncubationChecklistScreenState();
}

class _IncubationChecklistScreenState extends State<IncubationChecklistScreen> {
  final List<String> _checklistItems = [
    'Eggs are clean and suitable',
    'Incubator is clean',
    'Temperature is stable',
    'Water/humidity level is checked',
    'Eggs are properly positioned',
  ];
  final List<bool> _checked = [false, false, false, false, false];

  bool get _allChecked => _checked.every((c) => c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Incubation Checklist')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepIndicator(3, 3),
            const SizedBox(height: 20),
            const Text(
              'Pre-Incubation Checklist',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Confirm all items before starting',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(widget.species.emoji, style: const TextStyle(fontSize: 28)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.species.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${widget.eggCount} eggs • ${widget.species.incubationDays} days',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(_checklistItems.length, (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: CheckboxListTile(
                  value: _checked[index],
                  onChanged: (val) {
                    setState(() {
                      _checked[index] = val ?? false;
                    });
                  },
                  title: Text(
                    _checklistItems[index],
                    style: const TextStyle(fontSize: 14),
                  ),
                  activeColor: const Color(0xFFE8752A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _allChecked
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => IncubationStartedScreen(
                              species: widget.species,
                              eggCount: widget.eggCount,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8752A),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey.shade300,
                  disabledForegroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: _allChecked ? 2 : 0,
                ),
                child: const Text(
                  'Start Incubation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int current, int total) {
    return Row(
      children: List.generate(total, (index) {
        final isActive = index < current;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(right: index < total - 1 ? 8 : 0),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFFE8752A)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}

// ══════════════════════════════════════════════
// INCUBATION STARTED SCREEN
// ══════════════════════════════════════════════

class IncubationStartedScreen extends StatelessWidget {
  final SpeciesData species;
  final int eggCount;
  const IncubationStartedScreen({
    super.key,
    required this.species,
    required this.eggCount,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hatchDate = now.add(Duration(days: species.incubationDays));
    final batchNum = 'Batch #${sampleBatches.length + 24}';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFF4CAF50),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 56,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Incubation Started!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your eggs are now incubating',
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _DetailRow(label: 'Batch', value: batchNum),
                      const SizedBox(height: 12),
                      _DetailRow(
                          label: 'Species',
                          value: '${species.emoji} ${species.name}'),
                      const SizedBox(height: 12),
                      _DetailRow(label: 'Eggs', value: '$eggCount'),
                      const SizedBox(height: 12),
                      _DetailRow(
                          label: 'Start Date',
                          value:
                              '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}'),
                      const SizedBox(height: 12),
                      _DetailRow(
                          label: 'Expected Hatch',
                          value:
                              '${hatchDate.year}-${hatchDate.month.toString().padLeft(2, '0')}-${hatchDate.day.toString().padLeft(2, '0')}'),
                      const SizedBox(height: 12),
                      _DetailRow(
                          label: 'Temperature',
                          value: species.temperature),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainNavigation(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE8752A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Back to Dashboard',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ActiveIncubationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'View Incubation',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE8752A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// ACTIVE INCUBATION SCREEN
// ══════════════════════════════════════════════

class ActiveIncubationScreen extends StatelessWidget {
  const ActiveIncubationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const currentDay = 14;
    const totalDays = 21;
    const progress = currentDay / totalDays;

    return Scaffold(
      appBar: AppBar(title: const Text('Active Incubation')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFE8752A), Color(0xFFF5A623)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFE8752A).withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Chicken',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Batch #24',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Day $currentDay of $totalDays',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white.withValues(alpha: 0.3),
                      color: Colors.white,
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const _SectionLabel(text: 'INCUBATION DETAILS'),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: const Column(
                children: [
                  _DetailRow(label: 'Status', value: 'In Progress'),
                  SizedBox(height: 12),
                  _DetailRow(label: 'Number of Eggs', value: '20'),
                  SizedBox(height: 12),
                  _DetailRow(label: 'Temperature', value: '37.5°C'),
                  SizedBox(height: 12),
                  _DetailRow(label: 'Humidity', value: '55%'),
                  SizedBox(height: 12),
                  _DetailRow(label: 'Start Date', value: '2026-04-10'),
                  SizedBox(height: 12),
                  _DetailRow(label: 'Expected Hatch', value: '2026-05-01'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const _SectionLabel(text: 'CONTROLS'),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _ActionGridCard(
                    icon: Icons.thermostat_outlined,
                    label: 'Temperature',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Temperature monitoring will be available in a future version.'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionGridCard(
                    icon: Icons.refresh,
                    label: 'Turn Eggs',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Egg turning will be available in a future version.'),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionGridCard(
                    icon: Icons.water_drop_outlined,
                    label: 'Humidity',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Humidity control will be available in a future version.'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainNavigation(),
                    ),
                    (route) => false,
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE8752A),
                  side: const BorderSide(color: Color(0xFFE8752A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Back to Dashboard',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const HistoryScreen(),
                    ),
                  );
                },
                child: const Text(
                  'View History',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE8752A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// HISTORY SCREEN
// ══════════════════════════════════════════════

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'History',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Previous incubation batches',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            ...sampleBatches.map(
              (batch) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BatchDetailsScreen(batch: batch),
                      ),
                    );
                  },
                  child: _HistoryBatchCard(
                    species: batch.species,
                    startDate: batch.startDate,
                    endDate: batch.endDate,
                    eggsTotal: batch.eggsTotal,
                    eggsHatched: batch.eggsHatched,
                    status: batch.status,
                    isSuccess: batch.isSuccess,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// BATCH DETAILS SCREEN
// ══════════════════════════════════════════════

class BatchDetailsScreen extends StatelessWidget {
  final BatchData batch;
  const BatchDetailsScreen({super.key, required this.batch});

  @override
  Widget build(BuildContext context) {
    final hatchRate =
        batch.eggsTotal > 0 ? batch.eggsHatched / batch.eggsTotal : 0.0;
    final speciesData = speciesList.firstWhere(
      (s) => s.name == batch.species,
      orElse: () => speciesList[0],
    );

    return Scaffold(
      appBar: AppBar(title: Text(batch.batchNumber)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8752A).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child:
                      Text(speciesData.emoji, style: const TextStyle(fontSize: 44)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                batch.batchNumber,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: Text(
                '${batch.species} • ${batch.status}',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade100),
              ),
              child: Column(
                children: [
                  _DetailRow(label: 'Species', value: batch.species),
                  const SizedBox(height: 12),
                  _DetailRow(label: 'Start Date', value: batch.startDate),
                  const SizedBox(height: 12),
                  _DetailRow(label: 'Hatch Date', value: batch.endDate),
                  const SizedBox(height: 12),
                  _DetailRow(label: 'Total Eggs', value: '${batch.eggsTotal}'),
                  const SizedBox(height: 12),
                  _DetailRow(
                      label: 'Hatched', value: '${batch.eggsHatched}'),
                  const SizedBox(height: 12),
                  _DetailRow(
                    label: 'Success Rate',
                    value: '${(hatchRate * 100).toStringAsFixed(0)}%',
                  ),
                  const SizedBox(height: 12),
                  _DetailRow(label: 'Temperature', value: batch.temperature),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: hatchRate,
                backgroundColor: Colors.grey.shade200,
                color: const Color(0xFFE8752A),
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFFE8752A),
                  side: const BorderSide(color: Color(0xFFE8752A)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Back',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// PROFILE SCREEN
// ══════════════════════════════════════════════

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Center(
                child: CircleAvatar(
                  radius: 48,
                  backgroundColor: Color(0xFFE8752A),
                  child: Icon(Icons.person, size: 56, color: Colors.white),
                ),
              ),
              const SizedBox(height: 12),
              const Center(
                child: Text(
                  'Juan Dela Cruz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'juan@example.com',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 24),
              const _SectionLabel(text: 'ACCOUNT'),
              const SizedBox(height: 10),
              _ProfileOption(
                icon: Icons.edit_outlined,
                title: 'Edit Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
              _ProfileOption(
                icon: Icons.person_outline,
                title: 'Account',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AccountSettingsScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const _SectionLabel(text: 'SETTINGS'),
              const SizedBox(height: 10),
              _ProfileOption(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPlaceholderScreen(
                        title: 'Notifications',
                      ),
                    ),
                  );
                },
              ),
              _ProfileOption(
                icon: Icons.thermostat_outlined,
                title: 'Temperature Unit',
                subtitle: 'Celsius',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPlaceholderScreen(
                        title: 'Temperature Unit',
                      ),
                    ),
                  );
                },
              ),
              _ProfileOption(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPlaceholderScreen(
                        title: 'Language',
                      ),
                    ),
                  );
                },
              ),
              _ProfileOption(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SettingsPlaceholderScreen(
                        title: 'Dark Mode',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              const _SectionLabel(text: 'ABOUT'),
              const SizedBox(height: 10),
              _ProfileOption(
                icon: Icons.info_outline,
                title: 'App Version',
                subtitle: '1.0.0',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SmartHatch v1.0.0')),
                  );
                },
              ),
              _ProfileOption(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Help & Support will be available in a future version.'),
                    ),
                  );
                },
              ),
              _ProfileOption(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Privacy Policy will be available in a future version.'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const LandingPage(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.logout, size: 20),
                  label: const Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFE53935),
                    side: const BorderSide(color: Color(0xFFE53935)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// EDIT PROFILE SCREEN
// ══════════════════════════════════════════════

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Center(
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFE8752A),
                child: Icon(Icons.person, size: 56, color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Photo upload will be available in a future version.'),
                  ),
                );
              },
              child: const Text(
                'Change Photo',
                style: TextStyle(color: Color(0xFFE8752A)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                hintText: 'Juan Dela Cruz',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'juan@example.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone',
                hintText: '+63 912 345 6789',
                prefixIcon: const Icon(Icons.phone_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Profile updated!')),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE8752A),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// ACCOUNT SETTINGS SCREEN
// ══════════════════════════════════════════════

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionLabel(text: 'ACCOUNT INFORMATION'),
            const SizedBox(height: 10),
            _ProfileOption(
              icon: Icons.person_outline,
              title: 'Name',
              subtitle: 'Juan Dela Cruz',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Name editing will be available in a future version.'),
                  ),
                );
              },
            ),
            _ProfileOption(
              icon: Icons.email_outlined,
              title: 'Email',
              subtitle: 'juan@example.com',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Email editing will be available in a future version.'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            const _SectionLabel(text: 'DATA'),
            const SizedBox(height: 10),
            _ProfileOption(
              icon: Icons.cloud_upload_outlined,
              title: 'Backup Data',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Cloud backup will be available in a future version.'),
                  ),
                );
              },
            ),
            _ProfileOption(
              icon: Icons.cloud_download_outlined,
              title: 'Restore Data',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data restore will be available in a future version.'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// SETTINGS PLACEHOLDER SCREEN
// ══════════════════════════════════════════════

class SettingsPlaceholderScreen extends StatelessWidget {
  final String title;
  const SettingsPlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.construction, size: 64, color: Colors.grey.shade400),
              const SizedBox(height: 24),
              Text(
                '$title settings will be\navailable in a future version.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFE8752A),
                    side: const BorderSide(color: Color(0xFFE8752A)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
// REUSABLE WIDGETS
// ══════════════════════════════════════════════

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade500,
        letterSpacing: 1.0,
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  final VoidCallback onProfileTap;
  const _HomeHeader({required this.onProfileTap});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final months = [
      '', 'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final dateStr = '${days[now.weekday - 1]}, ${months[now.month]} ${now.day}';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SmartHatch',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                dateStr,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.person_outline,
              size: 22,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class _OverviewCards extends StatelessWidget {
  final VoidCallback onTotalBatchesTap;
  final VoidCallback onBestSuccessTap;
  final VoidCallback onTopSpeciesTap;

  const _OverviewCards({
    required this.onTotalBatchesTap,
    required this.onBestSuccessTap,
    required this.onTopSpeciesTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTotalBatchesTap,
            child: const _OverviewCard(
              value: '5',
              label: 'TOTAL BATCHES',
              supportingText: 'completed',
              icon: Icons.inventory_2_outlined,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: onBestSuccessTap,
            child: const _OverviewCard(
              value: '92%',
              label: 'BEST HATCH\nSUCCESS',
              supportingText: 'batch success',
              icon: Icons.emoji_events_outlined,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: onTopSpeciesTap,
            child: const _OverviewCard(
              value: 'Chicken',
              label: 'TOP SPECIES',
              supportingText: '',
              icon: Icons.egg_outlined,
            ),
          ),
        ),
      ],
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String value;
  final String label;
  final String supportingText;
  final IconData icon;

  const _OverviewCard({
    required this.value,
    required this.label,
    required this.supportingText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFE8752A), size: 20),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 0.3,
            ),
          ),
          if (supportingText.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(
              supportingText,
              style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
            ),
          ],
        ],
      ),
    );
  }
}

class _LastBatchCard extends StatelessWidget {
  const _LastBatchCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8752A).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.egg_outlined,
                  color: Color(0xFFE8752A),
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Batch #23',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'CHICKEN \u2022 2026-04-10',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '90%',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: Colors.grey.shade200),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RESULT',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '18/20 hatched',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 36,
                color: Colors.grey.shade200,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AVG TEMP',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '37.5\u00B0C',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StartIncubationCTA extends StatelessWidget {
  final VoidCallback onTap;
  const _StartIncubationCTA({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFE8752A), Color(0xFFF5A623)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFE8752A).withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Start New Incubation',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Select species & confirm checklist',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withValues(alpha: 0.8),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _SpeciesCard extends StatelessWidget {
  final String name;
  final String description;
  final String emoji;
  final VoidCallback onTap;

  const _SpeciesCard({
    required this.name,
    required this.description,
    required this.emoji,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFFE8752A).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(emoji, style: const TextStyle(fontSize: 28)),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.black38),
          ],
        ),
      ),
    );
  }
}

class _HistoryBatchCard extends StatelessWidget {
  final String species;
  final String startDate;
  final String endDate;
  final int eggsTotal;
  final int eggsHatched;
  final String status;
  final bool isSuccess;

  const _HistoryBatchCard({
    required this.species,
    required this.startDate,
    required this.endDate,
    required this.eggsTotal,
    required this.eggsHatched,
    required this.status,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    final double hatchRate = eggsTotal > 0 ? eggsHatched / eggsTotal : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                species,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: (isSuccess ? const Color(0xFF4CAF50) : const Color(0xFFE53935))
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isSuccess ? const Color(0xFF4CAF50) : const Color(0xFFE53935),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$startDate - $endDate',
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: hatchRate,
              backgroundColor: Colors.grey.shade200,
              color: const Color(0xFFE8752A),
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$eggsHatched / $eggsTotal eggs hatched (${(hatchRate * 100).toStringAsFixed(0)}%)',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFE8752A)),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, color: Colors.black87),
        ),
        subtitle: subtitle != null
            ? Text(subtitle!, style: const TextStyle(fontSize: 13))
            : null,
        trailing: const Icon(Icons.chevron_right, color: Colors.black38),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFE8752A), size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _ActionGridCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionGridCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFFE8752A), size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
