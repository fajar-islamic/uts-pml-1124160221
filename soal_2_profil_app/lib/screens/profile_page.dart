import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../widgets/info_tile.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color _emeraldPrimary = Color(0xFF0D5C46);
  static const Color _goldAccent = Color(0xFFC59B27);

  Profile _profil = Profile(
    nama: 'Fajar Hikmayatul Islami',
    nim: '1124160221',
    prodi: 'Teknik Informatika',
    kelas: 'TI - Semester 5',
    bio: 'Mahasiswa TI • Penyelam Teks Klasik, Perakit Kode & Pemburu Strike di Bagan',
    email: 'fajar@gmail.com',
    noHp: '081234567890',
    github: 'github.com/fajar-islamic',
    foto: 'assets/images/profil.png',
  );

  Future<void> _bukaEditProfil() async {
    final dataBaru = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profilSaatIni: _profil),
      ),
    );

    if (dataBaru != null) {
      setState(() {
        _profil = dataBaru;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDark ? const Color(0xFF093D2E) : _emeraldPrimary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil Saya',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'Ganti Tema',
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              widget.onThemeChanged(!widget.isDarkMode);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: appBarColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: _goldAccent,
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(_profil.foto),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _profil.nama,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'NIM: ${_profil.nim}',
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline, color: _emeraldPrimary),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.explore_outlined, color: _emeraldPrimary),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.brightness_6_outlined, color: _emeraldPrimary),
              title: const Text('Mode Gelap'),
              activeThumbColor: _emeraldPrimary,
              value: widget.isDarkMode,
              onChanged: widget.onThemeChanged,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Keluar',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: _goldAccent, width: 2.5),
              ),
              child: CircleAvatar(
                radius: 54,
                backgroundImage: AssetImage(_profil.foto),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              _profil.nama,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: _emeraldPrimary.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _emeraldPrimary.withValues(alpha: 0.35),
                ),
              ),
              child: Text(
                '${_profil.prodi} • ${_profil.kelas}',
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.amber.shade200 : _emeraldPrimary,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'NIM: ${_profil.nim}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: _goldAccent.withValues(alpha: 0.45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.format_quote_rounded, color: _goldAccent),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _profil.bio,
                        style: const TextStyle(fontSize: 13.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Kontak',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            InfoTile(
              ikon: Icons.email_outlined,
              judul: 'Email',
              isi: _profil.email,
            ),
            InfoTile(
              ikon: Icons.phone_outlined,
              judul: 'Nomor HP',
              isi: _profil.noHp,
            ),
            InfoTile(
              ikon: Icons.code_rounded,
              judul: 'Akun GitHub',
              isi: _profil.github,
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaEditProfil,
        tooltip: 'Edit Profil',
        backgroundColor: _emeraldPrimary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.edit),
      ),
    );
  }
}