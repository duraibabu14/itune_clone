import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:ituneclone/common/custom_scaffold.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/lottie_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  StreamSubscription? connectivityListener;

  @override
  void initState() {
    connectivityListener ??=
        Connectivity().onConnectivityChanged.listen((event) async {
      if (!event.contains(ConnectivityResult.none)) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: CustomScaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(LottieResource.noInternet,
                  height: 300, width: 300),
            ),
            const CustomText(
              StringResource.noInternet,
              color: ColorResource.colorFFFFFF,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    connectivityListener?.cancel();
    super.dispose();
  }
}
