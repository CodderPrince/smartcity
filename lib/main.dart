import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
//prince
//hello
void main() {
  runApp(const SmartCityApp());
}

class SmartCityApp extends StatelessWidget {
  const SmartCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartCity App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartCity Dashboard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          FeatureCard(
            title: 'Real-Time Traffic Monitoring',
            description: 'Live updates on traffic and alternative routes.',
            icon: Icons.traffic,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TrafficPage()),
            ),
          ),
          FeatureCard(
            title: 'Public Transit Schedules',
            description: 'View real-time bus and train schedules.',
            icon: Icons.directions_bus,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TransitPage()),
            ),
          ),
          FeatureCard(
            title: 'Emergency Alerts',
            description: 'Stay informed about emergencies in your area.',
            icon: Icons.warning,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlertsPage()),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.teal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}

class TrafficPage extends StatefulWidget {
  const TrafficPage({super.key});

  @override
  _TrafficPageState createState() => _TrafficPageState();
}

class _TrafficPageState extends State<TrafficPage> {
  late GoogleMapController _mapController;
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example: San Francisco
    zoom: 14.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Traffic Monitoring'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _mapController = controller;
        },
        trafficEnabled: true, // Enables real-time traffic overlay
      ),
    );
  }
}

class TransitPage extends StatelessWidget {
  const TransitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Transit Schedules'),
      ),
      body: const Center(
        child: Text('Real-Time Transit Information Coming Soon!'),
      ),
    );
  }
}

class AlertsPage extends StatelessWidget {
  const AlertsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Alerts'),
      ),
      body: const Center(
        child: Text('Emergency Alerts and Notifications Coming Soon!'),
      ),
    );
  }
}
