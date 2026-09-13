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
      home: const MainNavigation(),
    );
  }
}

// ──────────────────────────────────────────────
// Bottom Navigation Host
// ──────────────────────────────────────────────

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
        indicatorColor: const Color(0xFFE8752A).withOpacity(0.15),
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

// ──────────────────────────────────────────────
// Home Screen
// ──────────────────────────────────────────────

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
            // ── Header ──
            _HomeHeader(
              onProfileTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 24),

            // ── Overview Section ──
            const _SectionLabel(text: 'OVERVIEW'),
            const SizedBox(height: 10),
            const _OverviewCards(),
            const SizedBox(height: 24),

            // ── Last Batch Section ──
            const _SectionLabel(text: 'LAST BATCH'),
            const SizedBox(height: 10),
            const _LastBatchCard(),
            const SizedBox(height: 24),

            // ── Actions Section ──
            const _SectionLabel(text: 'ACTIONS'),
            const SizedBox(height: 10),
            _StartIncubationCTA(onTap: () {}),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Species Screen
// ──────────────────────────────────────────────

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
            _SpeciesCard(
              name: 'Chicken',
              description: '21 days incubation period',
              emoji: '🐔',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _SpeciesCard(
              name: 'Duck',
              description: '28 days incubation period',
              emoji: '🦆',
              onTap: () {},
            ),
            const SizedBox(height: 12),
            _SpeciesCard(
              name: 'Quail',
              description: '17 days incubation period',
              emoji: '🥚',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// History Screen
// ──────────────────────────────────────────────

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
            _HistoryBatchCard(
              species: 'Chicken',
              startDate: 'Aug 10, 2026',
              endDate: 'Aug 31, 2026',
              eggsTotal: 24,
              eggsHatched: 20,
              status: 'Completed',
              isSuccess: true,
            ),
            const SizedBox(height: 12),
            _HistoryBatchCard(
              species: 'Duck',
              startDate: 'Jul 15, 2026',
              endDate: 'Aug 12, 2026',
              eggsTotal: 18,
              eggsHatched: 15,
              status: 'Completed',
              isSuccess: true,
            ),
            const SizedBox(height: 12),
            _HistoryBatchCard(
              species: 'Quail',
              startDate: 'Jun 20, 2026',
              endDate: 'Jul 07, 2026',
              eggsTotal: 30,
              eggsHatched: 12,
              status: 'Completed',
              isSuccess: false,
            ),
          ],
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────
// Profile Screen (navigated from header)
// ──────────────────────────────────────────────

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
                  'SmartHatch User',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'user@smarthatch.com',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 24),

              const _SectionLabel(text: 'SETTINGS'),
              const SizedBox(height: 10),
              _ProfileOption(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {},
              ),
              _ProfileOption(
                icon: Icons.thermostat_outlined,
                title: 'Temperature Unit',
                subtitle: 'Celsius',
                onTap: () {},
              ),
              _ProfileOption(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English',
                onTap: () {},
              ),
              _ProfileOption(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                onTap: () {},
              ),
              const SizedBox(height: 16),

              const _SectionLabel(text: 'ABOUT'),
              const SizedBox(height: 10),
              _ProfileOption(
                icon: Icons.info_outline,
                title: 'App Version',
                subtitle: '1.0.0',
                onTap: () {},
              ),
              _ProfileOption(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              _ProfileOption(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {},
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
// Reusable Widgets
// ══════════════════════════════════════════════

// ── Section Label (uppercase, subtle) ──

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

// ── Home Header (title + date + profile icon) ──

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
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                ),
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
                  color: Colors.black.withOpacity(0.04),
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

// ── Overview Cards (3 in a row) ──

class _OverviewCards extends StatelessWidget {
  const _OverviewCards();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _OverviewCard(
            value: '5',
            label: 'TOTAL BATCHES',
            supportingText: 'completed',
            icon: Icons.inventory_2_outlined,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _OverviewCard(
            value: '92%',
            label: 'BEST HATCH\nSUCCESS',
            supportingText: 'batch success',
            icon: Icons.emoji_events_outlined,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _OverviewCard(
            value: 'Chicken',
            label: 'TOP SPECIES',
            supportingText: '',
            icon: Icons.egg_outlined,
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
            color: Colors.black.withOpacity(0.04),
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

// ── Last Batch Card ──

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
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Top row: icon + batch info + success badge
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8752A).withOpacity(0.1),
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
                  color: const Color(0xFF4CAF50).withOpacity(0.1),
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

          // Divider
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Divider(height: 1, color: Colors.grey.shade200),
          ),

          // Result + Avg Temp row
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

// ── Start New Incubation CTA ──

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
              color: const Color(0xFFE8752A).withOpacity(0.3),
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
                color: Colors.white.withOpacity(0.25),
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
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.8),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Species Card ──

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
              color: Colors.black.withOpacity(0.04),
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
                color: const Color(0xFFE8752A).withOpacity(0.1),
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

// ── History Batch Card ──

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
            color: Colors.black.withOpacity(0.04),
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
                      .withOpacity(0.1),
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

// ── Profile Option Row ──

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
            color: Colors.black.withOpacity(0.03),
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
