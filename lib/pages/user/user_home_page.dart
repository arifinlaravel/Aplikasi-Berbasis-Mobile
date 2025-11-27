import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home User')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user/events');
              },
              child: const Text('Lihat Event'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/user/my-tickets');
              },
              child: const Text('Tiket Saya'),
            ),
          ],
        ),
      ),
    );
  }
}
