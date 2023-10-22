class TvModel {
  final String ServiceName;
  final String serviceId;

  final List<TvVariations> variations;

  const TvModel(
      {required this.ServiceName,
      required this.serviceId,
      required this.variations});

  factory TvModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> variations = json['varations'];
    List<TvVariations> variationList =
        variations.map((e) => TvVariations.fromJson(e)).toList();
    return TvModel(
        ServiceName: json['ServiceName'],
        serviceId: json['serviceID'],
        variations: variationList);
  }
}

class TvVariations {
  final String variation_code;
  final String name;
  final String variation_amount;
  const TvVariations(
      {required this.name,
      required this.variation_amount,
      required this.variation_code});

  factory TvVariations.fromJson(Map<String, dynamic> json) {
    return TvVariations(
        name: json['name'],
        variation_amount: json['variation_amount'],
        variation_code: json['variation_code']);
  }
}
