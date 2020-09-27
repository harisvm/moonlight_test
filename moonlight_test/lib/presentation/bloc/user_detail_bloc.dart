import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:moonlight_test/data/GlobalData.dart';
import 'package:moonlight_test/domain/repositories/repository.dart';

part 'user_detail_event.dart';

part 'user_detail_state.dart';

///bloc
class UserFeedBloc extends Bloc<UserFeedEvent, UserFeedState> {
  @override
  Stream<UserFeedState> mapEventToState(
    UserFeedEvent event,
  ) async* {
    yield InitialUserFeedState();

    ///loading main page
    if (event is LoadUsersList) {
      yield LoadData();
      try {
        GlobalData.userDetailList = await Repository().getUserDetails();

        yield UsersListLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();
      }
    }

    ///loading posts page
    if (event is LoadPostsByUsers) {
      yield LoadData();

      try {
        GlobalData.postListByUser = await Repository().getUserPosts();

        yield UserPostsLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();
      }
    }

    ///load comments on posts

    if (event is LoadCommentsOnPosts) {
      yield LoadData();

      try {
        GlobalData.commentsOnPost = await Repository().getCommentsByPost();

        yield CommentsOnPostLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();
      }
    }

    ///load todos by user
    if (event is LoadToDosList) {
      yield LoadData();

      try {
        GlobalData.toDosByUser = await Repository().getToDosByUser();

        yield TodosByUserLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();
      }
    }

    ///load albums by user
    if (event is LoadAlbumList) {
      yield LoadData();

      try {
        GlobalData.albumsByUser = await Repository().getAlbumsByUsers();

        yield AlbumListLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();
      }
    }    ///load photos by album
    if (event is LoadPhotosByAlbums) {
      yield LoadData();

      try {
        GlobalData.photosByAlbum = await Repository().getPhotosByAlbum();

        yield PhotosByAlbumLoaded();
      } catch (e) {
        print('---e---$e');

        yield CommonErrorState();
      }
    }
  }

  @override
  UserFeedState get initialState => InitialUserFeedState();
}
