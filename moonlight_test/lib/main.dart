import 'package:flutter/material.dart';
import 'package:moonlight_test/presentation/user_details/album_photos.dart';
import 'package:moonlight_test/presentation/user_details/user_albums.dart';
import 'package:moonlight_test/presentation/user_details/user_detail_list.dart';
import 'package:moonlight_test/presentation/user_details/user_posts.dart';
import 'package:moonlight_test/presentation/user_details/user_todos.dart';

import 'config/theme.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moonlyte',
      theme: AppTheme.of(context),
      debugShowCheckedModeBanner: false,
      initialRoute: UserDetailList.route,
      routes: appRoutes(),
    );
  }


  Map<String, WidgetBuilder> appRoutes() {
    return <String, WidgetBuilder>{
      UserDetailList.route: (context) => UserDetailList(),
      UserAlbums.route: (context) => UserAlbums(),
      UserPosts.route: (context) => UserPosts(),
      UserTodos.route: (context) => UserTodos(),
      AlbumPhotos.route: (context) => AlbumPhotos(),

    };
  }
}