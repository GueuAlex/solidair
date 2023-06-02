enum OrderStatus { PICKING_UP, DELIVERING }

class Order {
  final int id;
  final String title;
  final bool status;
  final DateTime arrivalDate;
  final DateTime placedDate;
  final String deliveryAddress;

  Order({
    required this.id,
    required this.title,
    this.status = false,
    required this.arrivalDate,
    required this.placedDate,
    required this.deliveryAddress,
  });
}
