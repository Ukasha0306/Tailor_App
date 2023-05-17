import 'package:flutter/material.dart';
import 'package:tailor_app/extension.dart';
import 'package:tailor_app/utils/listcard.dart';
import 'package:tailor_app/view/dashboard/orders/orders_controller.dart';

class DeliveredOrder extends StatefulWidget {
  const DeliveredOrder({Key? key}) : super(key: key);

  @override
  State<DeliveredOrder> createState() => _DeliveredOrderState();
}

class _DeliveredOrderState extends State<DeliveredOrder> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: OrderController().readOrders('Completed'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
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
                checkStatus: 'Delete',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Do you really want to delete it?'),
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('No'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey
                            ),
                            onPressed: () {
                              setState(() {});
                              OrderController().orderDelete(orderIndex);
                              Navigator.pop(context);
                            },
                            child: Text('Yes',style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14),),
                          )
                        ],
                        actionsAlignment: MainAxisAlignment.spaceAround,
                      );
                    },
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
