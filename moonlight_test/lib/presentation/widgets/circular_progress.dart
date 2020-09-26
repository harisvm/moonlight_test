import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';

Widget showCircleProgress({double size = 30}) => Align(
  alignment: Alignment.center,
  child: SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(
      backgroundColor: AppColors.purpleLightHome,
      valueColor: new AlwaysStoppedAnimation<Color>(AppColors.purpleLight1),
    ),
  ),
);