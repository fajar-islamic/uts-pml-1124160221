import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  static const Color _emeraldPrimary = Color(0xFF0D5C46);
  static const Color _goldAccent = Color(0xFFC59B27);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDark ? const Color(0xFF093D2E) : _emeraldPrimary;

    final daftarHobi = [
      {'ikon': Icons.sailing_rounded, 'label': 'Mancing di Bagan & Ngapung di Laut'},
      {'ikon': Icons.code_rounded, 'label': 'Ngoding Flutter & Eksperimen UI'},
      {'ikon': Icons.forum_outlined, 'label': 'Bedah Kasus & Diskusi Dialektika'},
      {'ikon': Icons.auto_awesome_outlined, 'label': 'Menyelami Samudra Literatur'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tentang Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: _goldAccent.withValues(alpha: 0.4)),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0x1F0D5C46),
                child: Icon(Icons.school_rounded, color: _emeraldPrimary),
              ),
              title: Text(
                'Global Institute of Technology and Business',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('S1 Teknik Informatika (Semester 5 - Sekarang)'),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: _goldAccent.withValues(alpha: 0.4)),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0x1F0D5C46),
                child: Icon(Icons.auto_stories_rounded, color: _emeraldPrimary),
              ),
              title: Text(
                'Pendidikan Kesetaraan Paket C (Setara SMA)',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('Fokus Kajian Literatur Klasik & Dialektika Teks'),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: _goldAccent.withValues(alpha: 0.4)),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0x1F0D5C46),
                child: Icon(Icons.history_edu_rounded, color: _emeraldPrimary),
              ),
              title: Text(
                'Pendidikan Kesetaraan Paket B (Setara SMP)',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('Pendalaman Dasar Nalar & Argumentasi'),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: _goldAccent.withValues(alpha: 0.4)),
            ),
            child: const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0x1F0D5C46),
                child: Icon(Icons.backpack_rounded, color: _emeraldPrimary),
              ),
              title: Text(
                'Sekolah Dasar (SD)',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('Pendidikan Dasar Formal'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Keahlian & Nalar Analitis',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.phone_android_rounded, color: _emeraldPrimary),
              title: Text(
                'Flutter & Dart Mobile Development',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('Pengembangan aplikasi Android multi-halaman'),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.merge_type_rounded, color: _emeraldPrimary),
              title: Text(
                'Git & GitHub Version Control',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('Manajemen repository dan kolaborasi kode'),
            ),
          ),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: const ListTile(
              leading: Icon(Icons.hub_rounded, color: _emeraldPrimary),
              title: Text(
                'Dialektika & Bedah Masalah',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
              subtitle: Text('Membedah persoalan rumit lewat referensi berlapis'),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Hobi & Minat',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: daftarHobi.map((hobi) {
              return Chip(
                avatar: Icon(
                  hobi['ikon'] as IconData,
                  size: 18,
                  color: _emeraldPrimary,
                ),
                label: Text(
                  hobi['label'] as String,
                  style: const TextStyle(fontSize: 12.5),
                ),
                backgroundColor: _emeraldPrimary.withValues(alpha: 0.1),
                side: BorderSide(
                  color: _emeraldPrimary.withValues(alpha: 0.35),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 22),
          const Text(
            'Tentang Aplikasi',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            elevation: 1,
            color: _emeraldPrimary.withValues(alpha: isDark ? 0.22 : 0.07),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: _goldAccent.withValues(alpha: 0.6)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.waves_rounded, color: _goldAccent),
                      const SizedBox(width: 8),
                      Text(
                        'Aplikasi Profil Mahasiswa v1.0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                          color: isDark ? Colors.amber.shade200 : _emeraldPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Dirancang untuk memenuhi Ujian Tengah Semester (UTS) Pemrograman Mobile Lanjutan. Memadukan ketelitian membedah teks klasik, kesabaran menunggu umpan disambar di tengah laut, dan presisi merakit kode aplikasi modern.',
                    style: TextStyle(fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}