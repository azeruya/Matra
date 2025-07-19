import 'package:flutter/material.dart';

void main() {
  runApp(const MatraApp());
}

class MatraApp extends StatelessWidget {
  const MatraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matra: AI4Mothers',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade300),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: const Text('Matra: AI4Mothers'),
        backgroundColor: Colors.pink[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: [
            FeatureCard(
              icon: Icons.health_and_safety,
              label: 'Check Symptoms',
              color: Colors.redAccent.shade100,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SymptomCheckerPage()),
                );
              },
            ),
            FeatureCard(
              icon: Icons.book,
              label: 'Pregnancy Tips',
              color: Colors.orange.shade200,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EducationPage()),
                );
              },
            ),
            FeatureCard(
              icon: Icons.history,
              label: 'My Journal',
              color: Colors.purple.shade100,
              onTap: () {},
            ),
            FeatureCard(
              icon: Icons.sync,
              label: 'Sync with Clinic',
              color: Colors.teal.shade200,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SymptomCheckerPage extends StatelessWidget {
  const SymptomCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
        backgroundColor: Colors.redAccent,
      ),
      backgroundColor: Colors.red[50],
      body: Center(
        child: Text(
          'Symptom Checker coming soon!',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Education'),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.orange[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            TipCard(
              icon: Icons.fastfood,
              title: 'Eat Well',
              description: 'Include iron-rich foods and stay hydrated.',
            ),
            TipCard(
              icon: Icons.self_improvement,
              title: 'Rest Often',
              description: 'Take short naps and sleep 7–9 hours.',
            ),
            TipCard(
              icon: Icons.directions_walk,
              title: 'Gentle Movement',
              description: 'Take walks and avoid lifting heavy items.',
            ),
          ],
        ),
      ),
    );
  }
}

class TipCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const TipCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.pink[400]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
