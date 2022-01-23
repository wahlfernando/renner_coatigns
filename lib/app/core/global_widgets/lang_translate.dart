import 'package:get/get.dart';

enum Lang { pt, es, en }

class LangTranslate {
  Lang get myLang {
    var locale = Get.locale;

    Lang lang;

    switch (locale!.languageCode) {
      case "pt":
        lang = Lang.pt;
        break;
      case "es":
        lang = Lang.es;
        break;
      case "en":
        lang = Lang.en;
        break;
      default:
        lang = Lang.pt;
    }

    return lang;
  }
}
