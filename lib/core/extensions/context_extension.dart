import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../res/colors/app_colors.dart';
import '../res/styles/styles_res.dart';
import '../ui/dialogs/custom_snack_bar.dart';

extension ContextExtensions on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  TextStylesRes get styles => TextStylesRes(this);
  CustomSnackBar get snackBar => CustomSnackBar.internal(this);
  AppLocalizations get strings => AppLocalizations.of(this)!;
  GoRouter get router => GoRouter.of(this);
  FocusScopeNode get focus => FocusScope.of(this);
}
