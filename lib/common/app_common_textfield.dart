import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? text;
  final Color? color;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? image;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;
  final String Function(String?)? validator;

  const CommonTextField(
      {super.key,
      this.text,
      this.color,
      this.style,
      this.textAlign,
      this.suffixIcon,
      this.image,
      this.controller,
      this.obscureText,
      this.keyboardType,
      this.textCapitalization,
      this.onChanged,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 6, top: 6),
      decoration: BoxDecoration(
        color: color!,
        borderRadius: BorderRadius.circular(35),
      ),
      child: TextField(
        
        textCapitalization: TextCapitalization.words,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        controller: controller,
        obscureText: obscureText ?? false,
        onChanged: onChanged,
        textAlign: textAlign!,
        decoration: InputDecoration(
          suffix: suffixIcon,
          suffixIconColor: (obscureText ?? true) ? Colors.grey : Colors.blue,
          hintStyle: style,
          hintText: text!,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
