import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'store/navigation_store.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: CustomNavigationView()));
}

class CustomNavigationView extends StatelessWidget {
  final NavigationStore store = NavigationStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: store.selectedIndex,
            onDestinationSelected: store.onNavigationItemSelected,
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
            child: Observer(
              builder: (_) => Navigator(
                pages: [
                  MaterialPage(child: store.pages[store.selectedIndex]),
                ],
                onPopPage: (route, result) {
                  if (!route.didPop(result)) {
                    return false;
                  }
                  return true;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}