enum OrderStatus { pending, paid, cancelled }

class OrderModel {
  final String id;
  final String userId;
  final String eventId;
  final String ticketTypeId;
  final int quantity;
  final double totalPrice;
  OrderStatus status;
  final DateTime createdAt;

  OrderModel({
    required this.id,
    required this.userId,
    required this.eventId,
    required this.ticketTypeId,
    required this.quantity,
    required this.totalPrice,
    this.status = OrderStatus.paid,
    required this.createdAt,
  });
}
