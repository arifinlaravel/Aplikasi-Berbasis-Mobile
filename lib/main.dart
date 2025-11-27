import 'package:flutter/material.dart';
import 'routes.dart';
import 'pages/landing_page.dart';

void main() {
  runApp(const TicketHubApp());
}

class TicketHubApp extends StatelessWidget {
  const TicketHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    const darkBlue = Color(0xFF020617); // biru gelap kehitaman
    const accentBlue = Color(0xFF2563EB); // biru aksen

    return MaterialApp(
      title: 'Ticket Hub EO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: darkBlue,
        appBarTheme: const AppBarTheme(
          backgroundColor: darkBlue,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: accentBlue,
          secondary: accentBlue,
          surface: darkBlue,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: accentBlue),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: accentBlue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(999),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
      ),
      routes: appRoutes,
      home: const LandingPage(),
    );
  }
}
