import 'package:flutter/material.dart';

class MyTicketsPage extends StatelessWidget {
  const MyTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tiket Saya')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Tiket #${index + 1}'),
            subtitle: const Text('Status: Paid (contoh)'),
          );
        },
      ),
    );
  }
}
