class VerifyCardModel {
  final String customerName;
  final String status;
  final String dueDate;
  final int customerNumber;
  final String customerType;
  final String currentBouquet;
  final String currentBouquetCode;
  final int renewalAmount;

  VerifyCardModel(
      {required this.currentBouquet,
      required this.currentBouquetCode,
      required this.customerName,
      required this.customerNumber,
      required this.customerType,
      required this.dueDate,
      required this.renewalAmount,
      required this.status});

  factory VerifyCardModel.fromJson(Map<String, dynamic> json) {
    return VerifyCardModel(
      customerName: json['Customer_Name'],
      status: json['Status'],
      dueDate: json['Due_Date'],
      customerNumber: json['Customer_Number'],
      customerType: json['Customer_Type'],
      currentBouquet: json['Current_Bouquet'],
      currentBouquetCode: json['Current_Bouquet_Code'],
      renewalAmount: json['Renewal_Amount'],
    );
  }
}
