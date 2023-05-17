import 'package:flutter/material.dart';
import 'package:tailor_app/resources/color.dart';
import 'package:tailor_app/resources/components/round_button.dart';
import 'package:tailor_app/view/dashboard/customers/add_measurement.dart';

import '../../../models/customer_model.dart';

enum ProductTypeEnum { Male, Female }

class NewCustomerScreen extends StatefulWidget {
  const NewCustomerScreen({Key? key}) : super(key: key);

  @override
  State<NewCustomerScreen> createState() => _NewCustomerScreenState();
}

class _NewCustomerScreenState extends State<NewCustomerScreen> {
  final _formKey = GlobalKey<FormState>();
  ProductTypeEnum? _productTypeEnum = ProductTypeEnum.Male;
  final customerController = TextEditingController();
  final contactNumberController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    customerController.dispose();
    contactNumberController.dispose();
    emailController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Enter Customer Details'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(" Customer Name:"),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller:customerController,
                              cursorColor: AppColors.primaryTextTextColor,
                              validator: (value) {
                                return value!.isEmpty ? 'Enter Name' : null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryIconColor)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(" Phone Number#:"),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: contactNumberController,
                              cursorColor: AppColors.primaryTextTextColor,
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Enter Contact Number'
                                    : null;
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: AppColors.primaryIconColor))),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(" Email:"),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: emailController,
                              cursorColor: AppColors.primaryTextTextColor,
                              // validator: (value) {
                              //   return value!.isEmpty ? 'Enter Name' : null;
                              // },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryIconColor)),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text("Customer Address:"),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: addressController,
                              cursorColor: AppColors.primaryTextTextColor,
                              // validator: (value) {
                              //   return value!.isEmpty ? 'Enter Name' : null;
                              // },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: AppColors.primaryIconColor)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: RadioListTile(
                                      selectedTileColor:
                                          AppColors.lightGrayColor,
                                      activeColor: AppColors.primaryIconColor,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      value: ProductTypeEnum.Male,
                                      groupValue: _productTypeEnum,
                                      title: Text(ProductTypeEnum.Male.name),
                                      onChanged: (val) {
                                        setState(() {
                                          _productTypeEnum = val;
                                        });
                                      }),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                      selectedTileColor:
                                          AppColors.lightGrayColor,
                                      activeColor: AppColors.primaryIconColor,
                                      contentPadding: const EdgeInsets.all(0.0),
                                      value: ProductTypeEnum.Female,
                                      groupValue: _productTypeEnum,
                                      title: Text(ProductTypeEnum.Female.name),
                                      onChanged: (val) {
                                        setState(() {
                                          _productTypeEnum = val;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: RoundButton(
                                title: 'Save & Continue',
                                onPress: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    if (customerController.text
                                            .isNotEmpty &&
                                        contactNumberController
                                            .text.isNotEmpty) {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return MeasurementScreen(
                                            customer: Customer(
                                              customerName: customerController.text,
                                              contactNumber: contactNumberController.text,
                                              email: emailController.text,
                                              address:addressController.text,
                                              gender: _productTypeEnum ==
                                                  ProductTypeEnum.Male,
                                            ),
                                          );
                                        },
                                      ));
                                    }
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
