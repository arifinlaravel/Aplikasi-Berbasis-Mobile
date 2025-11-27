import 'package:flutter/material.dart';

class AdminEventFormPage extends StatelessWidget {
  const AdminEventFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Event')),
      body: const Center(child: Text('Form tambah/ubah event (contoh)')),
    );
  }
}
