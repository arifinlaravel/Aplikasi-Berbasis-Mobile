import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFF020617),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF111827)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Ticket Hub EO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // ----- LOGIN -----
            ListTile(
              leading: const Icon(Icons.login, color: Colors.white),
              title: const Text('Login', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/login');
              },
            ),

            // ----- REGISTER -----
            ListTile(
              leading: const Icon(Icons.person_add, color: Colors.white),
              title: const Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/register');
              },
            ),

            const Divider(color: Colors.white24),

            // ----- LOGOUT -----
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/landing',
                  (route) => false, // hapus semua route sebelumnya
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
