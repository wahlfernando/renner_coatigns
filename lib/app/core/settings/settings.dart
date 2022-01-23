const String kURL_TEST = 'https://public.api.rennercoatings.asteria.work/testes';
const String kURL_QA = 'https://public.api.rennercoatings.asteria.work';
const String kURL_DEV = 'https://public.api.rennercoatings.asteria.work';
const String kURL_PROD = 'https://public.api.rennercoatings.asteria.work';


enum Modo { TEST, QA, DEV, PROD }

class Settings {
  static Modo buildMode = Modo.TEST;

  static String get apiURL {
    switch (buildMode) {
      case Modo.PROD:
        return kURL_PROD;
      case Modo.DEV:
        return kURL_DEV;
      case Modo.TEST:
        return kURL_TEST;
      case Modo.QA:
        return kURL_QA;
      default:
        return kURL_DEV;
    }
  }
}
