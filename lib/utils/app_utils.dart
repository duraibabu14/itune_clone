import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';
import 'package:url_launcher/url_launcher.dart';

class ENVMode {
  ENVMode._(_);
  static bool get isInDevMode {
    const bool isInDevMode = false;
    return isInDevMode;
  }
}

class AppUtils {
  const AppUtils._();
  static AppUtils? _instance;

  static AppUtils instance() => _instance ??= const AppUtils._();

  /// showing toast message
  void showToast(String? text,
      {Color color = Colors.red, ToastGravity? toastGravity}) {
    if (text == null) return;
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color,
        textColor: ColorResource.colorFFFFFF,
        fontSize: 14.0);
  }

  /// Launch URL
  Future<void> launchURL(String url) async {
    final uri = Uri.tryParse(url);
    try {
      await launchUrl(uri!, mode: LaunchMode.externalApplication);
    } catch (err) {
      showToast(StringResource.cannotLaunch);
    }
  }
}
