part of '../home_screen.dart';

class _BuildNetworkImage extends StatelessWidget {
  final String url;
  const _BuildNetworkImage({required this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CustomNetworkImage(
        imageURL: url,
        height: 120,
        width: 120,
      ),
    );
  }
}

class BuildTitleAndSubtitle extends StatelessWidget {
  final String name;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isSingleLine;
  final Color? color;
  const BuildTitleAndSubtitle(
      {super.key,
      required this.name,
      this.color,
      this.fontSize = 14,
      this.isSingleLine = true,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      name,
      fontSize: fontSize,
      isSingleLine: isSingleLine,
      color: color ?? ColorResource.colorFFFFFF,
      fontWeight: fontWeight,
    );
  }
}
