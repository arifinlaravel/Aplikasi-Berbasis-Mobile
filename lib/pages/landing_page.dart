import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    const accentBlue = Color(0xFF2563EB);

    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Ticket Hub EO')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Sekarang dan Dapatkan Kemudahan Mengelola Event Anda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Kelola event Anda dengan praktis, dan dapatkan kemudahan penjualan tiket,\n',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Mulai sebagai Event Organizer',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Registrasi sebentar, lalu langsung tambah event dan tiket '
                          'tanpa ribet.',
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Daftar EO'),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: const Text(
                  'Sudah punya akun? Login di sini',
                  style: TextStyle(color: accentBlue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
