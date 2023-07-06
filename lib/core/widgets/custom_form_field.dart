import 'package:flutter/material.dart';
import 'package:user_auth/core/themes/themes.dart';
import 'package:user_auth/core/utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  final String hinttext;
  final IconData? icon;
  final Widget? sufixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool? obscureText;
  const CustomTextFormField({
    super.key,
    required this.hinttext,
    this.controller,
    this.validator,
    this.onChanged,
    this.icon,
    this.errorText,
    this.sufixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon != null
            ? Icon(
                icon,
                color: iconColor,
                size: 20.0,
              )
            : 0.pHeight,
        8.pWidth,
        Flexible(
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: kHintTextStyle,
              errorText: errorText,
              suffixIcon: sufixIcon ?? 0.pHeight,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
