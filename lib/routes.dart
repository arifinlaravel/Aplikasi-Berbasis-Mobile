import 'package:flutter/material.dart';

import 'pages/landing_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/auth/register_page.dart';
import 'pages/event/event_form_page.dart';
import 'pages/event/event_dashboard_page.dart';

Map<String, WidgetBuilder> appRoutes = {
  '/landing': (_) => const LandingPage(),
  '/login': (_) => const LoginPage(),
  '/register': (_) => const RegisterPage(),
  '/event-dashboard': (_) => const EventDashboardPage(),
  '/event-form': (_) => const EventFormPage(),
};
