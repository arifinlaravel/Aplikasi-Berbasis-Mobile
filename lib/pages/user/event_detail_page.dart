import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Event')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user/checkout');
          },
          child: const Text('Pesan Tiket (contoh)'),
        ),
      ),
    );
  }
}
