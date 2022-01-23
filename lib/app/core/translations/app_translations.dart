import 'dart:ui';
import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:renner_coatings/app/core/translations/pt_BR/pt_br_translations.dart';
import 'package:renner_coatings/app/core/utils/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'en_US/en_us_translations.dart';
import 'es_ES/es_es_translations.dart';
import 'package:get/get.dart';


class TranslationService extends Translations {
  static Locale? get locale  => Get.deviceLocale;
  static final fallbackLocale = Locale('pt', 'BR');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'pt_BR': ptBr,
    'es_ES': esEs,
  };


}