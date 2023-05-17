import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/resources/color.dart';
import 'package:tailor_app/view/dashboard/customers/new_customer.dart';
import 'dart:async';
import '../../../../../view_model/services/session_manager.dart';
import '../../../models/customer_model.dart';
import 'customer_controller.dart';
import 'customer_detail_screen.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({Key? key}) : super(key: key);

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  late Customer customer;


  Future<void> addCustomer(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 60,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const NewCustomerScreen(),
                      withNavBar: false,
                    );
                  },
                  title: const Text('Add New Customer'),
                  leading: const CircleAvatar(
                    radius: 13,
                    backgroundColor: AppColors.primaryIconColor,
                    child: Icon(Icons.add, color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Customer List'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => addCustomer(context),
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: StreamBuilder(
            stream: CustomersController().readCustomers(),
            builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ));
              } else if (snapshot.data == null ||
                  snapshot.data?.snapshot.value == null) {
                return Center(
                  child: Text("Please add a  customer data."),
                );
              } else {
                var data = snapshot.data?.snapshot.value as Map;

                List list = [];
                List list2 = [];
                list2 = data.keys.toList();
                list.clear();
                list = data.values.toList();

                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      var customer = list[index];

                      SessionController().customerCount = list.length;
                      debugPrint('list is ${list.length}');

                      return Card(
                          child: ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.primaryButtonColor),
                                  shape: BoxShape.rectangle,
                                ),
                                child: Icon(
                                  Icons.person_outline,
                                  color: AppColors.primaryIconColor,
                                ),
                              ),
                              title: Text(customer['customerName'].toString()),
                              subtitle: Text(customer['contactNumber']),
                              trailing: IconButton(
                                onPressed: () {
                                  CustomersController()
                                      .deleteCustomer(list2[index]);
                                },
                                icon: Icon(Icons.delete_forever),
                              ),
                              onTap: () {
                                customer = Customer(
                                  customerName: list[index]['customerName'],
                                  contactNumber: list[index]['contactNumber'],
                                  email: list[index]['email'],
                                  address: list[index]['address'],
                                  gender: list[index]['gender'],
                                  itemType: list[index]['itemType'],
                                  dateTime: list[index]['dateTime'],
                                  pantLength: list[index]['pantLength'],
                                  pantWaist: list[index]['pantWaist'],
                                  pantFly: list[index]['pantFly'],
                                  pantSeat: list[index]['pantSeat'],
                                  pantKnee: list[index]['pantKnee'],
                                  pantAnkle: list[index]['pantAnkle'],
                                  shalwarLength: list[index]['shalwarLength'],
                                  shalwarWaist: list[index]['shalwarWaist'],
                                  shalwarHip: list[index]['shalwarHip'],
                                  shalwarKnee: list[index]['shalwarKnee'],
                                  shalwarAnkle: list[index]['shalwarAnkle'],
                                  shirtLength: list[index]['shirtLength'],
                                  shirtNeck: list[index]['shirtNeck'],
                                  shirtShoulder: list[index]['shirtShoulder'],
                                  shirtChest: list[index]['shirtChest'],
                                  shirtSleeves: list[index]['shirtSleeves'],
                                  shirtSleeveCircum: list[index]
                                  ['shirtSleeveCircum'],
                                  kameezLength: list[index]['kameezLength'],
                                  kameezShoulder: list[index]['kameezShoulder'],
                                  kameezUpperChest: list[index]
                                  ['kameezUpperChest'],
                                  kameezBust: list[index]['kameezBust'],
                                  kameezWaist: list[index]['kameezWaist'],
                                  kameezSeat: list[index]['kameezSeat'],
                                  kameezArmhole: list[index]['kameezArmhole'],
                                  kameezSleeveLength: list[index]
                                  ['kameezSleeveLength'],
                                  kameezSleeveCircumf: list[index]
                                  ['kameezSleeveCircumf'],
                                  kameezFrontNeck: list[index]
                                  ['kameezFrontNeck'],
                                  kameezBackNeck: list[index]['kameezBackNeck'],
                                );

                                if (customer != null) {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return CustomerDetailScreen(
                                          customer: customer);
                                    },
                                  ));
                                }
                                ;
                              }));
                    });
              }
            }));
  }
}