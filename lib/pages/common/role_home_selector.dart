import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../models/user.dart';

class RoleHomeSelector extends StatelessWidget {
  final AuthService authService;
  const RoleHomeSelector({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    final user = authService.currentUser;
    if (user == null) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, '/login');
      });
      return const Scaffold(body: SizedBox());
    }

    Future.microtask(() {
      switch (user.role) {
        case UserRole.superAdmin:
        case UserRole.adminEO:
          Navigator.pushReplacementNamed(context, '/admin/home');
          break;
        case UserRole.staff:
          Navigator.pushReplacementNamed(context, '/staff/home');
          break;
        case UserRole.user:
          Navigator.pushReplacementNamed(context, '/user/home');
          break;
      }
    });

    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
