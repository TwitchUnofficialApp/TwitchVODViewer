import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import '../page/app_page.dart';
import '../page/history_page.dart';
import '../page/setting_page.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {

  List<Widget> get pages => [
    AppsPage(),
    HistoryPage(),
    SettingPage(),
  ];

  @observable
  int selectedIndex = 0;

  @action
  void onNavigationItemSelected(int index) {
    selectedIndex = index;
  }

}