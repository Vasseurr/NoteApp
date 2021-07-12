import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

// concrete
class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String content;
  final String okButtonText;
  final String cancelButtonText;

  // show dialog methodunu iceri aktardık.
  Future<bool> goster(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog(
            context: context, builder: (context) => this)
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible: false);
  }

  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.okButtonText,
      this.cancelButtonText});

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _dialogButtonsSettings(context),
    );
  }

  @override
  Widget buildIosWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _dialogButtonsSettings(context),
    );
  }

  List<Widget> _dialogButtonsSettings(BuildContext context) {
    // ignore: non_constant_identifier_names
    final Buttons = <Widget>[];

    if (Platform.isIOS) {
      if (cancelButtonText != null) {
        Buttons.add(
          CupertinoDialogAction(
            child: Text(cancelButtonText),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        );
      }
      Buttons.add(
        CupertinoDialogAction(
          child: Text(okButtonText),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
    } else {
      if (cancelButtonText != null) {
        Buttons.add(
          // ignore: deprecated_member_use
          FlatButton(
            child: Text(cancelButtonText),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        );
      }
      Buttons.add(
        // ignore: deprecated_member_use
        FlatButton(
          child: Text(okButtonText),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      );
    }

    return Buttons;
  }
}
