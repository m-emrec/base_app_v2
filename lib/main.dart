import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'config/route config/router.dart';
import 'config/theme/app_theme.dart';
import 'core/utils/constants/app_colors.dart';
import 'core/utils/constants/enums/locale_enum.dart';
part './product/init/core_init.dart';
part './product/init/localization_init.dart';
part './product/init/system_chrome_settings.dart';

void main() async {
  await _CoreInit().init();
  runApp(
    EasyLocalization(
      supportedLocales: _LocalizationInit.supportedLocales,
      path: _LocalizationInit.path,
      fallbackLocale: _LocalizationInit.fallbackLocale,
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        routerConfig: AppRouter().router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: AppTheme().lightTheme,
      ),
    );
  }
}
