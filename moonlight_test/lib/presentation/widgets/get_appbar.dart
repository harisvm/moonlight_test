
import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';

///custom app bar - name can be customised according to screens
AppBar getAppBar(context, {String title = ''}) {
  final textTheme = Theme.of(context).textTheme;
  return AppBar(
    backgroundColor: AppColors.white,
    elevation: 2,
    title: Text(
      title,
      style: textTheme.headline6.copyWith(color: Colors.black),
    ),
  );
}