class VerifyCardResponse {
  final String code;
  final Content content;
  VerifyCardResponse({
    required this.code,
    required this.content,
  });

  factory VerifyCardResponse.fromMap(Map<String, dynamic> map) {
    print(map['code'].runtimeType);
    return VerifyCardResponse(
      code: map['code'],
      content: Content.fromMap(map['content'] as Map<String, dynamic>),
    );
  }
}

class Content {
  final String customerName;
  final int meterNumber;
  // final String businessUnit;
  final String address;
  // final String customerArrears;
  Content({
    required this.customerName,
    required this.meterNumber,
    // required this.businessUnit,
    required this.address,
    // required this.customerArrears,
  });

  factory Content.fromMap(Map<String, dynamic> map) {
    print(map['Customer_Name'].runtimeType);
    print(map['Meter_Number'].runtimeType);
    print(map['Business_Unit'].runtimeType);
    print(map['Address'].runtimeType);
    print(map['Customer_Arrears'].runtimeType);
    return Content(
      customerName: map['Customer_Name'] as String,
      meterNumber: map['Meter_Number'] as int,
      // businessUnit: map['Business_Unit'] as String,
      address: map['Address'] as String,
      // customerArrears: map['Customer_Arrears'] as String,
    );
  }
}
