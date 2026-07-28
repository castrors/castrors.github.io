import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_router/jaspr_router.dart';

import 'components/footer.dart';
import 'components/header.dart';
import 'components/translation_provider.dart';
import 'pages/apps.dart';
import 'pages/blog.dart';
import 'pages/home.dart';
import 'pages/links.dart';
import 'pages/post_detail.dart';
import 'utils/web_utils.dart';

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  String _locale = 'pt';

  @override
  void initState() {
    super.initState();
    final saved = getSavedLocale();
    if (saved != null && (saved == 'pt' || saved == 'en')) {
      _locale = saved;
    }
  }

  void toggleLocale() {
    setState(() {
      _locale = _locale == 'pt' ? 'en' : 'pt';
      saveLocale(_locale);
      updateUrlLocale(_locale);
    });
  }

  @override
  Component build(BuildContext context) {
    // Sync locale if url has 'lang' query parameter
    try {
      final uri = Uri.parse(context.url);
      final langParam = uri.queryParameters['lang'];
      if (langParam != null && (langParam == 'pt' || langParam == 'en') && langParam != _locale) {
        Future.microtask(() {
          setState(() {
            _locale = langParam;
            saveLocale(_locale);
          });
        });
      }
    } catch (_) {}

    // Maintain URL query parameter in sync on the client side
    try {
      Future.microtask(() {
        updateUrlLocale(_locale);
      });
    } catch (_) {}

    return TranslationProvider(
      locale: _locale,
      toggleLocale: toggleLocale,
      child: div([
        const Header(),
        Router(
          routes: [
            Route(path: '/', title: 'Journey | Rodrigo Castro', builder: (context, state) => const Home()),
            Route(path: '/blog', title: 'Blog | Rodrigo Castro', builder: (context, state) => const Blog()),
            Route(
              path: '/blog/detail',
              title: 'Artigo | Rodrigo Castro',
              builder: (context, state) => PostDetailPage(id: state.queryParams['id'] ?? ''),
            ),
            Route(path: '/links', title: 'Links | Rodrigo Castro', builder: (context, state) => const Links()),
            Route(path: '/apps', title: 'Apps | Rodrigo Castro', builder: (context, state) => const Apps()),
          ],
        ),
        const Footer(),
      ]),
    );
  }
}
