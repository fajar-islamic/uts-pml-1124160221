import 'package:flutter/material.dart';
import '../../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profilSaatIni;

  const EditProfilePage({super.key, required this.profilSaatIni});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _nimController,
                decoration: const InputDecoration(
                  labelText: 'NIM',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'NIM wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _prodiController,
                decoration: const InputDecoration(
                  labelText: 'Program Studi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Program studi wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _kelasController,
                decoration: const InputDecoration(
                  labelText: 'Kelas',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Kelas wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _bioController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Bio Singkat',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
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
              const SizedBox(height: 12),
              TextFormField(
                controller: _noHpController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Nomor HP',
                  border: OutlineInputBorder(),
                ),
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
              const SizedBox(height: 12),
              TextFormField(
                controller: _githubController,
                decoration: const InputDecoration(
                  labelText: 'Akun GitHub',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _simpanProfil,
                  child: const Text('Simpan'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}