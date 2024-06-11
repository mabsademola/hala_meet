import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../linker.dart';

class ThemeProvider extends GetxController implements GetxService {
  ThemeProvider() {
    _getCurrentTheme();
  }

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // void toggleTheme() {
  //   _isDarkMode = !_isDarkMode;
  //   setValue(AppConst.theme, _isDarkMode);
  //   update();
  // }

  void _getCurrentTheme() async {
    // _isDarkMode = getBoolAsync(AppConst.theme);
    int themeModeIndex = getIntAsync(AppConst.themeModeIndex,
        defaultValue: AppConst.themeModesystem);
    if (themeModeIndex == AppConst.themeModeLight) {
      _isDarkMode = false;
    } else if (themeModeIndex == AppConst.themeModeDark) {
      _isDarkMode = true;
    }
    update();
  }
}

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        fontFamily: AppConst.fontFamily,
        primarySwatch: createMaterialColor(AppColors.primaryColor),
        primaryColor: AppColors.primaryColor,
        disabledColor: AppColors.disableColor,
      );

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        primarySwatch: createMaterialColor(AppColors.primaryColor),
        fontFamily: AppConst.fontFamily,
        primaryColor: AppColors.primaryColor,
        disabledColor: AppColors.disableColor,
      );
}
