import 'package:flutter/material.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/utils/color_resource.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomAppBar({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResource.color000000,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back_ios_new_sharp),
        color: ColorResource.colorFFFFFF,
      ),
      centerTitle: true,
      title: CustomText(
        title,
        color: ColorResource.colorFFFFFF,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
