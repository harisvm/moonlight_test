part of 'user_detail_bloc.dart';

abstract class UserFeedEvent extends Equatable {
  const UserFeedEvent();
}

///load the userdetaillist on the main menu
class LoadUserFeed extends UserFeedEvent {
  @override
  List<Object> get props => [];
}
