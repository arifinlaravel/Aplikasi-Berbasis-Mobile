import 'package:flutter/material.dart';
import '../../services/event_service.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/event_card.dart';
import '../../models/event.dart';

class EventDashboardPage extends StatefulWidget {
  const EventDashboardPage({super.key});

  @override
  State<EventDashboardPage> createState() => _EventDashboardPageState();
}

class _EventDashboardPageState extends State<EventDashboardPage> {
  final eventService = EventService();

  List<EventModel> get _upcoming {
    final now = DateTime.now();
    return eventService.events.where((e) => e.eventDate.isAfter(now)).toList();
  }

  List<EventModel> get _ongoing {
    final now = DateTime.now();
    return eventService.events.where((e) {
      return _isSameDay(e.eventDate, now);
    }).toList();
  }

  List<EventModel> get _history {
    final now = DateTime.now();
    return eventService.events
        .where(
          (e) => e.eventDate.isBefore(DateTime(now.year, now.month, now.day)),
        )
        .toList();
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Future<void> _goToAddEvent() async {
    await Navigator.pushNamed(context, '/event-form');
    setState(() {}); // refresh list setelah kembali dari form
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Event Saya')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToAddEvent,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 80),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Event yang akan datang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (_upcoming.isEmpty)
                const Text(
                  'Belum ada event yang akan datang.',
                  style: TextStyle(color: Colors.white70),
                )
              else
                ..._upcoming.map((e) => EventCard(event: e)),

              const SizedBox(height: 24),
              const Text(
                'Event berjalan (hari ini)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (_ongoing.isEmpty)
                const Text(
                  'Belum ada event yang berjalan hari ini.',
                  style: TextStyle(color: Colors.white70),
                )
              else
                ..._ongoing.map((e) => EventCard(event: e)),

              const SizedBox(height: 24),
              const Text(
                'Riwayat event',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (_history.isEmpty)
                const Text(
                  'Belum ada riwayat event.',
                  style: TextStyle(color: Colors.white70),
                )
              else
                ..._history.map((e) => EventCard(event: e)),
            ],
          ),
        ),
      ),
    );
  }
}
