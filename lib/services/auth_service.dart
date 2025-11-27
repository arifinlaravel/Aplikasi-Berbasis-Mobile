import 'package:flutter/foundation.dart';
import '../models/user.dart';

class AuthService extends ChangeNotifier {
  AppUser? _currentUser;

  AppUser? get currentUser => _currentUser;

  // Simulasi database user
  final List<AppUser> _users = [
    AppUser(
      id: '1',
      name: 'Super Admin',
      email: 'super@admin.com',
      role: UserRole.superAdmin,
    ),
    AppUser(
      id: '2',
      name: 'Admin EO',
      email: 'admin@eo.com',
      role: UserRole.adminEO,
    ),
    AppUser(
      id: '3',
      name: 'Staff Gate A',
      email: 'staff@gate.com',
      role: UserRole.staff,
    ),
    AppUser(
      id: '4',
      name: 'User Biasa',
      email: 'user@demo.com',
      role: UserRole.user,
    ),
  ];

  // Simulasi login: cuma pakai email
  Future<bool> login(String email) async {
    try {
      final user = _users.firstWhere((u) => u.email == email);
      _currentUser = user;
      notifyListeners();
      return true;
    } catch (_) {
      return false;
    }
  }

  // Simulasi register user biasa
  Future<AppUser> registerUser(String name, String email) async {
    final newUser = AppUser(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      role: UserRole.user,
    );
    _users.add(newUser);
    _currentUser = newUser;
    notifyListeners();
    return newUser;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  List<AppUser> get allUsers => _users;
}
