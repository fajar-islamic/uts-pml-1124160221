import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final IconData ikon;
  final String judul;
  final String isi;

  const InfoTile({
    super.key,
    required this.ikon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Icon(ikon),
        title: Text(judul),
        subtitle: Text(isi),
      ),
    );
  }
}