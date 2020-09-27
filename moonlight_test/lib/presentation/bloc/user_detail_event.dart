part of 'user_detail_bloc.dart';

///Events
abstract class UserFeedEvent extends Equatable {
  const UserFeedEvent();
}

///load the user detail list on the main menu
class LoadUsersList extends UserFeedEvent {
  @override
  List<Object> get props => [];
}

///load todos by a user
class LoadToDosList extends UserFeedEvent {
  @override
  List<Object> get props => [];
}

///load albums of a user

class LoadAlbumList extends UserFeedEvent {
  @override
  List<Object> get props => [];
}

///load photos by albums

class LoadPhotosByAlbums extends UserFeedEvent {

 LoadPhotosByAlbums();

  @override
  List<Object> get props => [];
}

///load posts done by individual users
class LoadPostsByUsers extends UserFeedEvent {
  @override
  List<Object> get props => [];
}

///load comments on posts
class LoadCommentsOnPosts extends UserFeedEvent {
  @override
  List<Object> get props => [];
}
