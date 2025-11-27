import 'package:flutter/material.dart';
import '../../widgets/app_drawer.dart';
import '../../services/event_service.dart';
import '../../models/ticket_type.dart';

class EventFormPage extends StatefulWidget {
  const EventFormPage({super.key});

  @override
  State<EventFormPage> createState() => _EventFormPageState();
}

class _EventFormPageState extends State<EventFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleC = TextEditingController();
  final _descC = TextEditingController();
  final _locC = TextEditingController();
  DateTime _eventDate = DateTime.now().add(const Duration(days: 7));

  // tiket per kelas
  final _vvipPriceC = TextEditingController();
  final _vvipQuotaC = TextEditingController();

  final _vipPriceC = TextEditingController();
  final _vipQuotaC = TextEditingController();

  final _regPriceC = TextEditingController();
  final _regQuotaC = TextEditingController();

  final eventService = EventService();

  @override
  void dispose() {
    _titleC.dispose();
    _descC.dispose();
    _locC.dispose();
    _vvipPriceC.dispose();
    _vvipQuotaC.dispose();
    _vipPriceC.dispose();
    _vipQuotaC.dispose();
    _regPriceC.dispose();
    _regQuotaC.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _eventDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() => _eventDate = date);
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final tickets = <TicketType>[];

    double? _parseDouble(String t) =>
        t.trim().isEmpty ? null : double.tryParse(t);
    int? _parseInt(String t) => t.trim().isEmpty ? null : int.tryParse(t);

    final vvipPrice = _parseDouble(_vvipPriceC.text);
    final vvipQuota = _parseInt(_vvipQuotaC.text);
    if (vvipPrice != null && vvipQuota != null && vvipQuota > 0) {
      tickets.add(TicketType(name: 'VVIP', price: vvipPrice, quota: vvipQuota));
    }

    final vipPrice = _parseDouble(_vipPriceC.text);
    final vipQuota = _parseInt(_vipQuotaC.text);
    if (vipPrice != null && vipQuota != null && vipQuota > 0) {
      tickets.add(TicketType(name: 'VIP', price: vipPrice, quota: vipQuota));
    }

    final regPrice = _parseDouble(_regPriceC.text);
    final regQuota = _parseInt(_regQuotaC.text);
    if (regPrice != null && regQuota != null && regQuota > 0) {
      tickets.add(
        TicketType(name: 'REGULER', price: regPrice, quota: regQuota),
      );
    }

    if (tickets.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Minimal isi salah satu tiket (VVIP/VIP/REGULER).'),
        ),
      );
      return;
    }

    eventService.addEvent(
      title: _titleC.text,
      description: _descC.text,
      location: _locC.text,
      date: _eventDate,
      tickets: tickets,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Event dan tiket berhasil disimpan.')),
    );

    Navigator.pop(context); // kembali ke Event Saya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(title: const Text('Tambah Event & Tiket')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Data Event',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _titleC,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(labelText: 'Nama Event'),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _descC,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi Singkat',
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _locC,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Lokasi / Venue',
                  ),
                  validator: (v) =>
                      (v == null || v.isEmpty) ? 'Wajib diisi' : null,
                ),
                const SizedBox(height: 12),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text(
                    'Tanggal Acara',
                    style: TextStyle(color: Colors.white70),
                  ),
                  subtitle: Text(
                    '${_eventDate.day}/${_eventDate.month}/${_eventDate.year}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.calendar_month, color: Colors.white),
                    onPressed: _pickDate,
                  ),
                ),
                const SizedBox(height: 24),
                const Divider(color: Colors.white24),
                const SizedBox(height: 8),
                const Text(
                  'Tiket per Kelas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                // VVIP
                const Text(
                  'VVIP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _vvipPriceC,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Harga VVIP',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _vvipQuotaC,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Kuota VVIP',
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // VIP
                const Text(
                  'VIP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _vipPriceC,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Harga VIP',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _vipQuotaC,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Kuota VIP',
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // REGULER
                const Text(
                  'REGULER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _regPriceC,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Harga Reguler',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: _regQuotaC,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Kuota Reguler',
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _save,
                    child: const Text('Simpan Event & Tiket'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
