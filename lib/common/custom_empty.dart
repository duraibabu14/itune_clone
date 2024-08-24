import 'package:flutter/material.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/lottie_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';
import 'package:lottie/lottie.dart';

///[EmptyResult]
class CustomEmpty extends StatelessWidget {
  final void Function() onRetry;
  const CustomEmpty({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(LottieResource.noResultFound, width: 300, height: 300),
        const SizedBox(height: 10),
        const CustomText(
          "No data Found",
          color: ColorResource.colorFFFFFF,
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: onRetry,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            decoration: BoxDecoration(
                color: ColorResource.colorFFFFFF,
                borderRadius: BorderRadius.circular(40)),
            child: const CustomText(
              StringResource.tryAgain,
              fontSize: 16,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
              color: ColorResource.color000000,
            ),
          ),
        ),
      ],
    );
  }
}
