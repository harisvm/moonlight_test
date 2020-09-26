import 'package:flutter/material.dart';
import 'package:moonlight_test/presentation/user_details/user_detail_list.dart';

import 'config/theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obzo',
      theme: AppTheme.of(context),
      debugShowCheckedModeBanner: false,
      initialRoute: UserDetailList.route,
      routes: appRoutes(),
    );
  }


  Map<String, WidgetBuilder> appRoutes() {
    return <String, WidgetBuilder>{
      UserDetailList.route: (context) => UserDetailList(),
    
    };
  }
}