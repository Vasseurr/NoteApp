import 'package:flutter/material.dart';

class YekButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final double radius;
  final double height;
  final Widget buttonIcon;
  final VoidCallback onPressed;
  final Color color;

  const YekButton(
      {Key key,
      @required this.buttonText,
      this.buttonColor,
      this.textColor: Colors.white,
      this.borderColor,
      this.radius: 4,
      this.height: 50,
      this.buttonIcon,
      @required this.onPressed,
      this.color})
      : assert(buttonText != null, onPressed != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: SizedBox(
        height: height,
        // ignore: deprecated_member_use
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor ?? Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(radius),
          ),
          color: buttonColor ?? Theme.of(context).buttonColor,
          child: Row(
            // spreads yöntemi ile null kontrolü
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (buttonIcon != null) ...[
                Opacity(
                    opacity: 1.0,
                    child: Container(height: 32, width: 32, child: buttonIcon)),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Opacity(
                    opacity: 0,
                    child: Container(height: 32, width: 32, child: buttonIcon))
              ],
              if (buttonIcon == null) ...[
                Container(),
                Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container()
              ]
            ],
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

// Eski Yöntem

/*              buttonIcon != null
                  ? Container(height: 24, width: 24, child: buttonIcon)
                  : Container(),
              Text(
                buttonText,
                style: TextStyle(color: textColor),
              ),
              buttonIcon != null
                  ? Opacity(
                      opacity: 0,
                      child:
                          Container(height: 32, width: 32, child: buttonIcon))


                  : Container(), */
