import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'navigation_notifier.dart';
import 'theme_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider _instance;

  static ApplicationProvider get instance {
    if (_instance == null) {
      _instance = ApplicationProvider._init();
    }
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider<NavigationNotifier>(
      create: (context) => NavigationNotifier(),
    ),
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    )
  ];
}
