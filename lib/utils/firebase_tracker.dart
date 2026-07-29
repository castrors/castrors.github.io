import 'firebase_tracker_stub.dart' if (dart.library.html) 'firebase_tracker_html.dart';

void initializeFirebaseTracker() => initTracker();
void trackPageView(String pageName) => trackPage(pageName);
void trackEvent(String eventName, [Map<String, dynamic>? parameters]) => trackCustomEvent(eventName, parameters);
void trackException(dynamic error, [StackTrace? stack]) => trackError(error, stack);
