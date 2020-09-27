import 'package:moonlight_test/data/models/albums_by_user_model.dart';
import 'package:moonlight_test/data/models/comments_on_posts_model.dart';
import 'package:moonlight_test/data/models/photos_by_album_model.dart';
import 'package:moonlight_test/data/models/posts_by_users_model.dart';
import 'package:moonlight_test/data/models/to_dos_by_user_model.dart';
import 'package:moonlight_test/data/models/user_detail_model.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';

class GlobalData {
  ///user details list - for main page
  static List<UserDetailModel> userDetailList = [];

  ///user posts list - for  page - post

  static List<PostByUsersModel> postListByUser = [];

  ///comments done on individual post
  static List<CommentsOnPostsModel> commentsOnPost = [];


  ///todos of a particular user
  static List<TodosByUserModel> toDosByUser = [];

  ///albums  of a particular user
  static List<AlbumsByUserModel> albumsByUser = [];


  ///photos  inside a particular album
  static List<PhotosByAlbumModel> photosByAlbum = [];

  ///querying by userId
  static int userId;
  ///querying photos by album
  static int albumId;
  ///querying by postId

  static int postId;
}
