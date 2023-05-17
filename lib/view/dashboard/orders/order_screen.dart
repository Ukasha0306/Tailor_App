import 'package:flutter/material.dart';
import 'package:tailor_app/view/dashboard/orders/tabs/active_orders/active_order.dart';
import 'package:tailor_app/view/dashboard/orders/tabs/delivered_orders/delivered_order.dart';
import 'package:tailor_app/view/dashboard/orders/tabs/upcoming_order/upcoming_order.dart';

import '../../../resources/color.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order List'),
        ),
        body: Column(
          children: [
            TabBar(
                labelColor: Colors.black,
                indicatorColor: AppColors.primaryTextTextColor,
                tabs: [
                  Tab(text: 'Upcoming Order'),
                  Tab(text: 'Active Order'),
                  Tab(text: 'Delivered Order'),
                ]),
            Expanded(
              child: TabBarView

                (children: [
                UpComingOrder(),
                ActiveOrder(),
                DeliveredOrder(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
