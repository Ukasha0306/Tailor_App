import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/resources/color.dart';
import 'package:tailor_app/resources/components/round_button.dart';
import 'package:tailor_app/utils/routes/utils.dart';
import 'package:tailor_app/view/dashboard/customers/new_customer.dart';
import 'package:tailor_app/view/dashboard/home/home_screen.dart';
import 'package:tailor_app/view/dashboard/orders/orders_controller.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import '../../../models/order_model.dart';
import '../customers/customer_controller.dart';
import 'order_screen.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');
  DateTime? dueDateTime;
  String? selectedTime;
  String? customerName;

  String itemType = 'Pant';
  String customerId = '';
  String itemType1 = 'Shirt';
  String customerId1 = '';
  String itemType2 = 'Shalwar';
  String customerId2 = '';
  String itemType3 = 'Kameez';
  String customerId3= '';

  final textStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  @override
  void initState() {
    selectedTime;
    customerName;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create an Order'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Card(
              elevation: 8,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Customer Name: ', style: textStyle),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: [
                                        Center(
                                          child: Text(
                                            'Select Customer',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Divider(),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height /
                                              2,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width /
                                              1.4,
                                          child: StreamBuilder(
                                            stream: CustomersController()
                                                .readCustomers(),
                                            builder: (context,
                                                AsyncSnapshot<DatabaseEvent>
                                                snapshot) {
                                              if (!snapshot.hasData) {
                                                return const Center(
                                                    child:
                                                    CircularProgressIndicator(color: Colors.white,));
                                              } else if (snapshot.data ==
                                                  null ||
                                                  snapshot.data?.snapshot
                                                      .value ==
                                                      null) {
                                                return Center(
                                                  child: Text(
                                                      "Please add a customer."),
                                                );
                                              } else {
                                                var data = snapshot.data!
                                                    .snapshot.value as Map;

                                                List list = [];
                                                List list2 = [];
                                                list2 = data.keys.toList();
                                                list.clear();
                                                list = data.values.toList();

                                                return ListView.builder(
                                                  itemCount: list.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    var customer = list[index];

                                                    return Card(
                                                      child: ListTile(
                                                        leading: Container(
                                                          height: 40,
                                                          width: 40,
                                                          decoration:
                                                          BoxDecoration(
                                                            border: Border.all(
                                                              color: AppColors
                                                                  .primaryButtonColor,
                                                            ),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Icon(
                                                            Icons
                                                                .person_outline,
                                                            color: AppColors
                                                                .primaryIconColor,
                                                          ),
                                                        ),
                                                        title: Text(
                                                          customer[
                                                          'customerName'],
                                                        ),
                                                        subtitle: Text(customer[
                                                        'contactNumber']),
                                                        onTap: () {
                                                          setState(() {});
                                                          customerId =
                                                          list2[index];
                                                          customerName = customer[
                                                          'customerName'];

                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text(
                                  customerName != null
                                      ? customerName!
                                      : 'select customer',
                                  style: textStyle),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Due Date: ', style: textStyle),
                            InkWell(
                              onTap: () {
                                DatePicker.showDatePicker(
                                  context,
                                  pickerTheme: DateTimePickerTheme.Default,
                                  minDateTime: DateTime.now(),
                                  initialDateTime: DateTime.now(),
                                  pickerMode: DateTimePickerMode.time,
                                  dateFormat: 'dd-MM-yyyy',
                                  onChange: (dateTime, selectedIndex) {
                                    setState(() {});
                                    dueDateTime = dateTime;
                                    selectedIndex;
                                    selectedTime = DateFormat("dd-MM-yyyy")
                                        .format(dueDateTime!);
                                    dateTime.toString();
                                  },
                                );
                              },
                              child: Text(
                                  selectedTime != null
                                      ? selectedTime!
                                      : 'select time',
                                  style: textStyle),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Item Type: ', style: textStyle),
                            SizedBox(
                              height: 60,
                              width: 100,
                              child: DropdownButtonFormField(
                                value: itemType,
                                decoration: InputDecoration(
                                    filled: true, fillColor: Colors.grey[100],
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.primaryIconColor,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(8))
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(5),


                                style: TextStyle(color: Colors.black),

                                items: ['Pant', 'Shirt', 'Shalwar','Kameez'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (item) {
                                  setState(() {});
                                  itemType = item!;
                                  itemType1=item;
                                  itemType2=item;
                                  itemType3=item;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    RoundButton(
                      title: 'Submit Order',
                      onPress: () {

                        if (selectedTime != null &&
                            customerName != null &&
                            selectedTime != 'select time' &&
                            customerName != 'select customer')
                        {
                          var order = Order(
                            customerId: customerId,
                            timeStamp: DateTime.now(),
                            itemType: itemType,
                            customerName: customerName.toString(),
                            orderId: Uuid().v4(),
                            orderStatus: 'Pending',
                            dueDate: selectedTime!,
                          );

                          setState(() {
                            customerName = 'select customer';
                            selectedTime = 'select time';
                          });
                          Utils.toastMessage('Order submit Successfully');

                          OrderController().createOrder(order);
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: const HomeScreen(),
                            withNavBar: true,
                          );



                        } else {

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                             padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              content: Text('please choose above fields')));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future addCustomer(context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 130,
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
                      child: Icon(Icons.add, color: AppColors.whiteColor)),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text('Select a Phone Contact'),
                  leading: const CircleAvatar(
                      radius: 13,
                      backgroundColor: AppColors.primaryIconColor,
                      child: Icon(Icons.person, color: AppColors.whiteColor)),
                ),
              ],
            ),
          ),
        );
      });
}
