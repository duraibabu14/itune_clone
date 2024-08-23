import 'package:flutter/services.dart';

abstract class SSLCer {
  static ByteData? cert;

  static Future<void> initialize() async {
    cert = await rootBundle.load('assets/itune.pem');
  }

  static Uint8List? getCert() {
    return cert?.buffer.asUint8List();
  }
}
