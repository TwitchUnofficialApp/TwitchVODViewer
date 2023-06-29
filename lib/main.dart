import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'page/app_page.dart';
import 'page/history_page.dart';
import 'page/setting_page.dart';

void main() {
  runApp(MaterialApp(home: CustomNavigationView()));
}

class CustomNavigationView extends StatefulWidget {
  @override
  _CustomNavigationViewState createState() => _CustomNavigationViewState();
}

class _CustomNavigationViewState extends State<CustomNavigationView> {

  int _selectedIndex = 0;

  final List<Widget> _pages = [
    AppsPage(),
    HistoryPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.history),
                label: Text('History'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Navigator(
              pages: [
                MaterialPage(child: _pages[_selectedIndex]),
              ],
              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }

                setState(() {
                  _selectedIndex = 0;
                });

                return true;
              },
            ),
          ),
        ],
      ),
    );
  }
}