import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/index.dart';

import './page/app_page.dart';
import './page/history_page.dart';
import './page/setting_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: NavigationViewExample(),
      ),
    )
  );
}

class NavigationViewExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
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
              )
            ],
            selectedIndex: context.select((NavigationBloc bloc) {
              if (bloc.state is HomeState) {
                return 0;
              } else if (bloc.state is HistoryState) {
                return 1;
              } else if (bloc.state is SettingsState) {
                return 2;
              }
              return 0;
            }),
            onDestinationSelected: (int index) {
              if (index == 0) {
                context.read<NavigationBloc>().emit(HomeState());
              } else if (index == 1) {
                context.read<NavigationBloc>().emit(HistoryState());
              } else if (index == 2) {
                context.read<NavigationBloc>().emit(SettingsState());
              }
            },
          ),
          Expanded(
            child: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                if (state is HomeState) {
                  return AppsPage();
                } else if (state is HistoryState) {
                  return HistoryPage();
                } else if (state is SettingsState) {
                  return SettingPage();
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }

}