import 'package:flutter/material.dart';

import '../../../models/customer_model.dart';

class CustomerDetailScreen extends StatefulWidget {
  CustomerDetailScreen({this.customer, super.key});
  Customer? customer;

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {

  String itemType = 'Pant';
  String itemType1 = 'Shirt';
  String itemType2 = 'Shalwar';
  String itemType3 = 'Kameez';


  Widget selectItem(){
    if(widget.customer?.itemType == itemType){
      return Column(
        children: [
          ReusableRow(
            text1: 'pantLength: ',
            text2: widget.customer?.pantLength,
          ),
          ReusableRow(
            text1: 'pantWaist: ',
            text2: widget.customer?.pantWaist,
          ),
          ReusableRow(
            text1: 'pantFly: ',
            text2: widget.customer?.pantFly,
          ),
          ReusableRow(
            text1: 'pantSeat: ',
            text2: widget.customer?.pantSeat,
          ),
          ReusableRow(
            text1: 'pantKnee;: ',
            text2: widget.customer?.pantKnee,
          ),
          ReusableRow(
            text1: 'pantAnkle;: ',
            text2: widget.customer?.pantAnkle,
          ),

        ],
      );
    }
    else if(widget.customer?.itemType==itemType1){
      return Column(
        children: [
          ReusableRow(
            text1: 'shirtLength: ',
            text2: widget.customer?.shirtLength,
          ),
          ReusableRow(
            text1: 'shirtNeck: ',
            text2: widget.customer?.shirtNeck,
          ),
          ReusableRow(
            text1: 'shirtShoulder: ',
            text2: widget.customer?.shirtShoulder,
          ),
          ReusableRow(
            text1: 'shirtChest: ',
            text2: widget.customer?.shirtChest,
          ),
          ReusableRow(
            text1: 'shirtSleeves: ',
            text2: widget.customer?.shirtSleeves,
          ),
          ReusableRow(
            text1: 'shirtSleeveCircum: ',
            text2: widget.customer?.shirtSleeveCircum,
          ),
        ],
      );

    }
    else if(widget.customer?.itemType==itemType2){
      return Column(
        children: [
          ReusableRow(
            text1: 'shalwarLength: ',
            text2: widget.customer?.shalwarLength,
          ),
          ReusableRow(
            text1: 'shalwarWaist: ',
            text2: widget.customer?.shalwarWaist,
          ),
          ReusableRow(
            text1: 'shalwarHip: ',
            text2: widget.customer?.shalwarHip,
          ),
          ReusableRow(
            text1: 'shalwarKnee: ',
            text2: widget.customer?.shalwarKnee,
          ),
          ReusableRow(
            text1: 'shalwarAnkle: ',
            text2: widget.customer?.shalwarAnkle,
          ),

        ],
      );

    }
    else{
      return Column(
        children: [
          ReusableRow(
            text1: 'kameezLength: ',
            text2: widget.customer?.kameezLength,
          ),
          ReusableRow(
            text1: 'kameezShoulder: ',
            text2: widget.customer?.kameezShoulder,
          ),
          ReusableRow(
            text1: 'kameezUpperChest: ',
            text2: widget.customer?.kameezUpperChest,
          ),
          ReusableRow(
            text1: 'kameezBust: ',
            text2: widget.customer?.kameezBust,
          ),
          ReusableRow(
            text1: 'kameezWaist: ',
            text2: widget.customer?.kameezWaist,
          ),
          ReusableRow(
            text1: 'kameezSeat: ',
            text2: widget.customer?.kameezSeat,
          ),
          ReusableRow(
            text1: 'kameezArmhole: ',
            text2: widget.customer?.kameezArmhole,
          ),
          ReusableRow(
            text1: 'kameezSleeveLength: ',
            text2: widget.customer?.kameezSleeveLength,
          ),
          ReusableRow(
            text1: 'kameezSleeveCircumf: ',
            text2: widget.customer?.kameezSleeveCircumf,
          ),
          ReusableRow(
            text1: 'kameezFrontNeck: ',
            text2: widget.customer?.kameezFrontNeck,
          ),
          ReusableRow(
            text1: 'kameezBackNeck: ',
            text2: widget.customer?.kameezBackNeck,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Detail'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            color: Color.fromARGB(255, 197, 194, 194),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Customer Info',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ),
                  ReusableRow(
                    text1: 'Name: ',
                    text2: widget.customer?.customerName,
                  ),
                  ReusableRow(
                    text1: 'Contact No. ',
                    text2: widget.customer?.contactNumber,
                  ),
                  ReusableRow(
                    text1: 'Gender: ',
                    text2: widget.customer?.gender.toString(),
                  ),
                  ReusableRow(text1: 'Email: ', text2: widget.customer!.email),
                  ReusableRow(
                    text1: 'Address:  ',
                    text2: widget.customer?.address,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Customer Measurement',
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Column(
                    children: [
                      selectItem(),

                    ],
                  ),




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget ReusableRow({String? text1, String? text2}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1 ?? 'no data',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Text(
            text2 ?? 'no data',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
