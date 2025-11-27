import 'package:flutter/material.dart';
import '../models/event.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  const EventCard({super.key, required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accent = theme.colorScheme.primary;

    // ambil harga tiket pertama (kalau ada)
    double? minPrice = event.tickets.isNotEmpty
        ? event.tickets.first.price
        : null;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul event
            Text(
              event.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),

            // Lokasi
            Row(
              children: [
                const Icon(Icons.place, size: 14, color: Colors.white54),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    event.location,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),

            // Tanggal acara
            Row(
              children: [
                const Icon(Icons.event, size: 14, color: Colors.white54),
                const SizedBox(width: 4),
                Text(
                  '${event.eventDate.day}/${event.eventDate.month}/${event.eventDate.year}',
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Harga mulai
            if (minPrice != null)
              Row(
                children: [
                  Text(
                    'Mulai ',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  Text(
                    'Rp${minPrice.toStringAsFixed(0)}',
                    style: TextStyle(
                      color: accent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    ' / tiket',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
