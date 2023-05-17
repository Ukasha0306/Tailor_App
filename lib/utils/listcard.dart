import 'package:flutter/material.dart';

import '../resources/color.dart';

class ReusableOrderListCard extends StatelessWidget {
  ReusableOrderListCard(
      {required this.name,
      required this.dueDate,
      required this.orderId,
      required this.orderStatus,
      this.checkStatus,
      this.onTap,
      super.key});
  String name;
  String dueDate;
  String orderId;
  String orderStatus;
  String? checkStatus;
  void Function()? onTap;
  final textStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: 60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: textStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(dueDate, style: textStyle),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('orderId #$orderId', style: textStyle),
                  Row(
                    children: [
                      Text(
                        orderStatus,
                        style: textStyle.copyWith(
                            fontWeight: FontWeight.w600, color: AppColors.secondaryColor),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: onTap,
                        child: Text(
                          checkStatus!,
                          style: textStyle.copyWith(
                              fontWeight: FontWeight.w600, color: AppColors.dialogAlertBackgroundColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
