import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/constants/custom_colors.dart';

class CustomTextInput extends StatelessWidget {
  final String hint;
  final String? initValue;
  final EdgeInsets padding;
  final Function(String value)? onChange;
  final TextInputAction textInputAction;
  final Function(String? value)? validator;
  final List<TextInputFormatter>? formatter;
  final TextInputType inputType;
  final TextCapitalization capitalize;
  final TextEditingController? controller;
  final bool obscure;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? errorText;
  final bool roundedBorder;
  final bool enable;
  final bool isDense;
  final TextDirection textDirection;
  final TextStyle textStyle;
  final FocusNode? focus;
  final BoxConstraints? prefixIconConstraint;
  final TextAlign textAlign;

  const CustomTextInput({
    super.key,
    this.hint = '',
    this.onChange,
    this.validator,
    this.padding = EdgeInsets.zero,
    this.inputType = TextInputType.text,
    this.capitalize = TextCapitalization.none,
    this.obscure = false,
    this.enable = true,
    this.focus,
    this.isDense = false,
    this.formatter,
    this.textAlign = TextAlign.start,
    this.textInputAction = TextInputAction.done,
    this.initValue,
    this.textStyle = const TextStyle(color: Colors.white),
    this.controller,
    this.errorText,
    this.textDirection = TextDirection.ltr,
    this.sufixIcon,
    this.prefixIconConstraint,
    this.prefixIcon,
    this.prefixText,
    this.roundedBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextFormField(
        keyboardType: inputType,
        focusNode: focus,
        textAlign: textAlign,
        controller: controller,
        inputFormatters: formatter,
        initialValue: initValue,
        style: textStyle,
        validator: (value) => validator != null ? validator!(value) : null,
        onChanged: (value) => onChange != null ? onChange!(value) : null,
        textCapitalization: capitalize,
        obscureText: obscure,
        textInputAction: textInputAction,
        textDirection: textDirection,
        enabled: enable,
        decoration: InputDecoration(
          border: roundedBorder
              ? customRoundedBorder()
              : customUnderlineBorder(color: ColorConstants.lightGrey),
          enabledBorder: roundedBorder
              ? customRoundedBorder(color: Colors.grey.withValues(alpha: 0.5))
              : customUnderlineBorder(color: ColorConstants.lightGrey),
          focusedBorder: roundedBorder
              ? customRoundedBorder(color: Colors.grey.withValues(alpha: 0.5))
              : customUnderlineBorder(),
          prefixIcon: prefixIcon,
          suffixIcon: sufixIcon,
          isDense: isDense,
          prefixIconConstraints: prefixIconConstraint,
          hintText: hint,
          errorText: errorText,
          hintStyle: const TextStyle(
            color: ColorConstants.lightGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  UnderlineInputBorder customUnderlineBorder({
    Color color = ColorConstants.orange,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
    );
  }

  OutlineInputBorder customRoundedBorder({
    Color color = ColorConstants.orange,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 2),
    );
  }
}
