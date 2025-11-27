import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailC = TextEditingController();
    final passC = TextEditingController();

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Login Pengelola / EO')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: emailC,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passC,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // sementara: langsung ke form event
                Navigator.pushReplacementNamed(context, '/event-dashboard');
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
