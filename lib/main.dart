import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'features/auth/presentation/pages/sign_in_page.dart';
import 'core/utils/constants/app_colors.dart';
import 'core/utils/constants/enums/locale_enum.dart';
part './product/init/core_init.dart';
part './product/init/localization_init.dart';
part './product/init/system_chrome_settings.dart';

void main() async {
  await _CoreInit().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignIn(),
    );
  }
}
