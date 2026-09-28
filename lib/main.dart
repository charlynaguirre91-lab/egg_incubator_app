import 'package:flutter/material.dart';
import 'controllers/incubator_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartHatch Incubator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE8752A),
          primary: const Color(0xFFE8752A),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F9FC),
      ),
      home: const IncubatorDashboardPage(),
    );
  }
}

class IncubatorDashboardPage extends StatefulWidget {
  const IncubatorDashboardPage({super.key});

  @override
  State<IncubatorDashboardPage> createState() => _IncubatorDashboardPageState();
}

class _IncubatorDashboardPageState extends State<IncubatorDashboardPage> {
  late final IncubatorController _controller;

  // Local simulated slider values to test the controller logic
  double _simulatedIncTemp = 37.2;
  double _simulatedIncHumidity = 48.0;
  double _simulatedBroodTemp = 31.0;
  double _simulatedBroodHumidity = 50.0;

  @override
  void initState() {
    super.initState();
    _controller = IncubatorController(profile: IncubationProfile.chicken);

    // Initial sensor update to trigger hysteresis rules
    _controller.updateSensors(
      incTemp: _simulatedIncTemp,
      incHumidity: _simulatedIncHumidity,
      broodTemp: _simulatedBroodTemp,
      broodHumidity: _simulatedBroodHumidity,
    );
  }

