import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TabItem { Home, Users, Profil }

class TabItemData {
  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  // ilgili key gelirse ilgili valueyi oluştur
  static Map<TabItem, TabItemData> tumTablar = {  
    TabItem.Home: TabItemData("Ana Sayfa", Icons.home),
    TabItem.Users: TabItemData("Kullanıcılar", Icons.person_pin),
    TabItem.Profil: TabItemData("Profil", Icons.person)
  };
}
