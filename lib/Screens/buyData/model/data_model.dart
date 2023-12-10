class ServiceVariation {
  final String code;
  final String name;
  final String amount;
  final String dataAmount;
  final String duration;
  final String fixedPrice;

  ServiceVariation(
      {required this.amount,
      required this.code,
      required this.dataAmount,
      required this.duration,
      required this.fixedPrice,
      required this.name});

  factory ServiceVariation.fromJson(
      Map<String, dynamic> json, String serviceName) {
    String dataAmount = '';
    String duration = '';
    if (serviceName == 'MTN Data') {
      dataAmount = json['name'].split(" ")[1];
      duration = json['name'].split(" ")[3] + ' ' + json['name'].split(" ")[4];
    }
    return ServiceVariation(
      amount: json['variation_amount'],
      code: json['variation_code'],
      fixedPrice: json['fixedPrice'],
      name: json['name'],
      dataAmount: dataAmount,
      duration: duration,
    );
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

    List<ServiceVariation> variationList = variations.map((v) {
      return ServiceVariation.fromJson(v, json['ServiceName']);
    }).toList();

    return ServiceData(
        serviceName: json['ServiceName'],
        serviceID: json['serviceID'],
        convienienceFee: json['convinience_fee'],
        variations: variationList);
  }
}
