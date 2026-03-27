import '../models/order_model.dart';

class OrderRepository {
  Future<List<OrderModel>> fetchOrders() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Dummy Data
    return [
      OrderModel(id: 'ORD-10023', date: '12 Okt 2026', total: 120000, status: 'Processing', itemQty: 3),
      OrderModel(id: 'ORD-10022', date: '05 Okt 2026', total: 450000, status: 'Delivered', itemQty: 1),
      OrderModel(id: 'ORD-10021', date: '28 Sep 2026', total: 75000, status: 'Delivered', itemQty: 2),
      OrderModel(id: 'ORD-10020', date: '10 Sep 2026', total: 320000, status: 'Cancelled', itemQty: 5),
    ];
  }
}
