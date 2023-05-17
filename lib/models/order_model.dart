import 'dart:convert';

class Order {
  String customerName;
  String customerId;
  String orderId;
  String orderStatus;
  String dueDate;
  DateTime timeStamp;
  String itemType;

  Order({
    required this.customerName,
    required this.customerId,
    required this.orderId,
    required this.orderStatus,
    required this.dueDate,
    required this.timeStamp,
    required this.itemType,
  });

  Order copyWith({
    String? customerName,
    String? customerId,
    String? orderId,
    String? orderStatus,
    String? dueDate,
    DateTime? timeStamp,
    String? itemType,
  }) {
    return Order(
      customerName: customerName ?? this.customerName,
      customerId: customerId ?? this.customerId,
      orderId: orderId ?? this.orderId,
      orderStatus: orderStatus ?? this.orderStatus,
      dueDate: dueDate ?? this.dueDate,
      timeStamp: timeStamp ?? this.timeStamp,
      itemType: itemType ?? this.itemType,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'customerName': customerName});
    result.addAll({'customerId': customerId});
    result.addAll({'orderId': orderId});
    result.addAll({'orderStatus': orderStatus});
    result.addAll({'dueDate': dueDate});
    result.addAll({'timeStamp': timeStamp.millisecondsSinceEpoch});
    result.addAll({'itemType': itemType});

    return result;
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      customerName: map['customerName'] ?? '',
      customerId: map['customerId'] ?? '',
      orderId: map['orderId'] ?? '',
      orderStatus: map['orderStatus'] ?? '',
      dueDate: map['dueDate'] ?? '',
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp']),
      itemType: map['itemType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(customerName: $customerName, customerId: $customerId, orderId: $orderId, orderStatus: $orderStatus, dueDate: $dueDate, timeStamp: $timeStamp, itemType: $itemType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        other.customerName == customerName &&
        other.customerId == customerId &&
        other.orderId == orderId &&
        other.orderStatus == orderStatus &&
        other.dueDate == dueDate &&
        other.timeStamp == timeStamp &&
        other.itemType == itemType;
  }

  @override
  int get hashCode {
    return customerName.hashCode ^
        customerId.hashCode ^
        orderId.hashCode ^
        orderStatus.hashCode ^
        dueDate.hashCode ^
        timeStamp.hashCode ^
        itemType.hashCode;
  }
}
