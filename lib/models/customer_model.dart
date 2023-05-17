// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Customer {
  String? dateTime;
  String? customerName;
  String? contactNumber;
  String? email;
  String? address;
  bool? gender;
  String? pantLength;
  String? pantWaist;
  String? pantFly;
  String? pantSeat;
  String? pantKnee;
  String? pantAnkle;
  String? shalwarLength;
  String? shalwarWaist;
  String? shalwarHip;
  String? shalwarKnee;
  String? shalwarAnkle;
  String? shirtLength;
  String? shirtNeck;
  String? shirtShoulder;
  String? shirtChest;
  String? shirtSleeves;
  String? shirtSleeveCircum;
  String? kameezLength;
  String? kameezShoulder;
  String? kameezUpperChest;
  String? kameezBust;
  String? kameezWaist;
  String? kameezSeat;
  String? kameezArmhole;
  String? kameezSleeveLength;
  String? kameezSleeveCircumf;
  String? kameezFrontNeck;
  String? kameezBackNeck;
  String? itemType;

  Customer({
    this.dateTime,
    required this.customerName,
    required this.contactNumber,
    required this.email,
    required this.address,
    required this.gender,
    this.pantLength,
    this.pantWaist,
    this.pantFly,
    this.pantSeat,
    this.pantKnee,
    this.pantAnkle,
    this.shalwarLength,
    this.shalwarWaist,
    this.shalwarHip,
    this.shalwarKnee,
    this.shalwarAnkle,
    this.shirtLength,
    this.shirtNeck,
    this.shirtShoulder,
    this.shirtChest,
    this.shirtSleeves,
    this.shirtSleeveCircum,
    this.kameezLength,
    this.kameezShoulder,
    this.kameezUpperChest,
    this.kameezBust,
    this.kameezWaist,
    this.kameezSeat,
    this.kameezArmhole,
    this.kameezSleeveLength,
    this.kameezSleeveCircumf,
    this.kameezFrontNeck,
    this.kameezBackNeck,
    this.itemType,
  });

  Customer copyWith({
    String? dateTime,
    String? customerName,
    String? contactNumber,
    String? email,
    String? address,
    bool? gender,
    String? pantLength,
    String? pantWaist,
    String? pantFly,
    String? pantSeat,
    String? pantKnee,
    String? pantAnkle,
    String? shalwarLength,
    String? shalwarWaist,
    String? shalwarHip,
    String? shalwarKnee,
    String? shalwarAnkle,
    String? shirtLength,
    String? shirtNeck,
    String? shirtShoulder,
    String? shirtChest,
    String? shirtSleeves,
    String? shirtSleeveCircum,
    String? kameezLength,
    String? kameezShoulder,
    String? kameezUpperChest,
    String? kameezBust,
    String? kameezWaist,
    String? kameezSeat,
    String? kameezArmhole,
    String? kameezSleeveLength,
    String? kameezSleeveCircumf,
    String? kameezFrontNeck,
    String? kameezBackNeck,
    String? itemType,
  }) {
    return Customer(
      dateTime: dateTime ?? this.dateTime,
      customerName: customerName ?? this.customerName,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      address: address ?? this.address,
      gender: gender ?? this.gender,
      pantLength: pantLength ?? this.pantLength,
      pantWaist: pantWaist ?? this.pantWaist,
      pantFly: pantFly ?? this.pantFly,
      pantSeat: pantSeat ?? this.pantSeat,
      pantKnee: pantKnee ?? this.pantKnee,
      pantAnkle: pantAnkle ?? this.pantAnkle,
      shalwarLength: shalwarLength ?? this.shalwarLength,
      shalwarWaist: shalwarWaist ?? this.shalwarWaist,
      shalwarHip: shalwarHip ?? this.shalwarHip,
      shalwarKnee: shalwarKnee ?? this.shalwarKnee,
      shalwarAnkle: shalwarAnkle ?? this.shalwarAnkle,
      shirtLength: shirtLength ?? this.shirtLength,
      shirtNeck: shirtNeck ?? this.shirtNeck,
      shirtShoulder: shirtShoulder ?? this.shirtShoulder,
      shirtChest: shirtChest ?? this.shirtChest,
      shirtSleeves: shirtSleeves ?? this.shirtSleeves,
      shirtSleeveCircum: shirtSleeveCircum ?? this.shirtSleeveCircum,
      kameezLength: kameezLength ?? this.kameezLength,
      kameezShoulder: kameezShoulder ?? this.kameezShoulder,
      kameezUpperChest: kameezUpperChest ?? this.kameezUpperChest,
      kameezBust: kameezBust ?? this.kameezBust,
      kameezWaist: kameezWaist ?? this.kameezWaist,
      kameezSeat: kameezSeat ?? this.kameezSeat,
      kameezArmhole: kameezArmhole ?? this.kameezArmhole,
      kameezSleeveLength: kameezSleeveLength ?? this.kameezSleeveLength,
      kameezSleeveCircumf: kameezSleeveCircumf ?? this.kameezSleeveCircumf,
      kameezFrontNeck: kameezFrontNeck ?? this.kameezFrontNeck,
      kameezBackNeck: kameezBackNeck ?? this.kameezBackNeck,
      itemType: itemType ?? this.itemType,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (dateTime != null) {
      result.addAll({'dataTime': dateTime});
    }
    if (customerName != null) {
      result.addAll({'customerName': customerName});
    }
    if (contactNumber != null) {
      result.addAll({'contactNumber': contactNumber});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (gender != null) {
      result.addAll({'gender': gender});
    }
    if (pantLength != null) {
      result.addAll({'pantLength': pantLength});
    }

    if (pantWaist != null) {
      result.addAll({'pantWaist': pantWaist});
    }

    if (pantFly != null) {
      result.addAll({'pantFly': pantFly});
    }

    if (pantSeat != null) {
      result.addAll({'pantSeat': pantSeat});
    }

    if (pantKnee != null) {
      result.addAll({'pantKnee': pantKnee});
    }

    if (pantAnkle != null) {
      result.addAll({'pantAnkle': pantAnkle});
    }

    if (shalwarLength != null) {
      result.addAll({'shalwarLength': shalwarLength});
    }

    if (shalwarWaist != null) {
      result.addAll({'shalwarWaist': shalwarWaist});
    }

    if (shalwarHip != null) {
      result.addAll({'shalwarHip': shalwarHip});
    }

    if (shalwarKnee != null) {
      result.addAll({'shalwarKnee': shalwarKnee});
    }

    if (shalwarAnkle != null) {
      result.addAll({'shalwarAnkle': shalwarAnkle});
    }

    if (shirtLength != null) {
      result.addAll({'shirtLength': shirtLength});
    }

    if (shirtNeck != null) {
      result.addAll({'shirtNeck': shirtNeck});
    }

    if (shirtShoulder != null) {
      result.addAll({'shirtShoulder': shirtShoulder});
    }

    if (shirtChest != null) {
      result.addAll({'shirtChest': shirtChest});
    }

    if (shirtSleeves != null) {
      result.addAll({'shirtSleeves': shirtSleeves});
    }

    if (shirtSleeveCircum != null) {
      result.addAll({'shirtSleeveCircum': shirtSleeveCircum});
    }

    if (kameezLength != null) {
      result.addAll({'kameezLength': kameezLength});
    }

    if (kameezShoulder != null) {
      result.addAll({'kameezShoulder': kameezShoulder});
    }

    if (kameezUpperChest != null) {
      result.addAll({'kameezUpperChest': kameezUpperChest});
    }

    if (kameezBust != null) {
      result.addAll({'kameezBust': kameezBust});
    }

    if (kameezWaist != null) {
      result.addAll({'kameezWaist': kameezWaist});
    }

    if (kameezSeat != null) {
      result.addAll({'kameezSeat': kameezSeat});
    }

    if (kameezArmhole != null) {
      result.addAll({'kameezArmhole': kameezArmhole});
    }

    if (kameezSleeveLength != null) {
      result.addAll({'kameezSleeveLength': kameezSleeveLength});
    }

    if (kameezSleeveCircumf != null) {
      result.addAll({'kameezSleeveCircumf': kameezSleeveCircumf});
    }

    if (kameezFrontNeck != null) {
      result.addAll({'kameezFrontNeck': kameezFrontNeck});
    }

    if (kameezBackNeck != null) {
      result.addAll({'kameezBackNeck': kameezBackNeck});
    }

    if (itemType != null) {
      result.addAll({'itemType': itemType});
    }

    return result;
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      dateTime: map['dateTime'],
      customerName: map['customerName'],
      contactNumber: map['contactNumber'],
      email: map['email'],
      address: map['address'],
      gender: map['gender'],
      pantLength: map['pantLength'],
      pantWaist: map['pantWaist'],
      pantFly: map['pantFly'],
      pantSeat: map['pantSeat'],
      pantKnee: map['pantKnee'],
      pantAnkle: map['pantAnkle'],
      shalwarLength: map['shalwarLength'],
      shalwarWaist: map['shalwarWaist'],
      shalwarHip: map['shalwarHip'],
      shalwarKnee: map['shalwarKnee'],
      shalwarAnkle: map['shalwarAnkle'],
      shirtLength: map['shirtLength'],
      shirtNeck: map['shirtNeck'],
      shirtShoulder: map['shirtShoulder'],
      shirtChest: map['shirtChest'],
      shirtSleeves: map['shirtSleeves'],
      shirtSleeveCircum: map['shirtSleeveCircum'],
      kameezLength: map['kameezLength'],
      kameezShoulder: map['kameezShoulder'],
      kameezUpperChest: map['kameezUpperChest'],
      kameezBust: map['kameezBust'],
      kameezWaist: map['kameezWaist'],
      kameezSeat: map['kameezSeat'],
      kameezArmhole: map['kameezArmhole'],
      kameezSleeveLength: map['kameezSleeveLength'],
      kameezSleeveCircumf: map['kameezSleeveCircumf'],
      kameezFrontNeck: map['kameezFrontNeck'],
      kameezBackNeck: map['kameezBackNeck'],
      itemType: map['itemType'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(dateTime: $dateTime, customerName: $customerName, contactNumber: $contactNumber, email: $email, address: $address, gender: $gender, pantLength: $pantLength, pantWaist: $pantWaist, pantFly: $pantFly, pantSeat: $pantSeat, pantKnee: $pantKnee, pantAnkle: $pantAnkle, shalwarLength: $shalwarLength, shalwarWaist: $shalwarWaist, shalwarHip: $shalwarHip, shalwarKnee: $shalwarKnee, shalwarAnkle: $shalwarAnkle, shirtLength: $shirtLength, shirtNeck: $shirtNeck, shirtShoulder: $shirtShoulder, shirtChest: $shirtChest, shirtSleeves: $shirtSleeves, shirtSleeveCircum: $shirtSleeveCircum, kameezLength: $kameezLength, kameezShoulder: $kameezShoulder, kameezUpperChest: $kameezUpperChest, kameezBust: $kameezBust, kameezWaist: $kameezWaist, kameezSeat: $kameezSeat, kameezArmhole: $kameezArmhole, kameezSleeveLength: $kameezSleeveLength, kameezSleeveCircumf: $kameezSleeveCircumf, kameezFrontNeck: $kameezFrontNeck, kameezBackNeck: $kameezBackNeck, itemType: $itemType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.dateTime == dateTime &&
        other.customerName == customerName &&
        other.contactNumber == contactNumber &&
        other.email == email &&
        other.address == address &&
        other.gender == gender &&
        other.pantLength == pantLength &&
        other.pantWaist == pantWaist &&
        other.pantFly == pantFly &&
        other.pantSeat == pantSeat &&
        other.pantKnee == pantKnee &&
        other.pantAnkle == pantAnkle &&
        other.shalwarLength == shalwarLength &&
        other.shalwarWaist == shalwarWaist &&
        other.shalwarHip == shalwarHip &&
        other.shalwarKnee == shalwarKnee &&
        other.shalwarAnkle == shalwarAnkle &&
        other.shirtLength == shirtLength &&
        other.shirtNeck == shirtNeck &&
        other.shirtShoulder == shirtShoulder &&
        other.shirtChest == shirtChest &&
        other.shirtSleeves == shirtSleeves &&
        other.shirtSleeveCircum == shirtSleeveCircum &&
        other.kameezLength == kameezLength &&
        other.kameezShoulder == kameezShoulder &&
        other.kameezUpperChest == kameezUpperChest &&
        other.kameezBust == kameezBust &&
        other.kameezWaist == kameezWaist &&
        other.kameezSeat == kameezSeat &&
        other.kameezArmhole == kameezArmhole &&
        other.kameezSleeveLength == kameezSleeveLength &&
        other.kameezSleeveCircumf == kameezSleeveCircumf &&
        other.kameezFrontNeck == kameezFrontNeck &&
        other.kameezBackNeck == kameezBackNeck &&
        other.itemType == itemType;
  }

  @override
  int get hashCode {
    return dateTime.hashCode ^
        customerName.hashCode ^
        contactNumber.hashCode ^
        email.hashCode ^
        address.hashCode ^
        gender.hashCode ^
        pantLength.hashCode ^
        pantWaist.hashCode ^
        pantFly.hashCode ^
        pantSeat.hashCode ^
        pantKnee.hashCode ^
        pantAnkle.hashCode ^
        shalwarLength.hashCode ^
        shalwarWaist.hashCode ^
        shalwarHip.hashCode ^
        shalwarKnee.hashCode ^
        shalwarAnkle.hashCode ^
        shirtLength.hashCode ^
        shirtNeck.hashCode ^
        shirtShoulder.hashCode ^
        shirtChest.hashCode ^
        shirtSleeves.hashCode ^
        shirtSleeveCircum.hashCode ^
        kameezLength.hashCode ^
        kameezShoulder.hashCode ^
        kameezUpperChest.hashCode ^
        kameezBust.hashCode ^
        kameezWaist.hashCode ^
        kameezSeat.hashCode ^
        kameezArmhole.hashCode ^
        kameezSleeveLength.hashCode ^
        kameezSleeveCircumf.hashCode ^
        kameezFrontNeck.hashCode ^
        kameezBackNeck.hashCode ^
        itemType.hashCode;
  }
}
