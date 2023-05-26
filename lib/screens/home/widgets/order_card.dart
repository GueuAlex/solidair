import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;

  OrderCard({super.key, required this.order});

  // For formatting date
  final DateFormat formatter = DateFormat("yyyy MM dd");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // nextScreen(context, "/single-order");
      },
      child: Container(
        height: 121,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: const Color.fromRGBO(220, 233, 245, 1),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getOrderIconWidget(order.status),
            const SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getOrderStatusText(order.status),
                    style: const TextStyle(
                      color: Color.fromRGBO(19, 22, 33, 1),
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  textRow("Placed On", formatter.format(order.placedDate)),
                  const SizedBox(
                    height: 5.0,
                  ),
                  textRow("Delivery On", formatter.format(order.arrivalDate))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textRow(String textOne, String textTwo) {
  return Wrap(
    children: [
      Text(
        "$textOne:",
        style: const TextStyle(
          color: Color.fromRGBO(74, 77, 84, 0.7),
          fontSize: 14.0,
        ),
      ),
      const SizedBox(
        width: 4.0,
      ),
      Text(
        textTwo,
        style: const TextStyle(
          color: Color.fromRGBO(19, 22, 33, 1),
          fontSize: 14.0,
        ),
      ),
    ],
  );
}

Widget getOrderIconWidget(OrderStatus status) {
  switch (status) {
    case OrderStatus.PICKING_UP:
      return Container(
        width: 37,
        height: 37,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(221, 40, 81, 0.18),
        ),
        child: const Icon(
          //FlutterIcons.loader_fea,
          Icons.history,
          color: Color.fromRGBO(221, 40, 81, 1),
        ),
      );
    case OrderStatus.DELIVERING:
      return Container(
        width: 37,
        height: 37,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(255, 99, 2, 0.15),
        ),
        child: const Icon(
          //FlutterIcons.history_mdi,
          Icons.book,
          color: Color.fromRGBO(255, 99, 2, 1),
        ),
      );
    default:
      return Container(
        width: 37,
        height: 37,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(221, 40, 81, 0.18),
        ),
        child: const Icon(
          // FlutterIcons.loader_fea,
          Icons.abc,
          color: Color.fromRGBO(221, 40, 81, 1),
        ),
      );
  }
}

String getOrderStatusText(OrderStatus status) {
  switch (status) {
    case OrderStatus.DELIVERING:
      return "Delivering Order";
    case OrderStatus.PICKING_UP:
      return "Picking Up Order";
    default:
      return "";
  }
}
