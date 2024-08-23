import 'package:flutter/cupertino.dart';
import 'package:ituneclone/common/custom_text.dart';
import 'package:ituneclone/utils/color_resource.dart';
import 'package:ituneclone/utils/string_resource.dart';

///[Loader]
class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: ColorResource.color2f2f2f,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              radius: 10,
              color: ColorResource.colorGrey700,
            ),
            const SizedBox(width: 20),
            const CustomText(
              StringResource.loading,
              color: ColorResource.colorFFFFFF,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
