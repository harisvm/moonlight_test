import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';


///custom circular progress bar - shown when data is being fetched from the internet
Widget showCircleProgress({double size = 30}) => Align(
  alignment: Alignment.center,
  child: SizedBox(
    width: size,
    height: size,
    child: CircularProgressIndicator(
      backgroundColor: AppColors.black,
      valueColor: new AlwaysStoppedAnimation<Color>(AppColors.green),
    ),
  ),
);
