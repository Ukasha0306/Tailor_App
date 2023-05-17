import 'package:flutter/material.dart';
import 'package:tailor_app/extension.dart';

import '../../../../../utils/listcard.dart';
import '../../orders_controller.dart';

class ActiveOrder extends StatefulWidget {
  const ActiveOrder({Key? key}) : super(key: key);

  @override
  State<ActiveOrder> createState() => _ActiveOrderState();
}

class _ActiveOrderState extends State<ActiveOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: OrderController().readOrders('Active'),
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
                  checkStatus: 'Complete/Deliver',
                  onTap: () {
                    setState(() {});
                    OrderController().orderUpdate(
                      orderIndex,
                      {"orderStatus": "Completed"},
                    );
                  });
            },
          );
        }
      },
    );
  }
}
