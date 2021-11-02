import 'package:blog/app/cubit/app_cubit.dart';
import 'package:blog/bottom_tab/bottom_tab.dart';
import 'package:blog/l10n/l10n.dart';
import 'package:blog/links/links.dart';
import 'package:blog/posts/posts.dart';
import 'package:blog/trips/view/trips_page.dart';
import 'package:blog/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomTabPage extends StatelessWidget {
  const BottomTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomTabCubit(),
      child: const BottomTabView(),
    );
  }
}

class BottomTabView extends StatelessWidget {
  const BottomTabView({Key? key}) : super(key: key);
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HeaderWidget(),
    PostsPage(),
    LinksPage(),
    TripsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _selectedIndex =
        context.select((BottomTabCubit cubit) => cubit.state.index);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.homeTitle),
        actions: [
          MaterialButton(
            child: const TextWidget(
              text: 'Português 🇧🇷',
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AppCubit>().selectLocale(LocaleOptions.pt);
            },
          ),
          MaterialButton(
            child: const TextWidget(
              text: 'English 🇺🇸',
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AppCubit>().selectLocale(LocaleOptions.en);
            },
          ),
        ],
      ),
      // body: const Center(child: BlogHeader()),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseUser),
            label: l10n.tabHome,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.feather),
            label: l10n.tabBlog,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.link),
            label: l10n.tabLinks,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
            label: l10n.tabTrips,
          ),
        ],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) => context.read<BottomTabCubit>().selectTab(index),
      ),
    );
  }
}
