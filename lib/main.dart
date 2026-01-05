import 'package:barubatu_3_app/ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:barubatu_3_app/gen/l10n/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          ...L10n.localizationsDelegates,
        ],
        supportedLocales: const [
          ...L10n.supportedLocales,
        ],
        localeListResolutionCallback: (locales, supported) {
          for (final deviceLocale in locales ?? const <Locale>[]) {
            // 1) 言語+地域の完全一致を優先して supported から返す
            for (final s in supported) {
              if (s.languageCode == deviceLocale.languageCode &&
                  s.countryCode == deviceLocale.countryCode) {
                return s;
              }
            }
            // 2) 言語コード一致で supported から返す
            for (final s in supported) {
              if (s.languageCode == deviceLocale.languageCode) {
                return s;
              }
            }
          }
          // 3) 非対応は英語
          return const Locale('en');
        },
        home: HomeScreen(),
      ),
    );
  }
}
