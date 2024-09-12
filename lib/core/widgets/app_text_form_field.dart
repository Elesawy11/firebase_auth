import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.maxLines = 1,
    this.onTap,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      onTap: onTap,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          focusedBorder: focusedBorder ??
              outLineBorder(
                color: Colors.blue,
              ),
          enabledBorder: enabledBorder ??
              outLineBorder(
                color: Colors.grey,
              ),
          errorBorder: outLineBorder(
            color: Colors.red,
          ),
          focusedErrorBorder: outLineBorder(
            color: Colors.red,
          ),
          hintStyle: hintStyle ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
          hintText: hintText,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? Colors.grey,
          filled: true,
          prefixIcon: prefixIcon),
      obscureText: isObscureText ?? false,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }

  OutlineInputBorder outLineBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: 1.3,
      ),
      borderRadius: BorderRadius.circular(16.0),
    );
  }
}
