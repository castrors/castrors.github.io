import 'dart:io';

Future<void> main() async {
  print('Starting server app for static generation...');
  final process = await Process.start(
    './build/app',
    [],
    environment: {
      'PORT': '8080',
    },
  );

  process.stdout.listen((data) => stdout.add(data));
  process.stderr.listen((data) => stderr.add(data));

  // Allow server time to bind to port
  await Future.delayed(const Duration(seconds: 3));

  final routes = [
    '/',
    '/blog',
    '/blog/detail',
    '/links',
    '/apps',
  ];

  final client = HttpClient();

  for (final route in routes) {
    print('Generating route: $route ...');
    try {
      final request = await client.getUrl(Uri.parse('http://127.0.0.1:8080$route'));
      final response = await request.close();

      final bytes = await response.fold<List<int>>([], (previous, element) => previous..addAll(element));

      final cleanRoute = route.endsWith('/') && route.length > 1 ? route.substring(0, route.length - 1) : route;
      final targetPath = cleanRoute == '/'
          ? 'build/jaspr/index.html'
          : 'build/jaspr$cleanRoute/index.html';

      final file = File(targetPath);
      await file.parent.create(recursive: true);
      await file.writeAsBytes(bytes);
      print('✓ Saved route $route -> $targetPath (${bytes.length} bytes)');
    } catch (e) {
      print('✗ Error generating route $route: $e');
    }
  }

  client.close();
  process.kill();
  print('Static pre-rendering finished successfully!');
}
