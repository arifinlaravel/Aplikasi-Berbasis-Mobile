import 'ticket_type.dart';

class EventModel {
  final String id;
  final String title;
  final String description;
  final String location;
  final DateTime eventDate;
  final List<TicketType> tickets;

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.eventDate,
    required this.tickets,
  });
}
