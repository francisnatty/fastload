import 'package:intl/intl.dart';

String ApiUrl = 'https://sandbox.vtpass.com/api',
    APIKey = '78880f717ea860088be1c29495c00df8',
    publicKey = 'PK_622c40e44aefafa55dab395b240b236d7d567c0b1a4',
    secretKey = 'SK_805897eae41bc12832832ff80a2f7286ce91333af3f';

String monnifyApikey = 'MK_TEST_10ZJVA75Y3',
    monnifySecretKey = '16YMKLDKSXC4341LXJGUSCQR72P12NY4';

String formateDateTime() {
  final formatter = DateFormat('yyyyMMddHmm');
  return formatter.format(DateTime.now());
}
