import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/models/order_model.dart';

import '../../../view_model/services/session_manager.dart';

class OrderController extends ChangeNotifier {
  DatabaseReference orderRef = FirebaseDatabase.instance
      .ref()
      .child('User')
      .child(SessionController().userId.toString())
      .child('orders');

  Stream<DatabaseEvent> readOrders(String? filterBy) {
    return orderRef.orderByChild('orderStatus').equalTo(filterBy).onValue;
  }

  createOrder(Order order) {
    return orderRef.push().set(order.toMap());
  }

  orderUpdate(String index, Map<String, dynamic> updateValue) async {
    return await orderRef.child('$index').update(updateValue);
  }

  orderDelete(String index) async {
    return await orderRef.child('$index').remove();
  }
}
