import 'package:flutter/material.dart';
import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profilSaatIni;

  const EditProfilePage({super.key, required this.profilSaatIni});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  static const Color _emeraldPrimary = Color(0xFF0D5C46);
  static const Color _goldAccent = Color(0xFFC59B27);

  late TextEditingController _namaController;
  late TextEditingController _nimController;
  late TextEditingController _prodiController;
  late TextEditingController _kelasController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;
  late TextEditingController _noHpController;
  late TextEditingController _githubController;

  @override
  void initState() {
    super.initState();
    _namaController = TextEditingController(text: widget.profilSaatIni.nama);
    _nimController = TextEditingController(text: widget.profilSaatIni.nim);
    _prodiController = TextEditingController(text: widget.profilSaatIni.prodi);
    _kelasController = TextEditingController(text: widget.profilSaatIni.kelas);
    _bioController = TextEditingController(text: widget.profilSaatIni.bio);
    _emailController = TextEditingController(text: widget.profilSaatIni.email);
    _noHpController = TextEditingController(text: widget.profilSaatIni.noHp);
    _githubController = TextEditingController(text: widget.profilSaatIni.github);
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nimController.dispose();
    _prodiController.dispose();
    _kelasController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _simpanProfil() {
    if (_formKey.currentState!.validate()) {
      final dataBaru = Profile(
        nama: _namaController.text.trim(),
        nim: _nimController.text.trim(),
        prodi: _prodiController.text.trim(),
        kelas: _kelasController.text.trim(),
        bio: _bioController.text.trim(),
        email: _emailController.text.trim(),
        noHp: _noHpController.text.trim(),
        github: _githubController.text.trim(),
        foto: widget.profilSaatIni.foto,
      );

      Navigator.pop(context, dataBaru);
    }
  }

  InputDecoration _dekorasiInput(String label, IconData ikon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(ikon, color: _emeraldPrimary),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: _emeraldPrimary, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appBarColor = isDark ? const Color(0xFF093D2E) : _emeraldPrimary;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profil',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: _goldAccent.withValues(alpha: 0.45)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: _dekorasiInput('Nama Lengkap', Icons.person_outline),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _nimController,
                    keyboardType: TextInputType.number,
                    decoration: _dekorasiInput('NIM', Icons.badge_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'NIM wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _prodiController,
                    decoration: _dekorasiInput('Program Studi', Icons.school_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Program studi wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _kelasController,
                    decoration: _dekorasiInput('Kelas', Icons.class_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Kelas wajib diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _bioController,
                    maxLines: 2,
                    decoration: _dekorasiInput('Bio Singkat', Icons.format_quote_rounded),
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: _dekorasiInput('Email', Icons.email_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email wajib diisi';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _noHpController,
                    keyboardType: TextInputType.number,
                    decoration: _dekorasiInput('Nomor HP', Icons.phone_outlined),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nomor HP wajib diisi';
                      }
                      if (!RegExp(r'^[0-9]{10,13}$').hasMatch(value.trim())) {
                        return 'Nomor HP harus angka 10-13 digit';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),
                  TextFormField(
                    controller: _githubController,
                    decoration: _dekorasiInput('Akun GitHub', Icons.code_rounded),
                  ),
                  const SizedBox(height: 22),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _simpanProfil,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _emeraldPrimary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'SIMPAN PERUBAHAN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}