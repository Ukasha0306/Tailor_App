import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:tailor_app/models/customer_model.dart';

import '../../../view_model/services/session_manager.dart';

class CustomersController extends ChangeNotifier {
  DatabaseReference customerRef = FirebaseDatabase.instance
      .ref()
      .child('User')
      .child(SessionController().userId.toString())
      .child('customers');

  Stream<DatabaseEvent> readCustomers() {
    return customerRef.onValue;
  }

  createCustomer(Customer customer) {
    return customerRef.push().set(customer.toMap());
  }

  updateCustomer(String index, Map<String, dynamic> updateValue) async {
    return await customerRef.child('$index').update(updateValue);
  }

  deleteCustomer(String index) async {
    return await customerRef.child('$index').remove();
  }
}
