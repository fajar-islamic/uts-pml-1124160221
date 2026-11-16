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
  Profile _profil = Profile(
    nama: 'Fajar',
    nim: '1124160221',
    prodi: 'Teknik Informatika',
    kelas: 'TI - Semester 5',
    bio: 'Santri Bahtsul Masail & Mahasiswa Teknik Informatika',
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
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
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: AssetImage(_profil.foto),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _profil.nama,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(_profil.nim),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _bukaEditProfil();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.brightness_6),
              title: const Text('Mode Gelap'),
              value: widget.isDarkMode,
              onChanged: widget.onThemeChanged,
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
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
            CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(_profil.foto),
            ),
            const SizedBox(height: 12),
            Text(
              _profil.nama,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'NIM: ${_profil.nim}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '${_profil.prodi} • ${_profil.kelas}',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(Icons.format_quote),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(_profil.bio),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Informasi Kontak',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            InfoTile(
              ikon: Icons.email,
              judul: 'Email',
              isi: _profil.email,
            ),
            InfoTile(
              ikon: Icons.phone,
              judul: 'Nomor HP',
              isi: _profil.noHp,
            ),
            InfoTile(
              ikon: Icons.code,
              judul: 'Akun GitHub',
              isi: _profil.github,
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _bukaEditProfil,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
    );
  }
}