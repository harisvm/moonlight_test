import 'package:moonlight_test/data/data_sources/api_provider.dart';
import 'package:moonlight_test/data/models/albums_by_user_model.dart';
import 'package:moonlight_test/data/models/comments_on_posts_model.dart';
import 'package:moonlight_test/data/models/photos_by_album_model.dart';
import 'package:moonlight_test/data/models/posts_by_users_model.dart';
import 'package:moonlight_test/data/models/to_dos_by_user_model.dart';
import 'package:moonlight_test/data/models/user_detail_model.dart';

class Repository {
  UsersApiProvider usersApiProvider = UsersApiProvider();

/// fetching data for main page
  Future<List<UserDetailModel>> getUserDetails({Map<String, dynamic> params}) =>
      usersApiProvider.getUserDetails();
 /// fetching posts done by user
  Future<List<PostByUsersModel>> getUserPosts({Map<String, dynamic> params}) =>
      usersApiProvider.getPostsByUsers();
 /// get comments on posts 
  Future<List<CommentsOnPostsModel>> getCommentsByPost({Map<String, dynamic> params}) =>
      usersApiProvider.getCommentsByPost();
  /// get comments on posts
  Future<List<TodosByUserModel>> getToDosByUser({Map<String, dynamic> params}) =>
      usersApiProvider.getToDosByUser();

  /// get albums by users
  Future<List<AlbumsByUserModel>> getAlbumsByUsers({Map<String, dynamic> params}) =>
      usersApiProvider.getAlbumsByUser();

  /// get photos by album
  Future<List<PhotosByAlbumModel>> getPhotosByAlbum({Map<String, dynamic> params}) =>
      usersApiProvider.getPhotosByAlbum();

}


