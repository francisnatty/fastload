import 'package:fastload/constants/image.dart';

class TvModel {
  String serviceName;
  String serviceID;
  String convenienceFee;
  List<Variation> variations;

  TvModel({
    required this.serviceName,
    required this.serviceID,
    required this.convenienceFee,
    required this.variations,
  });

  factory TvModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> variationsList = json['varations'];
    List<Variation> variations = variationsList.map((e) {
      return Variation.fromJson(e, json['ServiceName']);
    }).toList();

    return TvModel(
      serviceName: json['ServiceName'],
      serviceID: json['serviceID'],
      convenienceFee: json['convinience_fee'],
      variations: variations,
    );
  }
}

class Variation {
  String variationCode;
  String name;
  String variationAmount;
  String fixedPrice;
  String packageType;
  String img;

  Variation(
      {required this.variationCode,
      required this.name,
      required this.variationAmount,
      required this.fixedPrice,
      required this.packageType,
      required this.img});

  factory Variation.fromJson(Map<String, dynamic> json, String serviceName) {
    String packageType = '';
    String img = '';
    if (serviceName == 'DSTV Subscription') {
      img = Images.dstv;
    } else if (serviceName == 'Gotv Payment') {
      img = Images.gotv;
    } else if (serviceName == 'Startimes Subscription') {
      img = Images.startimes;
    } else if (serviceName == 'ShowMax') {
      img = Images.showmax;
    }

    return Variation(
      variationCode: json['variation_code'],
      name: json['name'],
      variationAmount: json['variation_amount'],
      fixedPrice: json['fixedPrice'],
      packageType: packageType,
      img: img,
    );
  }
}
