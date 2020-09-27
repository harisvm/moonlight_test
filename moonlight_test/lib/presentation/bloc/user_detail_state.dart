part of 'user_detail_bloc.dart';
///states
abstract class UserFeedState extends Equatable {
  const UserFeedState();
}
///initial state
class InitialUserFeedState extends UserFeedState {
  @override
  List<Object> get props => [];
}

///state returned when data is loaded
class LoadData extends UserFeedState {
  @override
  List<Object> get props => [];
}
/// when the users list are loaded this state is returned
class UsersListLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}
/// when posts by a specific user are loaded this state is returned
class UserPostsLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}

/// when comments on  a specific post are loaded this state is returned
class CommentsOnPostLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}

/// when todos list of a specific user is loaded this state is returned
class TodosByUserLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}

/// when album list of a specific user is loaded this state is returned
class AlbumListLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}

/// when photos inside an album is loaded this state is returned
class PhotosByAlbumLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}
///error state
class CommonErrorState extends UserFeedState {
  @override
  List<Object> get props => [];
}
