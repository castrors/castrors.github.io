// ignore_for_file: deprecated_member_use
import 'dart:js' as js;

void initTracker() {}

String? _lastPage;

void trackPage(String pageName) {
  try {
    if (_lastPage == pageName) return;
    _lastPage = pageName;
    
    if (js.context.hasProperty('firebaseAnalytics') && js.context['firebaseAnalytics'] != null) {
      final analytics = js.context['firebaseAnalytics'] as js.JsObject;
      analytics.callMethod('logEvent', [
        'screen_view',
        js.JsObject.jsify({
          'screen_name': pageName,
          'app_name': 'rodrigocastro_blog',
        }),
      ]);
    }
  } catch (e) {
    // ignore
  }
}

void trackCustomEvent(String eventName, [Map<String, dynamic>? parameters]) {
  try {
    if (js.context.hasProperty('firebaseAnalytics') && js.context['firebaseAnalytics'] != null) {
      final analytics = js.context['firebaseAnalytics'] as js.JsObject;
      analytics.callMethod('logEvent', [
        eventName,
        parameters != null ? js.JsObject.jsify(parameters) : null,
      ]);
    }
  } catch (e) {
    // ignore
  }
}

void trackError(dynamic error, [StackTrace? stack]) {
  try {
    if (js.context.hasProperty('firebaseAnalytics') && js.context['firebaseAnalytics'] != null) {
      final analytics = js.context['firebaseAnalytics'] as js.JsObject;
      analytics.callMethod('logEvent', [
        'exception',
        js.JsObject.jsify({
          'description': error.toString(),
          'fatal': true,
          'stack': stack?.toString() ?? '',
        }),
      ]);
    }
  } catch (e) {
    // ignore
  }
}
