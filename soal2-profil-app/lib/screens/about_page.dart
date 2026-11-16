import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Saya'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Keahlian & Hobi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.menu_book),
              title: Text('Bahtsul Masail & Kajian Kitab'),
              subtitle: Text('Terbiasa menganalisis masalah secara terstruktur'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Pengembangan Aplikasi Mobile'),
              subtitle: Text('Membuat aplikasi Android menggunakan Flutter'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.code),
              title: Text('Pemrograman Web & Logika Algoritma'),
              subtitle: Text('Belajar ngoding sambil ngaji di pesantren'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Card(
            child: ListTile(
              leading: Icon(Icons.school),
              title: Text('Institut Teknologi & Bisnis Bina Sarana Global'),
              subtitle: Text('S1 Teknik Informatika (Semester 5 - Sekarang)'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.mosque),
              title: Text('Pondok Pesantren & Madrasah Aliyah'),
              subtitle: Text('Pendidikan Diniyah & Menengah Atas'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.history_edu),
              title: Text('SMP / MTs'),
              subtitle: Text('Pendidikan Menengah Pertama'),
            ),
          ),
        ],
      ),
    );
  }
}