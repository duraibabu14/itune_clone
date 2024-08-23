import 'package:flutter/material.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/utils/color_resource.dart';

///[EmptyResult]
class CustomEmpty extends StatelessWidget {
  const CustomEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(
        "No data Found",
        color: ColorResource.colorFFFFFF,
      ),
    );
  }
}
