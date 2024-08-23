// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ituneclone/utils/color_resource.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final bool? isPasswordController;
  final TextEditingController controller;
  bool? obscureText;
  VoidCallback? onPressedSuffixIcon;
  Function(String? data)? onChange;
  String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final TextCapitalization? capitalization;
  final List<String>? autofillHints;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? focusBorderColor;
  final Color? textColor;
  final FontWeight textFontWeight;
  final AutovalidateMode? autoValidateMode;
  final String? errorText;
  final FocusNode? focusNode;
  final double borderRadius;
  final int? maxLines;
  final int? minLines;
  final String? labelText;
  final TextInputAction? textInputAction;
  final bool enabled;
  final void Function(String)? onFieldSubmitted;

  CustomTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.isPasswordController = false,
      this.textFontWeight = FontWeight.w500,
      this.obscureText = false,
      this.onPressedSuffixIcon,
      this.onChange,
      this.labelText,
      this.validator,
      this.textColor = ColorResource.colorFFFFFF,
      this.autofillHints,
      this.focusNode,
      this.suffixIcon,
      this.borderRadius = 40,
      this.prefixIcon,
      this.errorText,
      this.inputType = TextInputType.text,
      this.capitalization = TextCapitalization.none,
      this.autoValidateMode,
      this.focusBorderColor,
      this.maxLines = 1,
      this.minLines = 1,
      this.textInputAction,
      this.enabled = true,
      this.inputFormatters,
      this.onFieldSubmitted});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode textFieldFocus = FocusNode();
  Color fillColor = ColorResource.colorGrey700;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: textFieldFocus,
      controller: widget.controller,
      obscureText: widget.obscureText!,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      enabled: widget.enabled,
      onFieldSubmitted: widget.onFieldSubmitted,
      scrollPadding: const EdgeInsets.only(bottom: 50),
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChange,
      autofillHints: widget.autofillHints,
      keyboardType: widget.inputType,
      textCapitalization: widget.capitalization!,
      validator: widget.validator,
      textInputAction: widget.textInputAction,
      autovalidateMode: widget.autoValidateMode,
      cursorColor: Colors.blueAccent[700],
      style: GoogleFonts.nunitoSans(
          fontSize: 16.0,
          color: widget.textColor,
          fontWeight: widget.textFontWeight,
          decorationColor: widget.textColor),
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 17,
        ),
        hintText: widget.hint,
        contentPadding:
            const EdgeInsets.only(left: 23, top: 10, bottom: 10, right: 23),
        suffixIcon: widget.suffixIcon,
        hintStyle: GoogleFonts.nunitoSans(
          height: 0,
          fontSize: 14.0,
          color: ColorResource.colorB5B5B5,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: (widget.focusBorderColor != null)
                  ? widget.focusBorderColor!
                  : Colors.transparent),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            borderSide: const BorderSide(color: Colors.transparent)),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
}
