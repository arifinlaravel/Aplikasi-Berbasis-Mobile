import '../models/order.dart';

class OrderService {
  final List<OrderModel> _orders = [];

  List<OrderModel> getOrdersByUser(String userId) {
    return _orders.where((o) => o.userId == userId).toList();
  }

  List<OrderModel> getAllOrders() => _orders;

  void addOrder(OrderModel order) {
    _orders.add(order);
  }

  void updateStatus(String orderId, OrderStatus status) {
    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _orders[index].status = status;
    }
  }
}
