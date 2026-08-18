import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../extensions/context_extension.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.height,
    this.fontSize,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.textStyle,
    this.isLoading = false,
    this.isActive = true,
    this.textAlign,
    this.child,
    this.elevation,
    this.shadowColor,
    this.padding,
    this.margin,
    this.alignment,
    this.splashColor,
    this.highlightColor,
    this.loadingWidget,
    this.loadingSize,
    this.loadingColor,
    this.loadingStrokeWidth,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSpacing,
    this.letterSpacing,
    this.fontFamily,
    this.shape,
    this.clipBehavior,
    this.animationDuration,
  });

  final String? text;
  final Widget? child;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final VoidCallback? onPressed;

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  final Color? backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final double? elevation;
  final Color? shadowColor;
  final BoxShape? shape;
  final Clip? clipBehavior;

  final Color? foregroundColor;
  final double? fontSize;
  final double? letterSpacing;
  final String? fontFamily;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  final bool isLoading;
  final bool isActive;

  final Widget? loadingWidget;
  final double? loadingSize;
  final Color? loadingColor;
  final double? loadingStrokeWidth;

  final AlignmentGeometry? alignment;
  final Duration? animationDuration;
  final double? iconSpacing;

  bool get _isDisabled => isLoading || !isActive;

  double get _opacity => _isDisabled ? 0.5 : 1.0;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius ?? 28.r);

    return Opacity(
      opacity: _isDisabled ? 0.6 : 1.0,
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Material(
          elevation: elevation ?? 0,
          shadowColor: shadowColor ?? Colors.transparent,
          borderRadius: shape == BoxShape.circle ? null : radius,
          clipBehavior: clipBehavior ?? Clip.antiAlias,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: shape == BoxShape.circle ? null : radius,
            onTap: _isDisabled ? null : onPressed,
            splashColor: splashColor,
            highlightColor: highlightColor,
            child: AnimatedContainer(
              duration: animationDuration ?? const Duration(milliseconds: 200),
              height: height ?? MediaQuery.sizeOf(context).height * .07,
              width: width ?? double.infinity,
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: shape == BoxShape.circle ? null : radius,
                shape: shape ?? BoxShape.rectangle,
                color: backgroundColor,

                border: Border.all(
                  color: borderColor ?? Colors.transparent,
                  width: borderWidth ?? 2,
                ),
              ),
              alignment: alignment ?? Alignment.center,
              child: _buildContent(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (child != null) return child!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null) ...[
          prefixIcon!,
          SizedBox(width: iconSpacing ?? 8.w),
        ],
        if (text != null)
          Text(
            text!,
            textAlign: textAlign ?? TextAlign.center,
            style:
                textStyle ??
                context.styles.boldStyle(
                  color: (foregroundColor ?? context.colors.background)
                      .withValues(alpha: _opacity),
                  fontSize: fontSize ?? 16,
                  letterSpacing: letterSpacing,
                  fontFamily: fontFamily,
                ),
          ),
        if (suffixIcon != null) ...[
          SizedBox(width: iconSpacing ?? 8.w),
          suffixIcon!,
        ],
        if (isLoading) ...[
          SizedBox(width: iconSpacing ?? 6.w),
          _buildLoader(context),
        ],
      ],
    );
  }

  Widget _buildLoader(BuildContext context) {
    if (loadingWidget != null) return loadingWidget!;

    return SizedBox(
      width: loadingSize ?? 18.r,
      height: loadingSize ?? 18.r,
      child: CircularProgressIndicator(
        strokeWidth: loadingStrokeWidth ?? 2,
        color:
            loadingColor ??
            (foregroundColor ?? context.colors.background).withValues(
              alpha: _opacity,
            ),
      ),
    );
  }
}
