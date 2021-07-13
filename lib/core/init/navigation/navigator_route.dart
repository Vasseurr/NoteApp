import 'package:flutter/material.dart';
import 'package:note_padd/home/view/form.dart';
import 'package:note_padd/home/view/home_page.dart';

import '../../components/widgets/not_found.dart';
import '../../constants/navigations.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();

  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.NOTELIST:
        return normalNavigate(HomePage());
        break;
      case NavigationConstants.FORM:
        return normalNavigate(MyCustomForm());
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => NotFound(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
