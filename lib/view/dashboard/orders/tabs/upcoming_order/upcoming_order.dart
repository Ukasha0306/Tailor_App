import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/extension.dart';
import 'package:tailor_app/utils/listcard.dart';
import 'package:tailor_app/view/dashboard/orders/tabs/active_orders/active_order.dart';

import '../../orders_controller.dart';

class UpComingOrder extends StatefulWidget {
  const UpComingOrder({Key? key}) : super(key: key);

  @override
  State<UpComingOrder> createState() => _UpComingOrderState();
}

class _UpComingOrderState extends State<UpComingOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: OrderController().readOrders('Pending'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.white,));
        } else if (snapshot.data == null ||
            snapshot.data?.snapshot.value == null) {
          return Center(child: Text('No Order Found'));
        } else {
          var data = snapshot.data!.snapshot.value as Map;
          List ordersList = [];
          List orderKey = [];
          ordersList = data.values.toList();
          orderKey = data.keys.toList();

          return ListView.builder(
            itemCount: ordersList.length,
            itemBuilder: (context, index) {
              var order = ordersList[index];
              String orderId = order['orderId'];
              String orderIndex = orderKey[index];

              return ReusableOrderListCard(
                  name: order['customerName'],
                  dueDate: order['dueDate'],
                  orderId: orderId.toSplitAtzeroIndex,
                  orderStatus: order['orderStatus'],
                  checkStatus: 'Approve',
                  onTap: () {
                    OrderController().orderUpdate(
                      orderIndex,
                      {"orderStatus": "Active"},
                    );
                  });
            },
          );
        }
      },
    );
  }
}
