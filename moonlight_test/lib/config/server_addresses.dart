import 'package:moonlight_test/data/GlobalData.dart';

///api end points
class ServerAddresses {
  ///host url
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';

  ///list of users
  static const userList = 'users';

  ///posts by user
  static const postsByUser = 'posts?userId=';

  ///albums by user

  static const albumsByByUser = 'albums?userId=';

  ///todos by user

  static const toDosByByUser = 'todos?userId=';

  ///comments on users posts
  static const commentsOnPosts = 'comments?postId=';



  ///photos by album
  static final photosByAlbum = 'photos';
}
