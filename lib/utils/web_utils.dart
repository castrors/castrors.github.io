import 'web_utils_stub.dart' if (dart.library.html) 'web_utils_html.dart';

String? getSavedLocale() => getLocaleFromStorage();
void saveLocale(String locale) => saveLocaleToStorage(locale);
void updateUrlLocale(String locale) => updateUrlLocaleInBrowser(locale);
