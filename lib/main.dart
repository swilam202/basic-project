import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/data/app_local_data.dart';
import 'core/di/service_locator.dart';
import 'core/extensions/context_extension.dart';
import 'core/res/themes/themes_res.dart';
import 'core/routing/router.dart';
import 'core/utils/connectivity_services.dart';
import 'features/layout/presentation/manager/layout_cubit.dart';
import 'l10n/app_localizations.dart';
import 'l10n/controller/locale_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ServiceLocator().setup();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    sl.get<ConnectivityService>().onStatusChanged.listen((isOnline) {
      log(isOnline.toString());
      if (isOnline && mounted) {
        context.snackBar.success(text: context.strings.backOnline);
      } else if (!isOnline && mounted) {
        context.snackBar.info(text: context.strings.internetConnectionLost);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<LocaleCubit>()),
        BlocProvider(create: (context) => sl.get<LayoutCubit>()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(360, 690),

        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, state) => MaterialApp.router(
            routerConfig: router,
            theme: ThemesRes.lightTheme(context),
            locale: Locale(sl.get<AppLocalData>().locale),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        ),
      ),
    );
  }
}
