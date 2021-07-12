import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/bottom_nav_bar_constant.dart';
import '../../init/notifier/navigation_notifier.dart';

// ignore: must_be_immutable
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  AppBar appBar;
  List<Widget> widgets;
  BuildContext mainContext;

  BaseAppBar(this.appBar, this.mainContext);

  @override
  Widget build(BuildContext context) {
    var navigationNotifier =
        Provider.of<NavigationNotifier>(context, listen: true);

    return buildAppBarWithBody(navigationNotifier.currentBody, context);
  }

  Widget buildAppBarWithBody(
      BottomNavBarConstant appBody, BuildContext context) {
    switch (appBody) {
      case BottomNavBarConstant.HOME:
        return AppBar(
          iconTheme: IconThemeData(color: Colors.black87),
          backgroundColor: Color(0xfff3f3f3),
          backwardsCompatibility: false,
          centerTitle: true,
          title: Center(
            child: Container(
              color: Color(0xfff3f3f3),
              height: MediaQuery.of(context).size.height * 0.06,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<NavigationNotifier>()
                    .changeBody(BottomNavBarConstant.NOTIFICATION, context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.black45,
                  size: 24,
                ),
              ),
            ),
          ],
        );
        break;
      case BottomNavBarConstant.DAVET:
        return AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backwardsCompatibility: false,
          centerTitle: true,
          title: Text(
            "invite",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<NavigationNotifier>()
                    .changeBody(BottomNavBarConstant.NOTIFICATION, context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        );
        break;
      case BottomNavBarConstant.HOSTACCOUNT:
      case BottomNavBarConstant.ESTATEACCOUNT:
      case BottomNavBarConstant.TENANTACCOUNT:
        return AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backwardsCompatibility: false,
          centerTitle: true,
          title: Text(
            "myaccount",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<NavigationNotifier>()
                    .changeBody(BottomNavBarConstant.NOTIFICATION, context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        );
        break;
      case BottomNavBarConstant.SETTINGS:
        return AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backwardsCompatibility: false,
          centerTitle: true,
          title: Text(
            "settings_title",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<NavigationNotifier>()
                    .changeBody(BottomNavBarConstant.NOTIFICATION, context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        );
        break;
      case BottomNavBarConstant.NOTIFICATION:
        return AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backwardsCompatibility: false,
          centerTitle: true,
          title: Text(
            "notification",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            InkWell(
              onTap: () {
                context
                    .read<NavigationNotifier>()
                    .changeBody(BottomNavBarConstant.NOTIFICATION, context);
              },
              child: Container(
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.notifications_none_sharp,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        );
        break;
      default:
        return AppBar(
          title: Container(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        );
        break;
    }
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
