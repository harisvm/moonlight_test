
import 'package:flutter/material.dart';
import 'package:moonlight_test/config/theme.dart';

AppBar getAppBar(context, {String title = ''}) {
  final textTheme = Theme.of(context).textTheme;
  return AppBar(
    backgroundColor: AppColors.lightGray,
    title: Text(
      title,
      style: textTheme.headline6.copyWith(color: Colors.black),
    ),
  );
}