import 'package:blog/bottom_tab/bottom_tab.dart';
import 'package:blog/l10n/l10n.dart';
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
    LinksBuilderWidget(),
    Text(
      'Links',
      style: optionStyle,
    ),
    Text(
      'Trips',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final _selectedIndex =
        context.select((BottomTabCubit cubit) => cubit.state.index);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rodrigo Castro's Adventures"),
      ),
      // body: const Center(child: BlogHeader()),
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseUser),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.feather),
            label: 'Blog',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.link),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.mapMarkedAlt),
            label: 'Viagens',
          ),
        ],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: (index) => context.read<BottomTabCubit>().select(index),
      ),
    );
  }
}
