import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../resources/color.dart';
import '../../../view_model/services/session_manager.dart';
import '../customers/customerlist_screen.dart';
import '../orders/order_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const kMainColor = Color(0xFF567DF4);
const kGreyTextColor = Color(0xFF9090AD);
const kBorderColorTextField = Color(0xFFC2C2C2);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF22215B);
const kAlertColor = Color(0xFFFF8919);
const kBgColor = Color(0xFFFAFAFA);
const kHalfDay = Color(0xFFE8B500);
const kGreenColor = Color(0xFF08BC85);
const kGreenColor2 = Color(0xFF4CE364);

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  String totalCustomer = SessionController().customerCount.toString();
  final ref = FirebaseDatabase.instance.ref('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.dialogAlertBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.dialogAlertBackgroundColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: StreamBuilder(
            stream: ref
                .child(SessionController().userId.toString())
                .onValue,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator(color: Colors.white,));
              } else if (snapshot.hasData) {
                Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text('Hello,  ${map['userName']}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500)),
                  ),
                );
              } else {
                return Text('something went wrong');
              }
            }),
      ),
      body: loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 100.0),
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: kBgColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 60.0),
                  Card(
                    elevation: 6,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60.0,
                                child: Text(
                                  'Manage Your Tailor Shop',
                                  style: TextStyle(
                                    color: AppColors.dialogAlertBackgroundColor,
                                    fontSize: 24.0,
                                    fontFamily: 'SF-Pro-Display-Medium',
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                         Wrap(
                           spacing: 5.0,
                           runSpacing: 5,
                           direction: Axis.vertical,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 ReuseableRow(text: 'View Customers', onPress: () {
                                   PersistentNavBarNavigator.pushNewScreen(context, screen: CustomersScreen());
                                 },),
                                 ReuseableRow(text: 'View Orders', onPress: () {
                                   PersistentNavBarNavigator.pushNewScreen(context, screen: OrderScreen());
                                 },),
                               ],
                             ),
                           ]
                         ),

                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {

  final String text;
  final VoidCallback onPress;
  const ReuseableRow({Key? key, required this.text, required this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: onPress,
      child: Card(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: AppColors.dialogAlertBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 17, fontFamily: 'SF-Pro-Display-Bold'),)),
            ],
          ),
        ),
      ),
    );
  }
}


