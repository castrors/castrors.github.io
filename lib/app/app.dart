// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:blog/bottom_tab/bottom_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:blog/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme:
            theme.colorScheme.copyWith(secondary: const Color(0xFF13B9FF)),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const BottomTabPage(),
    );
  }
}
