import 'package:flutter/services.dart';

abstract class SSLCer {
  static String? cert;

  static Future<void> initialize() async {
    cert = await rootBundle.loadString('assets/itune.pem');
  }

  static List<int>? getCert() {
    return cert?.codeUnits;
  }
}
