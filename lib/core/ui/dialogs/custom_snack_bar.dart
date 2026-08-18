import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class CustomSnackBar {
  final BuildContext _context;

  const CustomSnackBar.internal(this._context);

  void show({
    required String text,
    required Color color,
    required IconData icon,
    VoidCallback? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    double? elevation,
  }) {
    ScaffoldMessenger.of(_context).hideCurrentSnackBar();
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        duration: duration,
        behavior: behavior,
        margin: margin,
        elevation: elevation,
        backgroundColor: color,
        padding: padding ?? EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        content: ListTile(
          horizontalTitleGap: 10,
          leading: Icon(icon, color: Colors.white),
          title: Text(
            text,
            style: _context.styles.mediumStyle(color: Colors.white),
          ),
          trailing: onTap != null
              ? IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 16,
                  ),
                )
              : null,
        ),
      ),
    );
  }

  void success({
    required String text,
    VoidCallback? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    double? elevation,
  }) => show(
    text: text,
    color: _context.colors.success,
    icon: Icons.check_circle_outline_rounded,
    onTap: onTap,
    duration: duration,
    behavior: behavior,
    margin: margin,
    padding: padding,
    borderRadius: borderRadius,
    elevation: elevation,
  );

  void error({
    required String text,
    VoidCallback? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    double? elevation,
  }) => show(
    text: text,
    color: _context.colors.error,
    icon: Icons.error_outline_rounded,
    onTap: onTap,
    duration: duration,
    behavior: behavior,
    margin: margin,
    padding: padding,
    borderRadius: borderRadius,
    elevation: elevation,
  );

  void warning({
    required String text,
    VoidCallback? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    double? elevation,
  }) => show(
    text: text,
    color: _context.colors.warning,
    icon: Icons.warning_amber_rounded,
    onTap: onTap,
    duration: duration,
    behavior: behavior,
    margin: margin,
    padding: padding,
    borderRadius: borderRadius,
    elevation: elevation,
  );

  void info({
    required String text,
    VoidCallback? onTap,
    Duration duration = const Duration(seconds: 3),
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    double? elevation,
  }) => show(
    text: text,
    color: _context.colors.info,
    icon: Icons.info_outline_rounded,
    onTap: onTap,
    duration: duration,
    behavior: behavior,
    margin: margin,
    padding: padding,
    borderRadius: borderRadius,
    elevation: elevation,
  );
}
