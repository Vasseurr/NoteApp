import 'package:flutter/material.dart';
import 'package:note_padd/core/init/cache/secure_storage_manager.dart';
import 'package:note_padd/core/init/navigation/navigation_service.dart';
import '../../constants/bottom_nav_bar_constant.dart';

class NavigationNotifier with ChangeNotifier {
  BottomNavBarConstant _currentBody = BottomNavBarConstant.HOME;
  BottomNavBarConstant canPopBody;

  Map<BottomNavBarConstant, Widget> viewList = {
    /*
    BottomNavBarConstant.HOME: HomePage(),
    BottomNavBarConstant.DAVET: Invite(),
    BottomNavBarConstant.HOSTACCOUNT: HostAccount(),
    BottomNavBarConstant.ESTATEACCOUNT: EstateAccount(),
    BottomNavBarConstant.TENANTACCOUNT: TenantAccount(),
    BottomNavBarConstant.SETTINGS: Settings(),
    BottomNavBarConstant.NOTIFICATION: NotificationPage(),
 */
  };

  BottomNavBarConstant get currentBody => _currentBody;

  set currentBody(BottomNavBarConstant appBody) {
    _currentBody = appBody;
    notifyListeners();
  }

  changeBody(BottomNavBarConstant appBody, BuildContext context) {
    canPopBody = BottomNavBarConstant.HOME;
    currentBody = appBody;
  }

  exitToApp(BuildContext context) async {
    SecureStorageManager.instance.deleteAll();

// session temizle
  }

  Future<bool> onWillPop(BuildContext context) async {
    print("OnWillPop");

    if (canPopBody != null) {
      if (canPopBody != BottomNavBarConstant.NONE) {
        currentBody = canPopBody;
      } else if (canPopBody == BottomNavBarConstant.NONE) {
        return true;
      } else {
        return false;
      }
    }

    return false;
  }
}
