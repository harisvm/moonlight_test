import 'package:moonlight_test/config/server_addresses.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/data/models/albums_by_user_model.dart';
import 'package:moonlight_test/data/models/comments_on_posts_model.dart';
import 'package:moonlight_test/data/models/photos_by_album_model.dart';
import 'package:moonlight_test/data/models/posts_by_users_model.dart';
import 'package:moonlight_test/data/models/to_dos_by_user_model.dart';
import 'package:moonlight_test/data/models/user_detail_model.dart';
import 'package:moonlight_test/domain/entities/app_exceptions.dart';
import 'package:moonlight_test/domain/entities/rest_api.dart';
import 'package:moonlight_test/presentation/bloc/user_detail_bloc.dart';

class UsersApiProvider {
  ///user detail list  -home screen
  Future<List<UserDetailModel>> getUserDetails({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.userList);
      return userDetailModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }

///posts done by particular user
  Future<List<PostByUsersModel>> getPostsByUsers({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.postsByUser+GlobalData.userId.toString());
      return postByUsersModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  } 

  ///comments on individual posts
  Future<List<CommentsOnPostsModel>> getCommentsByPost({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.commentsOnPosts+GlobalData.postId.toString());
      return commentsOnPostsModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }

  ///todos by user
  Future<List<TodosByUserModel>> getToDosByUser({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.toDosByByUser+GlobalData.userId.toString());
      return todosByUserModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }
  ///albums by user
  Future<List<AlbumsByUserModel>> getAlbumsByUser({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.albumsByByUser+GlobalData.userId.toString());
      return albumsByUserModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }

  Future<List<PhotosByAlbumModel>> getPhotosByAlbum({Map<String, dynamic> params}) async {
    try {
      var res = await RestAPI()
          .get('${ServerAddresses.baseUrl}' + ServerAddresses.photosByAlbum+"?"+"userId=${GlobalData.userId.toString()}&albumId=${GlobalData.albumId.toString()}");
      return photosByAlbumModelFromMap(res);
    } on RestException catch (e) {
      throw e.message;
    }
  }
}
