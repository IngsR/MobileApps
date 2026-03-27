class OrderModel {
  final String id;
  final String date;
  final double total;
  final String status;
  final int itemQty;

  OrderModel({
    required this.id,
    required this.date,
    required this.total,
    required this.status,
    required this.itemQty,
  });
}
