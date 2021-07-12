import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget_model/tab_model.dart';

class MyCustomBottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab; // callback method
  final Map<TabItem, Widget> pageCreater;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const MyCustomBottomNavigation(
      {Key key,
      @required this.currentTab,
      @required this.onSelectTab,
      @required this.pageCreater,
      @required this.navigatorKeys})
      : super(key: key); // callback

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _navItemCreater(TabItem.Home),
          _navItemCreater(TabItem.Users),
          _navItemCreater(TabItem.Profil),
        ],
        onTap: (index) => onSelectTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItem.values[index];
        return CupertinoTabView(
            // home page'den gelen navigator key
            navigatorKey: navigatorKeys[gosterilecekItem],
            builder: (context) {
              // gösterilecek tab hangisiyse ona göre sayfa build ediyoruz
              return pageCreater[gosterilecekItem];
            });
      },
    );
  }

  BottomNavigationBarItem _navItemCreater(TabItem tabItem) {
    // methoddan gelen dataset nesne doluyor
    final olusturulacakTab = TabItemData.tumTablar[tabItem];

    return BottomNavigationBarItem(
        icon: Icon(olusturulacakTab.icon), label: olusturulacakTab.title);
  }
}
