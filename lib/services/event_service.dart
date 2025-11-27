import '../models/event.dart';
import '../models/ticket_type.dart';

class EventService {
  static final EventService _instance = EventService._internal();
  factory EventService() => _instance;
  EventService._internal();

  final List<EventModel> _events = [];

  List<EventModel> get events => List.unmodifiable(_events);

  void addEvent({
    required String title,
    required String description,
    required String location,
    required DateTime date,
    required List<TicketType> tickets,
  }) {
    final event = EventModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      location: location,
      eventDate: date,
      tickets: tickets,
    );
    _events.add(event);
  }
}
