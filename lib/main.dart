import 'package:flutter/material.dart';
import 'package:note_padd/core/init/navigation/navigation_service.dart';
import 'package:note_padd/core/init/navigation/navigator_route.dart';
import 'package:note_padd/core/init/notifier/theme_notifier.dart';
import 'package:note_padd/home/view/home_page.dart';
import 'package:note_padd/locator.dart';
import 'package:provider/provider.dart';

import 'core/init/notifier/provider_list.dart';

void main() async {
  setupLocator();
  runApp(NoteApp());
}

class NoteApp extends StatefulWidget {
  @override
  _NoteAppState createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  // This widget is the root of your application.
  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: Consumer<ThemeNotifier>(
        builder: (context, value, child) => MaterialApp(
          navigatorKey: NavigationService.instance.navigatorKey,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
          theme: Provider.of<ThemeNotifier>(context).currentTheme,
          debugShowCheckedModeBanner: false,
          title: "Note App",
          home: HomePage(),
        ),
      ),
    );
  }
}
