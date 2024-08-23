import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ituneclone/utils/color_resource.dart';


class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final double lineHeight;
  final TextAlign textAlign;
  final GestureTapCallback? onTap;
  final bool isUnderLine;
  final bool isSingleLine;
  final int? maxLines;
  final bool allowCopy;
  final bool isSelectableText;
  final String? copyText;
  final bool isLineThrough;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final FontStyle fontStyle;
  final Color? focusColor;
  final bool? softWrap;

  const CustomText(
    this.text, {
    this.fontSize = 14,
    this.color = ColorResource.color2f2f2f,
    this.lineHeight = 1.21,
    this.textAlign = TextAlign.left,
    this.onTap,
    this.isUnderLine = false,
    this.isSingleLine = false,
    this.maxLines,
    this.allowCopy = false,
    this.isSelectableText = false,
    this.isLineThrough = false,
    this.copyText,
    this.softWrap,
    this.overflow = TextOverflow.clip,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    super.key,
    this.focusColor,
  });

  @override
  Widget build(BuildContext context) {
    final SelectableText selectableText = SelectableText(
      text ?? "",
      textAlign: textAlign,
      showCursor: true,
      maxLines: maxLines,
      style: GoogleFonts.getFont(
        "Nunito Sans",
        textStyle: TextStyle(
          decoration: isLineThrough
              ? TextDecoration.lineThrough
              : isUnderLine
                  ? TextDecoration.underline
                  : TextDecoration.none,
          color: color,
          fontSize: fontSize,
          height: lineHeight,
          fontWeight: fontWeight,
        ),
      ),
    );

    Widget textWidget = _textWidget(color);

    if (focusColor != null) {
      textWidget = _textWidget(color);
    }

    if (onTap != null || allowCopy) {
      return GestureDetector(
        onTap: onTap,
        onLongPress: allowCopy ? () {} : null,
        child: isSelectableText ? selectableText : textWidget,
      );
    }
    return isSelectableText ? selectableText : textWidget;
  }

  Text _textWidget(Color color) {
    return Text(
      text ?? "",
      textAlign: textAlign,
      overflow: isSingleLine ? TextOverflow.ellipsis : null,
      softWrap: !isSingleLine,
      maxLines: maxLines,
      style: GoogleFonts.getFont(
        "Nunito Sans",
        textStyle: TextStyle(
          decoration: isLineThrough
              ? TextDecoration.lineThrough
              : isUnderLine
                  ? TextDecoration.underline
                  : TextDecoration.none,
          fontWeight: fontWeight,
          fontStyle: fontStyle,
          color: color,
          fontSize: fontSize,
          height: lineHeight,
        ),
      ),
    );
  }
}
