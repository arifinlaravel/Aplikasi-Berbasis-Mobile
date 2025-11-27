import 'package:flutter/material.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Event')),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Event ${index + 1}'),
            subtitle: const Text('Lokasi contoh'),
            onTap: () {
              Navigator.pushNamed(context, '/user/events/detail');
            },
          );
        },
      ),
    );
  }
}
