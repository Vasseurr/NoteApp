import 'package:flutter/material.dart';

import 'custom_appbar.dart';

class CliptAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: ClipPath(
          clipper: CustomAppBar(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [
                  0.1,
                  0.6,
                  0.5,
                  0.9
                ],
                    colors: [
                  Colors.indigo,
                  Colors.blue,
                  Colors.blue,
                  Colors.green.shade200
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Expermio',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'Expermio’ya Hoşgeldiniz!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 150));
  }
}
