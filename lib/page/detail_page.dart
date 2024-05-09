import 'package:flutter/material.dart';
import 'package:umkm_bloc/model/umkm_state.dart'; // Pastikan ini adalah path yang benar

class DetailUmkmPage extends StatelessWidget {
  final umkmModel umkmDetail; // Menerima model UMKM sebagai parameter

  const DetailUmkmPage({Key? key, required this.umkmDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail UMKM'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[200],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Text(
                  'Nama: ${umkmDetail.name}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Type: ${umkmDetail.type}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "Member Sejak: ${umkmDetail.memberSejak}",
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Omzet Bulanan: ${umkmDetail.omzetBulan}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Lama Usaha: ${umkmDetail.lamaUsaha}',
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
