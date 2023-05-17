import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:tailor_app/models/customer_model.dart';
import 'package:tailor_app/resources/color.dart';
import 'package:tailor_app/resources/components/round_button.dart';
import 'package:tailor_app/view/dashboard/customers/customer_controller.dart';
import 'package:tailor_app/view/dashboard/orders/create_order_screen.dart';


class MeasurementScreen extends StatefulWidget {
  MeasurementScreen({this.customer, Key? key}) : super(key: key);
  Customer? customer;

  @override
  State<MeasurementScreen> createState() => _MeasurementScreenState();
}

class _MeasurementScreenState extends State<MeasurementScreen> {
  final _formKey = GlobalKey<FormState>();

  final pantLengthController = TextEditingController();
  final pantWaistController = TextEditingController();
  final pantFlyController = TextEditingController();
  final pantSeatController = TextEditingController();
  final pantKneeController = TextEditingController();
  final pantAnkleController = TextEditingController();
  final shalwarLengthController = TextEditingController();
  final shalwarWaistController = TextEditingController();
  final shalwarHipController = TextEditingController();
  final shalwarKneeController = TextEditingController();
  final shalwarAnkleController = TextEditingController();
  final shirtLengthController = TextEditingController();
  final shirtNeckController = TextEditingController();
  final shirtShoulderController = TextEditingController();
  final shirtChestController = TextEditingController();
  final shirtSleevesController = TextEditingController();
  final shirtSleeveCircumController = TextEditingController();
  final kameezLengthController = TextEditingController();
  final kameezShoulderController = TextEditingController();
  final kameezUpperChestController = TextEditingController();
  final kameezBustController = TextEditingController();
  final kameezWaistController = TextEditingController();
  final kameezSeatController = TextEditingController();
  final kameezArmholeController = TextEditingController();
  final kameezSleeveLengthController = TextEditingController();
  final kameezSleeveCircumfController = TextEditingController();
  final kameezFrontNeckController = TextEditingController();
  final kameezBackNeckController = TextEditingController();

  DatabaseReference ref = FirebaseDatabase.instance.ref().child('User');

  @override
  void dispose() {
    pantLengthController.dispose();
    pantWaistController.dispose();
    pantFlyController.dispose();
    pantSeatController.dispose();
    pantKneeController.dispose();
    pantAnkleController.dispose();
    shalwarLengthController.dispose();
    shalwarWaistController.dispose();
    shalwarHipController.dispose();
    shalwarKneeController.dispose();
    shalwarAnkleController.dispose();
    shirtLengthController.dispose();
    shirtNeckController.dispose();
    shirtShoulderController.dispose();
    shirtChestController.dispose();
    shirtSleevesController.dispose();
    shirtSleeveCircumController.dispose();
    kameezLengthController.dispose();
    kameezShoulderController.dispose();
    kameezUpperChestController.dispose();
    kameezBustController.dispose();
    kameezWaistController.dispose();
    kameezSeatController.dispose();
    kameezArmholeController.dispose();
    kameezSleeveLengthController.dispose();
    kameezSleeveCircumfController.dispose();
    kameezFrontNeckController.dispose();
    kameezBackNeckController.dispose();

    super.dispose();
  }

