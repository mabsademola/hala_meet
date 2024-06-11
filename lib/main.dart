// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'linker.dart';
import 'locale/app_localizations.dart';
import 'locale/language_en.dart';
import 'locale/languages.dart';

BaseLanguage lan = LanguageEn();
// BaseLanguage lan = LanguageAr();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appini();
  await initialize();

  localeLanguageList = languageList();
  runApp(const MyApp());
}

appini() {
  defaultAppButtonRadius = 15;
  appButtonBackgroundColorGlobal = AppColors.primaryColor;
  defaultAppButtonTextColorGlobal = Colors.white;
  textSecondaryColorGlobal = AppColors.secondaryblackColor;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Get.put(ThemeProvider());

    final LocalizationProvider localizationProvider =
        Get.put(LocalizationProvider());

    return RestartAppWidget(
      child: GetMaterialApp(
        title: AppConst.appName,
        debugShowCheckedModeBanner: false,
        navigatorKey: Get.key,
        navigatorObservers: [FlutterSmartDialog.observer],
        // scrollBehavior: const MaterialScrollBehavior().copyWith(
        //     dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        //   ),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        // theme: themeProvider.isDarkMode ? AppTheme.darkTheme :  AppTheme.lightTheme,
        themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,

        localizationsDelegates: const [
          AppLocalizations(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) => locale,
        locale: Locale(localizationProvider.selectedLanguageCode),
        supportedLocales: LanguageDataModel.languageLocales(),
        home: const SplashScreen(),
      ),
    );
  }
}

void showDis() {
  Get.snackbar(
    "Feature Not Implemented",
    'This feature is not yet implemented.',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black54,
    colorText: Colors.white,
  );
}
