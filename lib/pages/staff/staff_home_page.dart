import 'package:flutter/material.dart';

class StaffHomePage extends StatelessWidget {
  const StaffHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Staff')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/staff/validate');
          },
          child: const Text('Validasi Tiket'),
        ),
      ),
    );
  }
}
