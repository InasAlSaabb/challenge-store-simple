import 'package:challenge_2/ui/shared/colors.dart';
import 'package:challenge_2/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.prefixIcon,
    this.prefixIconColor,
    this.maxHeight,
    this.onChanged,
    this.maxWidth,
    required this.hintText,
    required this.controller,
    required this.fillColor,
    required this.hintTextColor,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
  });

  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final double? maxHeight;
  final double? maxWidth;
  Function(String)? onChanged;
  final String hintText;
  final TextEditingController controller;
  final Color? fillColor;
  final Color? hintTextColor;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      onChanged: onChanged,

      controller: controller,
      validator: validator,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        contentPadding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? screenHieght(15),
          maxWidth: maxWidth ?? screenWidth(1.1),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.transparentColor,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        hintStyle: TextStyle(
          color: hintTextColor,
        ),
        hintText: hintText,
        fillColor: fillColor,
      ),
      keyboardType: keyboardType ?? TextInputType.text,
    );
  }
}
