import 'package:get/get.dart';
import 'package:hala_meet/linker.dart';

class LocalizationProvider extends GetxController implements GetxService {
  LocalizationProvider() {
    loadCurrentLanguage();
  }
  String _selectedLanguageCode = AppConst.defaultLanguage;
  bool _isLtr = true;
  String get selectedLanguageCode => _selectedLanguageCode;
  bool get isLtr => _isLtr;

  /// to load current language
  void loadCurrentLanguage() async {
    _selectedLanguageCode = getStringAsync(AppConst.languageCode,
        defaultValue: AppConst.defaultLanguage);
    _isLtr = _selectedLanguageCode != 'ar';
    update();
  }

  /// to save and chage to new language
  void setLanguage(String lan) {
    _selectedLanguageCode = lan;
    _isLtr = _selectedLanguageCode != 'ar';
    setValue(AppConst.languageCode, lan);
    update();
  }
}

List<LanguageDataModel> languageList() {
  return [
    LanguageDataModel(
        id: 1,
        name: 'English',
        languageCode: 'en',
        fullLanguageCode: 'en-US',
        flag: 'assets/images/flag/ic_us.png'),
    // LanguageDataModel(id: 2, name: 'Hindi', languageCode: 'hi', fullLanguageCode: 'hi-IN', flag: 'assets/flag/ic_india.png'),
    LanguageDataModel(
        id: 3,
        name: 'Arabic',
        languageCode: 'ar',
        fullLanguageCode: 'ar-AR',
        flag: 'assets/images/flag/ic_ar.png'),
    // LanguageDataModel(id: 4, name: 'French', languageCode: 'fr', fullLanguageCode: 'fr-FR', flag: 'assets/flag/ic_fr.png'),
    // LanguageDataModel(id: 5, name: 'German', languageCode: 'de', fullLanguageCode: 'de-DE', flag: 'assets/flag/ic_de.png'),
  ];
}