  void _onSensorChanged() {
    _controller.updateSensors(
      incTemp: _simulatedIncTemp,
      incHumidity: _simulatedIncHumidity,
      broodTemp: _simulatedBroodTemp,
      broodHumidity: _simulatedBroodHumidity,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final profile = _controller.profile;
        final currentDay = _controller.currentIncubationDay;
        final isLockdown = _controller.isLockdown;

        final hours = _controller.elapsedSeconds ~/ 3600;
        final minutes = (_controller.elapsedSeconds % 3600) ~/ 60;
        final seconds = _controller.elapsedSeconds % 60;

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                const Icon(Icons.egg_rounded, color: Color(0xFFE8752A), size: 28),
                const SizedBox(width: 8),
                const Text(
                  'SmartHatch Controller',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            actions: [
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFFE8752A),
                ),
                icon: const Icon(Icons.swap_horiz_rounded),
                label: Text(
                  _controller.profile.speciesName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: _showSpeciesSelectDialog,
              ),
              IconButton(
                icon: const Icon(Icons.refresh_rounded),
                tooltip: 'Start New Batch / Reset',
                onPressed: _showSpeciesSelectDialog,
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 0. SPECIES QUICK SWITCHER (Chicken / Duck / Quail)
                _buildSpeciesQuickSelector(),
                const SizedBox(height: 12),

                // 1. STAGE & BATCH BANNER
                _buildBatchHeaderCard(currentDay, profile, isLockdown, hours, minutes, seconds),
                const SizedBox(height: 16),

                // 2. INCUBATOR CHAMBER
                _buildIncubatorChamberCard(),
                const SizedBox(height: 16),

                // 3. BROODER CHAMBER
                _buildBrooderChamberCard(),
                const SizedBox(height: 16),

                // 4. TEST SENSOR SLIDERS (Hardware Simulator)
                _buildSimulatorCard(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSpeciesQuickSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: IncubationProfile.allProfiles.map((p) {
          final isSelected = _controller.profile.speciesName == p.speciesName;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (!isSelected) {
                  _controller.startNewBatch(p);
                  _onSensorChanged();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFE8752A) : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: const Color(0xFFE8752A).withValues(alpha: 0.3),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  children: [
                    Text(
                      p.speciesName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${p.hatchDay} Days',
                      style: TextStyle(
                        fontSize: 11,
                        color: isSelected ? Colors.white.withValues(alpha: 0.85) : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBatchHeaderCard(
    int currentDay,
    IncubationProfile profile,
    bool isLockdown,
    int hours,
    int minutes,
    int seconds,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isLockdown
              ? [const Color(0xFFD9534F), const Color(0xFFC9302C)]
              : [const Color(0xFFE8752A), const Color(0xFFF39C12)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: (isLockdown ? Colors.red : Colors.deepOrange).withValues(alpha: 0.25),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'Species: ${profile.speciesName}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _controller.stageName,
                  style: TextStyle(
                    color: isLockdown ? const Color(0xFFC9302C) : const Color(0xFFE8752A),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Day $currentDay',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '/ ${profile.hatchDay} days',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: currentDay / profile.hatchDay,
              minHeight: 8,
              backgroundColor: Colors.white.withValues(alpha: 0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Elapsed: ${hours}h ${minutes}m ${seconds}s',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 13,
                ),
              ),
              Text(
                isLockdown
                    ? 'Lockdown Active (Turning Halted)'
                    : 'Lockdown starts on Day ${profile.lockdownStartDay}',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIncubatorChamberCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.inventory_2_outlined, color: Color(0xFFE8752A), size: 22),
              SizedBox(width: 8),
              Text(
                'Incubator Chamber',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Temperature & Humidity metrics
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  label: 'Incubator Temp',
                  value: _controller.incubatorTemperature != null
                      ? '${_controller.incubatorTemperature!.toStringAsFixed(1)} °C'
                      : 'ERROR',
                  target: 'Target: ${_controller.profile.temperatureTarget} °C',
                  isTargetMet: _controller.incubatorTemperature != null &&
                      (_controller.incubatorTemperature! - _controller.profile.temperatureTarget).abs() <= 0.5,
                  icon: Icons.thermostat_rounded,
                  iconColor: Colors.deepOrange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricTile(
                  label: 'Incubator Humidity',
                  value: _controller.incubatorHumidity != null
                      ? '${_controller.incubatorHumidity!.toStringAsFixed(1)} %'
                      : 'ERROR',
                  target: 'Target: ${_controller.humidityLowLimit.toInt()}-${_controller.humidityHighLimit.toInt()} %',
                  isTargetMet: _controller.incubatorHumidity != null &&
                      _controller.incubatorHumidity! >= _controller.humidityLowLimit &&
                      _controller.incubatorHumidity! <= _controller.humidityHighLimit,
                  icon: Icons.water_drop_rounded,
                  iconColor: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 14),

          // Relay States
          const Text(
            'Relay & Actuator Outputs',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildRelayChip(
                name: 'Heat Bulb (D10)',
                isOn: _controller.incubatorBulbState,
                activeColor: Colors.orange,
                icon: Icons.lightbulb_outline,
              ),
              _buildRelayChip(
                name: 'Humidifier (D6)',
                isOn: _controller.incubatorHumidifierState,
                activeColor: Colors.blue,
                icon: Icons.cloud_outlined,
              ),
              _buildRelayChip(
                name: 'Circulation Fan (D12)',
                isOn: _controller.incubatorFanState,
                activeColor: Colors.teal,
                icon: Icons.wind_power,
              ),
              _buildRelayChip(
                name: 'Egg Turner: ${_controller.eggTurningStatus}',
                isOn: !_controller.isLockdown,
                activeColor: Colors.purple,
                icon: Icons.autorenew_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBrooderChamberCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.nest_cam_wired_stand, color: Colors.indigo, size: 22),
              SizedBox(width: 8),
              Text(
                'Brooder Chamber',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _buildMetricTile(
                  label: 'Brooder Temp',
                  value: _controller.brooderTemperature != null
                      ? '${_controller.brooderTemperature!.toStringAsFixed(1)} °C'
                      : 'ERROR',
                  target: 'Target: 30.0 - 32.0 °C',
                  isTargetMet: _controller.brooderTemperature != null &&
                      _controller.brooderTemperature! >= 30.0 &&
                      _controller.brooderTemperature! <= 32.0,
                  icon: Icons.thermostat_outlined,
                  iconColor: Colors.indigo,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricTile(
                  label: 'Brooder Humidity',
                  value: _controller.brooderHumidity != null
                      ? '${_controller.brooderHumidity!.toStringAsFixed(1)} %'
                      : 'ERROR',
                  target: 'Target: 45 - 60 %',
                  isTargetMet: _controller.brooderHumidity != null &&
                      _controller.brooderHumidity! >= 45.0 &&
                      _controller.brooderHumidity! <= 60.0,
                  icon: Icons.water_drop_outlined,
                  iconColor: Colors.cyan,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              _buildRelayChip(
                name: 'Brooder Bulb (D11)',
                isOn: _controller.brooderBulbState,
                activeColor: Colors.indigo,
                icon: Icons.lightbulb_outline,
              ),
              _buildRelayChip(
                name: 'Brooder Humidifier (D5)',
                isOn: _controller.brooderHumidifierState,
                activeColor: Colors.cyan,
                icon: Icons.cloud_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimulatorCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.tune_rounded, color: Colors.grey.shade700, size: 20),
              const SizedBox(width: 8),
              const Text(
                'Hardware Telemetry Simulator',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Move the sliders to simulate live DHT readings and observe how the controller automatically triggers the bulb and humidifier relays based on hysteresis thresholds.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 14),

          // Incubator Temp Slider
          Text('Incubator Temp: ${_simulatedIncTemp.toStringAsFixed(1)} °C'),
          Slider(
            value: _simulatedIncTemp,
            min: 35.0,
            max: 40.0,
            divisions: 50,
            activeColor: const Color(0xFFE8752A),
            onChanged: (val) {
              setState(() => _simulatedIncTemp = val);
              _onSensorChanged();
            },
          ),

          // Incubator Humidity Slider
          Text('Incubator Humidity: ${_simulatedIncHumidity.toStringAsFixed(1)} %'),
          Slider(
            value: _simulatedIncHumidity,
            min: 30.0,
            max: 85.0,
            divisions: 55,
            activeColor: Colors.blue,
            onChanged: (val) {
              setState(() => _simulatedIncHumidity = val);
              _onSensorChanged();
            },
          ),
          const SizedBox(height: 8),

          // Brooder Temp Slider
          Text('Brooder Temp: ${_simulatedBroodTemp.toStringAsFixed(1)} °C'),
          Slider(
            value: _simulatedBroodTemp,
            min: 25.0,
            max: 38.0,
            divisions: 52,
            activeColor: Colors.indigo,
            onChanged: (val) {
              setState(() => _simulatedBroodTemp = val);
              _onSensorChanged();
            },
          ),

          // Brooder Humidity Slider
          Text('Brooder Humidity: ${_simulatedBroodHumidity.toStringAsFixed(1)} %'),
          Slider(
            value: _simulatedBroodHumidity,
            min: 30.0,
            max: 80.0,
            divisions: 50,
            activeColor: Colors.cyan,
            onChanged: (val) {
              setState(() => _simulatedBroodHumidity = val);
              _onSensorChanged();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMetricTile({
    required String label,
    required String value,
    required String target,
    required bool isTargetMet,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEEEEEE)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: iconColor),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                isTargetMet ? Icons.check_circle : Icons.warning_amber_rounded,
                size: 13,
                color: isTargetMet ? Colors.green : Colors.amber.shade800,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  target,
                  style: TextStyle(
                    fontSize: 11,
                    color: isTargetMet ? Colors.green.shade700 : Colors.amber.shade900,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRelayChip({
    required String name,
    required bool isOn,
    required Color activeColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isOn ? activeColor.withValues(alpha: 0.12) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isOn ? activeColor.withValues(alpha: 0.3) : Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isOn ? activeColor : Colors.grey.shade500,
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isOn ? activeColor : Colors.grey.shade600,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: isOn ? activeColor : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              isOn ? 'ON' : 'OFF',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSpeciesSelectDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Select Species & Start Batch'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select egg type to apply the programmed incubation profile (temperatures, stages, humidity, and lockdown day):',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 14),
            ...IncubationProfile.allProfiles.map((p) {
              final isCurrent = _controller.profile.speciesName == p.speciesName;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: isCurrent ? const Color(0xFFE8752A).withValues(alpha: 0.1) : Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isCurrent ? const Color(0xFFE8752A) : Colors.grey.shade300,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    '${p.speciesName} Eggs',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCurrent ? const Color(0xFFE8752A) : Colors.black87,
                    ),
                  ),
                  subtitle: Text(
                    'Total: ${p.hatchDay} days | Lockdown: Day ${p.lockdownStartDay}\nActive RH: ${p.activeHumidityLow.toInt()}-${p.activeHumidityHigh.toInt()}% | Lockdown RH: ${p.lockdownHumidityLow.toInt()}-${p.lockdownHumidityHigh.toInt()}%',
                    style: const TextStyle(fontSize: 11),
                  ),
                  trailing: isCurrent
                      ? const Icon(Icons.check_circle, color: Color(0xFFE8752A))
                      : const Icon(Icons.arrow_forward_ios_rounded, size: 14),
                  onTap: () {
                    _controller.startNewBatch(p);
                    _onSensorChanged();
                    Navigator.pop(ctx);
                  },
                ),
              );
            }),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}