  List<String> items = [
    'Pant',
    'Shalwar',
    'Shirt',
    'Kameez',
  ];
  String dropdownValue = 'Pant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Add Measurement'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter Details',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 60,
                          width: 140,
                          child: DropdownButtonFormField(
                            iconEnabledColor: Colors.black,
                            dropdownColor: Colors.white,
                            value: dropdownValue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(5.0),
                                ),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primaryIconColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              filled: true,
                            ),
                            borderRadius: BorderRadius.circular(5),
                            style: TextStyle(color: Colors.black),
                            items: items.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (item) {
                              setState(() {});
                              dropdownValue = item!;
                            },
                          ),
                        )
                      ],
                    ),
                    dropdownValue == 'Pant'
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ReuseableRow(
                                image: Image(
                                    width: 60,
                                    image: AssetImage(
                                        'assets/images/pant_length.jpg')),
                                title: 'Length',
                                measurementController: pantLengthController,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                  title: 'Waist',
                                  measurementController: pantWaistController,
                                  image: Image(
                                      width: 60,
                                      image: AssetImage(
                                          'assets/images/pant_waist.jpg'))),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                  measurementController: pantFlyController,
                                  title: 'Fly',
                                  image: Image(
                                      width: 60,
                                      image: AssetImage(
                                          'assets/images/pant_fly.jpg'))),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                  measurementController: pantSeatController,
                                  title: 'Seat',
                                  image: Image(
                                      width: 60,
                                      image: AssetImage(
                                          'assets/images/pant_seat.jpg'))),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: pantKneeController,
                                title: 'Knee',
                                image: Image(
                                    width: 60,
                                    image: AssetImage(
                                        'assets/images/pant_knee.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: pantAnkleController,
                                title: 'Ankle',
                                image: Image(
                                    width: 60,
                                    image: AssetImage(
                                        'assets/images/pant_ankle.jpg')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: RoundButton(
                                    title: 'Save & Continue',
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                      } else
                                        return null;

                                      String dateTime =
                                          DateTime.now().toIso8601String();
                                      debugPrint(
                                          'customerName : ${widget.customer!.customerName}');

                                      var ustomerData = Customer(
                                        dateTime: dateTime,
                                        customerName:
                                            widget.customer?.customerName,
                                        contactNumber:
                                            widget.customer?.contactNumber,
                                        email: widget.customer?.email,
                                        address: widget.customer?.address,
                                        gender: widget.customer?.gender,
                                        pantLength: pantLengthController.text,
                                        pantWaist: pantWaistController.text,
                                        pantFly: pantFlyController.text,
                                        pantSeat: pantSeatController.text,
                                        pantKnee: pantKneeController.text,
                                        pantAnkle: pantAnkleController.text,
                                        itemType: dropdownValue,
                                      );
                                      CustomersController()
                                          .createCustomer(ustomerData);

                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: CreateOrderScreen(),
                                        withNavBar: true,
                                          );
                                    }),
                              )
                            ],
                          )
                        : Container(),
                    dropdownValue == 'Shalwar'
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ReuseableRow(
                                image: Image(
                                    image: AssetImage(
                                        'assets/images/shalwar_length.jpg')),
                                title: 'Shalwar Length',
                                measurementController: shalwarLengthController,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                title: 'Shalwar Waist',
                                measurementController: shalwarWaistController,
                                image: Image(
                                    image: AssetImage(
                                        'assets/images/shalwar_waist.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: shalwarHipController,
                                title: 'Shalwar Hip',
                                image: Image(
                                    image: AssetImage(
                                        'assets/images/shalwar_hip.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: shalwarKneeController,
                                title: 'Knee/Calf',
                                image: Image(
                                    image: AssetImage(
                                        'assets/images/shalwar_knee.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: shalwarAnkleController,
                                title: 'Ankle',
                                image: Image(
                                    image: AssetImage(
                                        'assets/images/shalwar_ankle.jpg')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: RoundButton(
                                    title: 'Save & Continue',
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                      } else
                                        return null;
                                      String dateTime =
                                          DateTime.now().toIso8601String();
                                      debugPrint(
                                          'customerName : ${widget.customer!.customerName}');

                                      var ustomerData = Customer(
                                        dateTime: dateTime,
                                        customerName:
                                            widget.customer?.customerName,
                                        contactNumber:
                                            widget.customer?.contactNumber,
                                        email: widget.customer?.email,
                                        address: widget.customer?.address,
                                        gender: widget.customer?.gender,
                                        shalwarLength:
                                            shalwarLengthController.text,
                                        shalwarWaist:
                                            shalwarWaistController.text,
                                        shalwarHip: shalwarHipController.text,
                                        shalwarKnee: shalwarKneeController.text,
                                        shalwarAnkle:
                                            shalwarAnkleController.text,
                                        itemType: dropdownValue,
                                      );
                                      CustomersController()
                                          .createCustomer(ustomerData);

                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen:  CreateOrderScreen(),
                                        withNavBar: true,
                                          );
                                    }),
                              )
                            ],
                          )
                        : Container(),
                    dropdownValue == 'Shirt'
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ReuseableRow(
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/shirt_length.jpg')),
                                title: 'Length',
                                measurementController: shirtLengthController,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                title: 'Neck',
                                measurementController: shirtNeckController,
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/shirt_neck.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: shirtShoulderController,
                                title: 'Shoulder',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/shirt_shoulder.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: shirtChestController,
                                title: 'Chest',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/shirt_waist.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: shirtSleevesController,
                                title: 'Sleeves',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/shirt_sleeves.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController:
                                    shirtSleeveCircumController,
                                title: 'Sleeve Circum',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/shirt_sleeve_circum.jpg')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: RoundButton(
                                    title: 'Save & Continue',
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                      } else
                                        return null;
                                      String dateTime =
                                          DateTime.now().toIso8601String();
                                      debugPrint(
                                          'customerName : ${widget.customer!.customerName}');

                                      var ustomerData = Customer(
                                        dateTime: dateTime,
                                        customerName:
                                            widget.customer?.customerName,
                                        contactNumber:
                                            widget.customer?.contactNumber,
                                        email: widget.customer?.email,
                                        address: widget.customer?.address,
                                        gender: widget.customer?.gender,
                                        shirtLength: shirtLengthController.text,
                                        shirtNeck: shirtNeckController.text,
                                        shirtShoulder:
                                            shirtShoulderController.text,
                                        shirtChest: shirtChestController.text,
                                        shirtSleeves:
                                            shirtSleevesController.text,
                                        shirtSleeveCircum:
                                            shirtSleeveCircumController.text,
                                        itemType: dropdownValue,
                                      );
                                      CustomersController()
                                          .createCustomer(ustomerData);

                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen:  CreateOrderScreen(),
                                        withNavBar: true,
                                          );
                                    }),
                              )
                            ],
                          )
                        : Container(),
                    dropdownValue == 'Kameez'
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              ReuseableRow(
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_length.jpg')),
                                title: 'Kameez Length',
                                measurementController: kameezLengthController,
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                title: 'Shoulder',
                                measurementController: kameezShoulderController,
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_shoulder.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController:
                                    kameezUpperChestController,
                                title: 'Upper Chest',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_upper_chest.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: kameezBustController,
                                title: 'Bust',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_bust.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: kameezWaistController,
                                title: 'Waist',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_wasit.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: kameezSeatController,
                                title: 'Seat',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_seat.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: kameezArmholeController,
                                title: 'Armhole',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_armhole.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController:
                                    kameezSleeveLengthController,
                                title: 'Sleeve Length',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_Sleeve_length.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController:
                                    kameezSleeveCircumfController,
                                title: 'Sleeve Circumf.',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/Kameez_Circumf.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController:
                                    kameezFrontNeckController,
                                title: 'Front Neck',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_front_neck.jpg')),
                              ),
                              const SizedBox(
                                height: 7,
                              ),
                              ReuseableRow(
                                measurementController: kameezBackNeckController,
                                title: 'Back Neck',
                                image: const Image(
                                    image: AssetImage(
                                        'assets/images/kameez_back_neck.jpg')),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: RoundButton(
                                    title: 'Save & Continue',
                                    onPress: () {
                                      if (_formKey.currentState!.validate()) {
                                      } else
                                        return null;
                                      String dateTime =
                                          DateTime.now().toIso8601String();
                                      debugPrint(
                                          'customerName : ${widget.customer!.customerName}');

                                      var ustomerData = Customer(
                                        dateTime: dateTime,
                                        customerName:
                                            widget.customer?.customerName,
                                        contactNumber:
                                            widget.customer?.contactNumber,
                                        email: widget.customer?.email,
                                        address: widget.customer?.address,
                                        gender: widget.customer?.gender,
                                        kameezLength:
                                            kameezLengthController.text,
                                        kameezShoulder:
                                            kameezShoulderController.text,
                                        kameezUpperChest:
                                            kameezUpperChestController.text,
                                        kameezBust: kameezBustController.text,
                                        kameezWaist: kameezWaistController.text,
                                        kameezSeat: kameezSeatController.text,
                                        kameezArmhole:
                                            kameezArmholeController.text,
                                        kameezSleeveLength:
                                            kameezSleeveLengthController.text,
                                        kameezSleeveCircumf:
                                            kameezSleeveCircumfController.text,
                                        kameezFrontNeck:
                                            kameezFrontNeckController.text,
                                        kameezBackNeck:
                                            kameezBackNeckController.text,
                                        itemType: dropdownValue,
                                      );
                                      CustomersController()
                                          .createCustomer(ustomerData);

                                      PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen:  CreateOrderScreen(),
                                        withNavBar: true,
                                          );
                                    }),
                              )
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ReuseableRow extends StatelessWidget {
  final Image image;
  final String title;
  final TextEditingController measurementController;
  ReuseableRow({
    Key? key,
    required this.image,
    required this.title,
    required this.measurementController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 118,
        width: 448,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white70,
        ),
        child: Card(
          elevation: 70,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(child: image),
                const SizedBox(
                  width: 100,
                ),
                SizedBox(
                  width: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 25),
                        child: Text(title),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 50),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          cursorColor: AppColors.primaryTextTextColor,
                          controller: measurementController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Value';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryIconColor)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
