import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profil fajar hikmayatul islami',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 16),
                Text(
                  'fajar hikmayatul islami',
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'NIM: 1124160221',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Teknik Informatika',
                  style: textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Card 1: Kontak (4 InfoTile)
                const Card(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'fajoy@gmail.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'Nomor HP',
                        value: '08123456789',
                      ),
                      InfoTile(
                        icon: Icons.class_,
                        label: 'Kelas',
                        value: 'TI 2024',
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'github.com/fajou',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Card 2: Keahlian & Hobi (3 InfoTile)
                const Card(
                  child: Column(
                    children: [
                      InfoTile(
                        icon: Icons.flutter_dash,
                        label: 'Keahlian',
                        value: 'Flutter Basics',
                      ),
                      InfoTile(
                        icon: Icons.sports_soccer,
                        label: 'Hobi 1',
                        value: 'Futsal',
                      ),
                      InfoTile(
                        icon: Icons.music_note,
                        label: 'Hobi 2',
                        value: 'Musik',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
            ),
          );
        },
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}

// Widget Reusable InfoTile
class InfoTile extends StatelessWidget {
  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}