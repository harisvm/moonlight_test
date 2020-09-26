part of 'user_detail_bloc.dart';

abstract class UserFeedState extends Equatable {
  const UserFeedState();
}
///
class InitialUserFeedState extends UserFeedState {
  @override
  List<Object> get props => [];
}class UserFeedLoaded extends UserFeedState {
  @override
  List<Object> get props => [];
}class CommonErrorState extends UserFeedState {
  @override
  List<Object> get props => [];
}
