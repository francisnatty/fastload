class ServiceVariation {
  final String code;
  final String name;
  final String amount;
  final String fixedPrice;

  ServiceVariation(
      {required this.amount,
      required this.code,
      required this.fixedPrice,
      required this.name});

  factory ServiceVariation.fromJson(Map<String, dynamic> json) {
    return ServiceVariation(
        amount: json['variation_amount'],
        code: json['variation_code'],
        fixedPrice: json['fixedPrice'],
        name: json['name']);
  }
}

class ServiceData {
  final String serviceName;
  final String serviceID;
  final String convienienceFee;
  final List<ServiceVariation> variations;

  ServiceData({
    required this.serviceName,
    required this.serviceID,
    required this.convienienceFee,
    required this.variations,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) {
    List<dynamic> variations = json['varations'];

    List<ServiceVariation> variationList =
        variations.map((v) => ServiceVariation.fromJson(v)).toList();

    return ServiceData(
        serviceName: json['ServiceName'],
        serviceID: json['serviceID'],
        convienienceFee: json['convinience_fee'],
        variations: variationList);
  }
}
