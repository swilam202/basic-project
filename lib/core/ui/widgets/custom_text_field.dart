
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/context_extension.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    this.errorText,
    this.helperText,
    this.counterText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.prefixText,
    this.suffixText,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.autofillHints,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.maxLengthEnforcement,
    this.expands = false,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.backgroundColor,
    this.borderRadius,
    this.borderSide,
    this.borderWidth,
    this.focusedBorderSide,
    this.errorBorderSide,
    this.disabledBorderSide,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.helperStyle,
    this.prefixStyle,
    this.suffixStyle,
    this.counterStyle,
    this.textStyle,
    this.cursorColor,
    this.cursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.contentPadding,
    this.isDense,
    this.iconColor,
    this.prefixIconColor,
    this.suffixIconColor,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.validator,
    this.isRequired = false,
    this.autovalidateMode,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onSaved,
  });

  final String? hint;
  final String? label;
  final String? errorText;
  final String? helperText;
  final String? counterText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final String? prefixText;
  final String? suffixText;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final bool autofocus;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool expands;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;

  final Color? backgroundColor;
  final double? borderRadius;
  final BorderSide? borderSide;
  final double? borderWidth;
  final BorderSide? focusedBorderSide;
  final BorderSide? errorBorderSide;
  final BorderSide? disabledBorderSide;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;
  final TextStyle? prefixStyle;
  final TextStyle? suffixStyle;
  final TextStyle? counterStyle;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isDense;
  final Color? iconColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;

  final String? Function(String?)? validator;
  final bool isRequired;
  final AutovalidateMode? autovalidateMode;

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final FormFieldSetter<String>? onSaved;

  double get _radius => borderRadius ?? 27.r;

  BorderSide _defaultBorderSide(BuildContext context) =>
      borderSide ??
      BorderSide(
        color: context.colors.backgroundSecondary,
        width: borderWidth ?? 1,
      );

  BorderSide _focusedBorderSide(BuildContext context) =>
      focusedBorderSide ??
      BorderSide(
        color: context.colors.navyBlack,
        width: borderWidth ?? 1.w,
      );

  BorderSide _errorBorderSide(BuildContext context) =>
      errorBorderSide ??
      BorderSide(
        color: context.colors.error,
        width: borderWidth ?? 1,
      );

  BorderSide _disabledBorderSide(BuildContext context) =>
      disabledBorderSide ??
      BorderSide(
        color: context.colors.backgroundSecondary.withValues(alpha: 0.5),
        width: borderWidth ?? 1,
      );

  OutlineInputBorder _border(BorderSide side) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(_radius),
        borderSide: side,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      readOnly: readOnly,
      enabled: enabled,
      autofocus: autofocus,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      maxLengthEnforcement: maxLengthEnforcement,
      expands: expands,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      textDirection: textDirection,
      cursorColor: cursorColor ?? context.colors.primary,
      cursorWidth: cursorWidth ?? 2,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      validator: isRequired
          ? (value) =>
              (value == null || value.trim().isEmpty)
                  ? 'This field is required'
                  : validator?.call(value)
          : validator,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      onTapOutside: onTapOutside,
      onEditingComplete: onEditingComplete,
      onSaved: onSaved,
      style: textStyle ?? context.styles.regularStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        errorText: errorText,
        helperText: helperText,
        counterText: counterText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        prefix: prefix,
        suffix: suffix,
        prefixText: prefixText,
        suffixText: suffixText,
        filled: true,
        fillColor: backgroundColor ?? context.colors.backgroundSoft,
        isDense: isDense,
        contentPadding: contentPadding,
        iconColor: iconColor,
        prefixIconColor: prefixIconColor,
        suffixIconColor: suffixIconColor,
        prefixIconConstraints: prefixIconConstraints,
        suffixIconConstraints: suffixIconConstraints,
        hintStyle: hintStyle ?? context.styles.lightStyle(fontSize: 12),
        labelStyle: labelStyle ?? context.styles.regularStyle(fontSize: 14),
        errorStyle: errorStyle ?? context.styles.regularStyle(
          fontSize: 11,
          color: context.colors.error,
        ),
        helperStyle: helperStyle ?? context.styles.lightStyle(fontSize: 11),
        prefixStyle: prefixStyle,
        suffixStyle: suffixStyle,
        counterStyle: counterStyle,
        border: _border(_defaultBorderSide(context)),
        enabledBorder: _border(_defaultBorderSide(context)),
        focusedBorder: _border(_focusedBorderSide(context)),
        errorBorder: _border(_errorBorderSide(context)),
        focusedErrorBorder: _border(_errorBorderSide(context)),
        disabledBorder: _border(_disabledBorderSide(context)),
      ),
    );
  }
}
