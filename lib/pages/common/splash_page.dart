import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class SplashPage extends StatefulWidget {
  final AuthService authService;
  const SplashPage({super.key, required this.authService});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 1));
    if (widget.authService.currentUser != null && mounted) {
      Navigator.pushReplacementNamed(context, '/role-home-selector');
    } else if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
