import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();
  String accountType = 'Event Organizer';

  @override
  void dispose() {
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Register Pengelola / EO')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: nameC,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: accountType,
                dropdownColor: const Color(0xFF020617),
                decoration: const InputDecoration(
                  labelText: 'Jenis Akun Pengelola',
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Event Organizer',
                    child: Text('Event Organizer'),
                  ),
                  DropdownMenuItem(
                    value: 'Venue / Gedung',
                    child: Text('Venue / Pengelola Gedung'),
                  ),
                  DropdownMenuItem(
                    value: 'Komunitas',
                    child: Text('Komunitas / Klub'),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    setState(() {
                      accountType = val;
                    });
                  }
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // sementara: tidak disimpan ke mana-mana
                  Navigator.pushReplacementNamed(context, '/event-dashboard');
                },
                child: const Text('Daftar & Buat Event'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
