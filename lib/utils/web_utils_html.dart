// ignore_for_file: deprecated_member_use
import 'dart:html' as html;

String? getLocaleFromStorage() {
  try {
    final saved = html.window.localStorage['locale'];
    if (saved != null) return saved;

    // Detect browser language preferences
    final languages = html.window.navigator.languages;
    if (languages != null && languages.isNotEmpty) {
      final primary = languages.first.toLowerCase();
      if (primary.startsWith('pt')) return 'pt';
      if (primary.startsWith('en')) return 'en';
    }

    final language = html.window.navigator.language;
    final primary = language.toLowerCase();
    if (primary.startsWith('pt')) return 'pt';
    if (primary.startsWith('en')) return 'en';
  } catch (_) {}
  return null;
}

void saveLocaleToStorage(String locale) {
  try {
    html.window.localStorage['locale'] = locale;
  } catch (_) {}
}

void updateUrlLocaleInBrowser(String locale) {
  try {
    final uri = Uri.parse(html.window.location.href);
    final queryParams = Map<String, String>.from(uri.queryParameters);
    queryParams['lang'] = locale;
    final newUri = uri.replace(queryParameters: queryParams);
    html.window.history.replaceState(null, '', newUri.toString());
  } catch (_) {}
}
