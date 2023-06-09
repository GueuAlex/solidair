import 'package:flutter/material.dart';

import '../../../config/palette.dart';
import '../../../models/order.dart';
import 'order_card.dart';

class LatestOrders extends StatelessWidget {
  final List<Order> orders = [
    Order(
      id: 507,
      deliveryAddress: "New Times Square",
      arrivalDate: DateTime(2020, 1, 23),
      placedDate: DateTime(2020, 1, 17),
      title: 'Demande de prêt',
    ),
    Order(
      id: 536,
      deliveryAddress: "Victoria Square",
      arrivalDate: DateTime(2020, 1, 21),
      placedDate: DateTime(2020, 1, 19),
      title: 'Demande de soutien',
      status: true,
    )
  ];

  LatestOrders({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Mes demandes",
                style: TextStyle(
                  color: Color.fromRGBO(19, 22, 33, 1),
                  fontSize: 18.0,
                ),
              ),
              Text(
                "Voir Tout",
                style: TextStyle(
                  color: Palette.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            // Lets pass the order to a new widget and render it there
            return OrderCard(
              order: orders[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 15.0,
            );
          },
          itemCount: orders.length,
        )
        // Let's create an order model
      ],
    );
  }
}
