import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';
import 'package:moonlight_test/presentation/user_details/user_detail_list.dart';

class Splash extends StatefulWidget {
  static const route = 'splash';
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(const Duration(milliseconds: 3000), onClose);
    super.initState();
    super.initState();
  }

  void onClose() {
    Navigator.pushReplacementNamed(context, UserDetailList.route);
  }

  @override
  Widget build(BuildContext context) {
    var _theme = AppTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[AppColors.lightGray, AppColors.lightGray],
        ),
      ),
      child: Scaffold(
        backgroundColor: AppColors.darkGray,
        body: Stack(
          children: <Widget>[
            Container(
              color: AppColors.darkGray,
              child: Center(
                  child: Text(
                'Moonlyte ',
                style:
                    _theme.textTheme.headline4.copyWith(color: AppColors.black),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
