import 'package:flutter/material.dart';

class AdminEventListPage extends StatelessWidget {
  const AdminEventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Admin')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Event Admin #${index + 1}'),
            trailing: const Icon(Icons.edit),
          );
        },
      ),
    );
  }
}
