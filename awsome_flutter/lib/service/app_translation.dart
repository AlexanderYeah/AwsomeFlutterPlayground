abstract class AppTranslation {
  static Map<String, Map<String, String>> translation = {
    // 这里设置一个英文和一个中文
    'en_EN': Locales.en_EN,
    'zh_CN': Locales.zh_CN
  };
}

abstract class LocaleKeys {
  static const change_zh = 'change_zh_CN';
  static const change_en = 'change_en_EN';
  static const home = 'home';
  static const diligent = 'diligent';
  static const determination = 'determination';
  static const courage = 'courage';
  static const calm = 'calm';
}

abstract class Locales {
  static const en_EN = {
    LocaleKeys.change_zh: 'change Chinese',
    LocaleKeys.change_en: 'change English',
    LocaleKeys.home: 'Home',
    LocaleKeys.diligent: 'Diligent',
    LocaleKeys.determination: 'Determination',
    LocaleKeys.courage: 'Courage',
    LocaleKeys.calm: 'Calm',
  };
  static const zh_CN = {
    LocaleKeys.change_zh: '切换中文',
    LocaleKeys.change_en: '切换英文',
    LocaleKeys.home: '首页',
    LocaleKeys.diligent: '勤勉',
    LocaleKeys.determination: '决心',
    LocaleKeys.courage: '勇气',
    LocaleKeys.calm: '平静',
  };

  Locales(String languageCode, String countryCode);
}
