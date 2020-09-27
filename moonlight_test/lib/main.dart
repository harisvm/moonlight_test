import 'package:flutter/material.dart';
import 'package:moonlight_test/presentation/user_details/album_photos.dart';
import 'package:moonlight_test/presentation/user_details/splash.dart';
import 'package:moonlight_test/presentation/user_details/user_albums.dart';
import 'package:moonlight_test/presentation/user_details/user_detail_list.dart';
import 'package:moonlight_test/presentation/user_details/user_posts.dart';
import 'package:moonlight_test/presentation/user_details/user_todos.dart';
import 'config/theme.dart';

///entry point
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
      initialRoute: Splash.route,
      routes: appRoutes(),
    );
  }

  ///routes
  Map<String, WidgetBuilder> appRoutes() {
    return <String, WidgetBuilder>{
      Splash.route: (context) => Splash(),
      UserDetailList.route: (context) => UserDetailList(),
      UserAlbums.route: (context) => UserAlbums(),
      UserPosts.route: (context) => UserPosts(),
      UserToDos.route: (context) => UserToDos(),
      AlbumPhotos.route: (context) => AlbumPhotos(),
    };
  }
}
