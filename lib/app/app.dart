import 'package:blog/app/cubit/app_cubit.dart';
import 'package:blog/bottom_tab/bottom_tab.dart';
import 'package:blog/extensions/extensions.dart';
import 'package:blog/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.select((AppCubit cubit) => cubit.state);
    final theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme:
            theme.colorScheme.copyWith(secondary: const Color(0xFF20bf6b)),
        appBarTheme: const AppBarTheme(color: Color(0xFF20bf6b)),
      ),
      locale: Locale(currentLocale.currentValue()),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const BottomTabPage(),
    );
  }
}
